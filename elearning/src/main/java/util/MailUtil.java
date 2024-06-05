package util;

import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleRefreshTokenRequest;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.json.GoogleJsonError;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.gmail.Gmail;
import com.google.api.services.gmail.GmailScopes;
import com.google.api.services.gmail.model.Message;
import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.AccessToken;
import com.google.auth.oauth2.UserCredentials;
import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Message.RecipientType;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.InternetAddress;
import org.apache.commons.codec.binary.Base64;
import java.util.Date;
import java.util.Properties;
import java.util.Set;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.GeneralSecurityException;

public class MailUtil {
    private static class Token {
        @SerializedName("access_token")
        String accessToken;

        @SerializedName("expiration_time")
        long expirationTime;
        
        @SerializedName("scope")
        String scope;
        
        @SerializedName("token_type")
        String tokenType;
    }
    private static MailUtil INSTANCE;
    private static final String APPLICATION_NAME = "eLEARNING";
    private static final GsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
    private static final String CREDENTIALS_FILE_PATH = "/private/client_secret_894645171806-g002be2v42gva3i4bdu0h88r8l6q1jlg.apps.googleusercontent.com.json";
    private static final String TOKEN_FILE_PATH = "/private/token.json";
    private static NetHttpTransport httpTransport;
    
    private MailUtil() {
        try {
            httpTransport = GoogleNetHttpTransport.newTrustedTransport();
        } catch (IOException | GeneralSecurityException e) {
            e.printStackTrace();
        }
    }

    public static MailUtil getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new MailUtil();
        }
        return INSTANCE;
    }

    private UserCredentials getCredential() throws IOException {
        InputStream tokenStream = MailUtil.class.getResourceAsStream(TOKEN_FILE_PATH);
        if (tokenStream == null) {
            throw new FileNotFoundException("Resource not found: " + TOKEN_FILE_PATH);
        }
        InputStream secretStream = MailUtil.class.getResourceAsStream(CREDENTIALS_FILE_PATH);
        if (secretStream == null) {
            throw new FileNotFoundException("Resource not found: " + CREDENTIALS_FILE_PATH);
        }
        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(secretStream));
        String refreshToken = PropertyUtil.getProperty("/private/application.properties", "google.apis.refresh_token");
        Gson gson = new Gson();
        Token tokenData = gson.fromJson(new InputStreamReader(tokenStream), Token.class);
        tokenData = tokenData != null ? tokenData : new Token();
        if (tokenData.accessToken == null || tokenData.expirationTime <= new Date().getTime()) {
            TokenResponse tokenResponse = new GoogleRefreshTokenRequest(
                httpTransport, JSON_FACTORY, refreshToken,                                                         
                clientSecrets.getDetails().getClientId(), 
                clientSecrets.getDetails().getClientSecret()
            )
            .setScopes(Set.of(GmailScopes.GMAIL_COMPOSE))
            .setGrantType("refresh_token")
            .execute();
            tokenData.accessToken = tokenResponse.getAccessToken();
            tokenData.expirationTime = new Date().getTime() + (tokenResponse.getExpiresInSeconds() * 1000);
            tokenData.scope = tokenResponse.getScope();
            tokenData.tokenType = tokenResponse.getTokenType();
            try {
                File tokenFile = new File(MailUtil.class.getResource(TOKEN_FILE_PATH).toURI().getPath());
                try (FileWriter writer = new FileWriter(tokenFile)) {
                    gson.toJson(tokenData, writer);
                }
            } catch (URISyntaxException e) {
                e.printStackTrace();
            }
        }
        AccessToken accessToken = new AccessToken(tokenData.accessToken, new Date(tokenData.expirationTime));
        return UserCredentials.newBuilder()
                              .setAccessToken(accessToken)
                              .setRefreshToken(refreshToken)
                              .setClientId(clientSecrets.getDetails().getClientId())
                              .setClientSecret(clientSecrets.getDetails().getClientSecret())
                              .setTokenServerUri(URI.create("https://oauth2.googleapis.com/token"))
                              .build();
    }

    /**
     * Send an email from the user's mailbox to its recipient.
     *
     * @param fromEmailAddress - Email address to appear in the from: header
     * @param toEmailAddress   - Email address of the recipient
     * @param subject - Email's subject
     * @param content - Email's content
     * @param contentMimeType - Email's content type (eg: text/html)
     * @return the sent message, {@code null} otherwise.
     * @throws MessagingException - if a wrongly formatted address is encountered.
     * @throws IOException        - if service account credentials file not found.
     * @throws IllegalStateException - if gmail service is null
     */
    public Message sendEmail(String toEmailAddress, String fromEmailAddress, String subject, Object content, String contentMimeType)
            throws MessagingException, IOException, IllegalStateException {
        UserCredentials credentials = getCredential();
        Gmail gmail = new Gmail.Builder(httpTransport, JSON_FACTORY, new HttpCredentialsAdapter(credentials))
                               .setApplicationName(APPLICATION_NAME)
                               .build();
        if (gmail == null) {
            throw new IllegalStateException("Service hasn't been initialized.");
        }
        Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);
        MimeMessage email = new MimeMessage(session);

        email.setFrom(new InternetAddress(fromEmailAddress));
        email.setRecipient(RecipientType.TO, new InternetAddress(toEmailAddress));
        email.setSubject(subject);
        email.setContent(content, contentMimeType);
        
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        email.writeTo(buffer);
        byte[] bytes = buffer.toByteArray();
        String encodedEmail = Base64.encodeBase64URLSafeString(bytes);
        Message message = new Message();
        message.setRaw(encodedEmail);

        try {
            message = gmail.users().messages().send("me", message).execute();
            return message;
        } catch (GoogleJsonResponseException e) {
            GoogleJsonError error = e.getDetails();
            if (error.getCode() == 403) {
                System.err.println("Unable to send message: " + e.getDetails());
            } else {
                throw e;
            }
        }
        return null;
    }
}

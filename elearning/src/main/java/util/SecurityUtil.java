package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class SecurityUtil {
    private static byte[] generateSalt() {
        byte[] salt = new byte[16];
        new SecureRandom().nextBytes(salt);
        return salt;
    }

    private static String hashStringEncodeBase64(String str, byte[] salt)
            throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.reset();
        md.update(salt);
        byte[] hash = md.digest(str.getBytes());
        return Base64.getEncoder().encodeToString(hash);
    }

    public static String createHashSaltString(String str) {
        String res = null;
        byte[] salt = generateSalt();
        try {
            String hash = hashStringEncodeBase64(str, salt);
            res = hash + ":" + Base64.getEncoder().encodeToString(salt);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return res;
    }

    public static boolean equalsHashSalt(String hashsalt, String str) {
        String[] parts = hashsalt.split(":");
        String hash = parts[0];
        byte[] salt = Base64.getDecoder().decode(parts[1]);
        try {
            String strHash = hashStringEncodeBase64(str, salt);
            return strHash.equals(hash);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static String generateOTP() {
        String str = "0123456789";
        int len = 6;
        String otp = "";
        for (int i = 0; i < len; i++) {
            otp += str.charAt(((int) (Math.random() * 10)) % 10);
        }
        return otp;
    }
}

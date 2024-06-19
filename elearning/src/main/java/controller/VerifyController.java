package controller;

import java.io.IOException;
import java.net.URI;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.UUID;

import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.MailUtil;
import util.PropertyUtil;
import util.RandomUtil;

public class VerifyController extends HttpServlet {
    private String verifyEmail;
    private String redirectUrl;

    @Override
    public void init() throws ServletException {
        verifyEmail = null;
        redirectUrl = getServletContext().getContextPath() + "/login";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String url = req.getParameter("redirect_url");
        if (email != null) {
            verifyEmail = URLDecoder.decode(email, "UTF-8");
            String otp = RandomUtil.generateOTP();
            req.getSession().setAttribute("otp", otp);
            try {
                String fromEmailAddress = PropertyUtil.getProperty("/private/application.properties", "system.mail");
                MailUtil mail = MailUtil.getInstance();
                mail.sendEmail(verifyEmail, fromEmailAddress, "Verify your account", "Your otp code is " + otp, "text/html");
            } catch (IOException | MessagingException e) {
                e.printStackTrace();
            }
        }
        if (url != null) {
            redirectUrl = URLDecoder.decode(url, "UTF-8");
        }
        req.getRequestDispatcher("otp.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendError(400);
            return;
        }
        if (action.equals("verify")) {
            if (verifyEmail != null) {
                String otp = (String)req.getSession().getAttribute("otp");
                String verifyOTP = req.getParameter("verify_otp");
                if (otp == null || !otp.equals(verifyOTP)) {
                    req.setAttribute("message", "Confirm failed");
                    req.getRequestDispatcher("otp.jsp").forward(req, resp);
                }
                else {
                    req.getSession().removeAttribute("otp");
                    if (URI.create(redirectUrl).getQuery() == null) {
                        redirectUrl += "?verify_email=" + URLEncoder.encode(verifyEmail, "UTF-8");
                    }
                    else {
                        redirectUrl += "&verify_email=" + URLEncoder.encode(verifyEmail, "UTF-8");
                    }
                    String verifyId = UUID.randomUUID().toString();
                    req.getSession().setAttribute("verify_id", verifyId);
                    redirectUrl += "&verify_id=" + verifyId;
                    resp.sendRedirect(redirectUrl);
                }
            }
            return;
        }
        else if (action.equals("send_again")) {
            if (verifyEmail != null) {
                String otp = RandomUtil.generateOTP();
                req.getSession().setAttribute("otp", otp);
                try {
                    String fromEmailAddress = PropertyUtil.getProperty("/private/application.properties", "system.mail");
                    MailUtil mail = MailUtil.getInstance();
                    mail.sendEmail(verifyEmail, fromEmailAddress, "Verify your account", "Your otp code is " + otp, "text/html");
                } catch (IOException | MessagingException e) {
                    e.printStackTrace();
                }
                req.setAttribute("message", "OTP has been resent to your email.");
                req.getRequestDispatcher("otp.jsp").forward(req, resp);
            }
            return;
        }
    }
}

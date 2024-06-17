package controller;

import java.io.IOException;

import data_access.UserDataAccess;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.MailUtil;
import util.PropertyUtil;
import util.RandomUtil;

public class LoginController extends HttpServlet {
    private UserDataAccess userDAO;
    
    @Override
    public void init() throws ServletException {
        this.userDAO = UserDataAccess.getInstance();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String rememberMe = req.getParameter("remember_me");
        boolean isPasswordSet = userDAO.isPasswordSet(email);
        if (!isPasswordSet) {
            userDAO.updatePassword(email, password);
        }
        User user = userDAO.authenticate(email, password);
        if (user == null) {
            req.setAttribute("message", "Login Failed!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }
        if (!user.getAccount().isActivated()) {
            String userEmail = user.getAccount().getEmail();
            String otp = RandomUtil.generateOTP();
            req.getSession().setAttribute("otp", otp);
            try {
                String fromEmailAddress = PropertyUtil.getProperty("/private/application.properties", "system.mail");
                MailUtil mail = MailUtil.getInstance();
                mail.sendEmail(userEmail, fromEmailAddress, "Activate your account", "Your otp code is " + otp, "text/html");
            } catch (IOException | MessagingException e) {
                e.printStackTrace();
            }
            req.setAttribute("message", "You haven't activate your account. Confirm the OTP sent to your email.");
            req.setAttribute("email", userEmail);
            req.getRequestDispatcher("otp.jsp").forward(req, resp);
            return;
        }
        req.getSession().setAttribute("user", user);
        if (rememberMe != null && rememberMe.equals("true")) {
            Cookie userCookie = new Cookie("user_email", user.getAccount().getEmail());
            userCookie.setMaxAge(60 * 60 * 24 * 7);
            resp.addCookie(userCookie);
        }
        resp.sendRedirect(req.getContextPath());
    }
}

package controller;

import data_access.UserDataAccess;
import model.Account.Role;
import util.MailUtil;
import util.PropertyUtil;
import util.RandomUtil;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterController extends HttpServlet {
    private UserDataAccess userDAO;
    private String userEmail;

    @Override
    public void init() throws ServletException {
        this.userDAO = UserDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendError(400);
            return;
        }
        if (action.equals("register")) {
            userEmail = req.getParameter("email");
            String password = req.getParameter("password");
            
            if (userDAO.register(userEmail, password, Role.Student)) {
                String otp = RandomUtil.generateOTP();
                req.getSession().setAttribute("otp", otp);
                try {
                    String fromEmailAddress = PropertyUtil.getProperty("/private/application.properties", "system.mail");
                    MailUtil mail = MailUtil.getInstance();
                    mail.sendEmail(userEmail, fromEmailAddress, "Activate your account", "Your otp code is " + otp, "text/html");
                } catch (IOException | MessagingException e) {
                    e.printStackTrace();
                }
                req.getRequestDispatcher("otp.jsp").forward(req, resp);
            }
            else {
                req.setAttribute("message", "Register failed");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
            }
            return;
        }
        else if (action.equals("verify-otp")) {
            String otp = (String)req.getSession().getAttribute("otp");
            String reqOtp = req.getParameter("num1") 
                          + req.getParameter("num2")
                          + req.getParameter("num3")
                          + req.getParameter("num4")
                          + req.getParameter("num5")
                          + req.getParameter("num6");
            if (userEmail == null || otp == null || !otp.equals(reqOtp)) {
                req.setAttribute("message", "Confirm failed");
                req.getRequestDispatcher("otp.jsp").forward(req, resp);
            }
            else {
                userDAO.activate(userEmail);
                req.getSession().removeAttribute("otp");
                resp.sendRedirect(req.getContextPath() + "/login");
            }
            return;
        }
        else if (action.equals("resend-otp")) {
            String otp = RandomUtil.generateOTP();
            req.getSession().setAttribute("otp", otp);
            try {
                String fromEmailAddress = PropertyUtil.getProperty("/private/application.properties", "system.mail");
                MailUtil mail = MailUtil.getInstance();
                mail.sendEmail(userEmail, fromEmailAddress, "Activate your account", "Your otp code is " + otp, "text/html");
            } catch (IOException | MessagingException e) {
                e.printStackTrace();
            }
            req.setAttribute("message", "OTP has been resent to your email.");
            req.getRequestDispatcher("otp.jsp").forward(req, resp);
            return;
        }
    }
}

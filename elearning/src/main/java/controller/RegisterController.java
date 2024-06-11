package controller;

import data_access.UserDataAccess;
import model.Account.Role;
import util.MailUtil;
import util.PropertyUtil;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterController extends HttpServlet {
    private UserDataAccess userDAO;

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
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        userDAO.register(email, password, Role.Student);
        
        String otp = generateOTP();
        try {
            String fromEmailAddress = PropertyUtil.getProperty("/private/application.properties", "system.mail");
            MailUtil mail = MailUtil.getInstance();
            mail.sendEmail(email, fromEmailAddress, "Activate your account", "Your otp code is " + otp, "text/html");
        } catch (IOException | MessagingException e) {
            e.printStackTrace();
        }

        //TODO: dispatch to confirm otp page
        resp.sendRedirect(req.getContextPath() + "/login");
    }

    private String generateOTP() {
        String str = "0123456789";
        int len = 6;
        String otp = "";
        for (int i = 0; i < len; i++) {
            otp += str.charAt(((int) (Math.random() * 10)) % 10);
        }
        return otp;
    }
}

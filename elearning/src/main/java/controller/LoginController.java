package controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import data_access.UserDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

public class LoginController extends HttpServlet {
    private UserDataAccess userDAO;
    
    @Override
    public void init() throws ServletException {
        this.userDAO = UserDataAccess.getInstance();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null) {
            if (action.equals("forgot_pw")) {
                req.getRequestDispatcher("check_email.jsp").forward(req, resp);
            }
            else if (action.equals("fpw_set_pw")) {
                String id = req.getParameter("verify_id");
                String verifyId = (String)req.getSession().getAttribute("verify_id");
                if (id != null && id.equals(verifyId)) {
                    String verifyEmail = req.getParameter("verify_email");
                    if (verifyEmail != null) {
                        String email = URLDecoder.decode(verifyEmail, "UTF-8");
                        req.setAttribute("email", email);
                        req.setAttribute("set_pw_message", "Set your new password");
                        req.getRequestDispatcher("set_pw.jsp").forward(req, resp);
                    }
                }
                req.getSession().removeAttribute("verify_id");
            } 
            return;
        }
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendError(400);
            return;
        }
        if (action.equals("login")) {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String rememberMe = req.getParameter("remember_me");
            User user = userDAO.authenticate(email, password);
            if (user == null) {
                req.setAttribute("message", "Login Failed!");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
                return;
            }
            if (!user.getAccount().isActivated()) {
                String redirectUrl = req.getContextPath() + "/register?action=activate_account";
                resp.sendRedirect(req.getContextPath() + "/verify?email=" + URLEncoder.encode(email, "UTF-8") + "&redirect_url=" + URLEncoder.encode(redirectUrl, "UTF-8"));
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
        else if (action.equals("fpw_check_email")) {
            String email = req.getParameter("email");
            String redirectUrl = req.getContextPath() + "/login?action=fpw_set_pw";
            resp.sendRedirect(req.getContextPath() + "/verify?email=" + URLEncoder.encode(email, "UTF-8") + "&redirect_url=" + URLEncoder.encode(redirectUrl, "UTF-8"));
        }
    }
}

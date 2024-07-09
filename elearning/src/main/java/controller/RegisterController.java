package controller;

import data_access.UserDataAccess;
import model.User;
import model.Message;
import model.Account.Role;
import util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class RegisterController extends HttpServlet {
    private UserDataAccess dao;
    private ValidationUtil validator;

    @Override
    public void init() throws ServletException {
        dao = UserDataAccess.getInstance();
        validator = ValidationUtil.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String id = req.getParameter("verify_id");
        String verifyId = (String)req.getSession().getAttribute("verify_id");
        if (action != null && id != null && id.equals(verifyId)) {
            if (action.equals("activate_account")) {
                String verifyEmail = req.getParameter("verify_email");
                if (verifyEmail != null) {
                    String email = URLDecoder.decode(verifyEmail, "UTF-8");
                    dao.activate(email);
                    resp.sendRedirect(req.getContextPath() + "/login");
                }
            }
            else if (action.equals("check_email")) {
                String verifyEmail = req.getParameter("verify_email");
                if (verifyEmail != null) {
                    String email = URLDecoder.decode(verifyEmail, "UTF-8");
                    req.setAttribute("email", email);
                    req.getRequestDispatcher("set_pw.jsp").forward(req, resp);
                }
            }
            req.getSession().removeAttribute("verify_id");
            return;
        }
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendError(404);
            return;
        }
        HttpSession session = req.getSession();
        if (action.equals("register")) {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            if (validator.validateEmail(email) && validator.validatePassword(password)) {
                if (dao.register(email, password, Role.Student)) {
                    String redirectUrl = req.getContextPath() + "/register?action=activate_account";
                    resp.sendRedirect(req.getContextPath() + "/verify?email=" + URLEncoder.encode(email, "UTF-8") + "&redirect_url=" + URLEncoder.encode(redirectUrl, "UTF-8"));
                }
                else {
                    session.setAttribute("message", new Message(Message.Type.Error, "Register failed!"));
                    resp.sendRedirect(req.getContextPath() + "/register");
                }
            }
            else {
                session.setAttribute("message", new Message(Message.Type.Error, "Wrong email or password format"));
                resp.sendRedirect(req.getContextPath() + "/register");
            }
            return;
        }
        else if (action.equals("check_email")) {
            String email = req.getParameter("email");
            User user = dao.getUserByEmail(email);
            if (user == null) {
                session.setAttribute("message", new Message(Message.Type.Error, "Invalid user!"));
                resp.sendRedirect(req.getContextPath() + "/register");
            }
            else {
                if (dao.isPasswordSet(email)) {
                    session.setAttribute("message", new Message(Message.Type.Error, "Account is already registered!"));
                    resp.sendRedirect(req.getContextPath() + "/register");
                    return;
                }
                String redirectUrl = req.getContextPath() + "/register?action=check_email";
                resp.sendRedirect(req.getContextPath() + "/verify?email=" + URLEncoder.encode(email, "UTF-8") + "&redirect_url=" + URLEncoder.encode(redirectUrl, "UTF-8"));
            }
        }
        else if (action.equals("set_pw")) {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            if (validator.validatePassword(password)) {
                if (dao.updatePassword(email, password)) {
                    dao.activate(email);
                    resp.sendRedirect(req.getContextPath() + "/login");
                }
                else {
                    req.setAttribute("message", new Message(Message.Type.Error, "Set password failed!"));
                    req.getRequestDispatcher("set_pw.jsp").forward(req, resp);
                }
            }
            else {
                req.setAttribute("message", new Message(Message.Type.Error, "Wrong password format"));
                req.getRequestDispatcher("set_pw.jsp").forward(req, resp);
            }
        }
    }
}

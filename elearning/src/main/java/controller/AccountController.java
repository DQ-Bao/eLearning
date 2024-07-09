package controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import data_access.UserDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.User;
import model.Message;

public class AccountController extends HttpServlet {

    private UserDataAccess userDAO;
    
    @Override
    public void init() throws ServletException {
        this.userDAO = UserDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String id = req.getParameter("verify_id");
        String verifyId = (String)req.getSession().getAttribute("verify_id");
        if (action != null && id != null && id.equals(verifyId)) {
            if (action.equals("delete_account")) {
                String verifyEmail = req.getParameter("verify_email");
                if (verifyEmail != null) {
                    String email = URLDecoder.decode(verifyEmail, "UTF-8");
                    userDAO.deleteAccount(email);
                    resp.sendRedirect(req.getContextPath() + "/logout");
                }
            }
            req.getSession().removeAttribute("verify_id");
            return;
        }
        User user = (User)req.getSession().getAttribute("user");
        Account account = user.getAccount();
        req.setAttribute("account", account);
        req.getRequestDispatcher("/account_settings.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendError(404);
            return;
        }
        User user = (User)req.getSession().getAttribute("user");
        int accId = user.getAccount().getId();
        if (action.equals("change_pw")) {
            String oldPassword = req.getParameter("old_password");
            String newPassword = req.getParameter("new_password");
    
            User acc = userDAO.authenticate(user.getAccount().getEmail(), oldPassword);
            if (acc == null) {
                req.getSession().setAttribute("message", new Message(Message.Type.Error, "Wrong password"));
                resp.sendRedirect(req.getContextPath() + "/account");
            }
            else if (!userDAO.changePassword(accId, newPassword)) {
                req.getSession().setAttribute("message", new Message(Message.Type.Error, "Change password failed"));
                resp.sendRedirect(req.getContextPath() + "/account");
            }
            else {
                req.getSession().setAttribute("message", new Message(Message.Type.Success, "Change password success"));
                resp.sendRedirect(req.getContextPath() + "/logout");
            }
        }
        else if (action.equals("delete_account")) {
            String email = user.getAccount().getEmail();
            String redirectUrl = req.getContextPath() + "/register?action=delete_account";
            resp.sendRedirect(req.getContextPath() + "/verify?email=" + URLEncoder.encode(email, "UTF-8") + "&redirect_url=" + URLEncoder.encode(redirectUrl, "UTF-8"));
        }
    }
}

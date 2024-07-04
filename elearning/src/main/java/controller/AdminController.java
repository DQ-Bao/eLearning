package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Message;
import util.PropertyUtil;

import java.io.IOException;

public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null) {
            if (action.equals("log_out")) {
                req.getSession().removeAttribute("admin");
            }
        }
        req.getRequestDispatcher("/WEB-INF/admin/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String checkUserName = PropertyUtil.getProperty("/private/application.properties", "admin.username");
        String checkPassword = PropertyUtil.getProperty("/private/application.properties", "admin.password");
        if (username == null || password == null || 
            checkUserName == null || checkPassword == null || 
            !username.equals(checkUserName) || !password.equals(checkPassword)) {
            req.setAttribute("message", new Message(Message.Type.Error, "Invalid credentials!"));
            req.getRequestDispatcher("/WEB-INF/admin/login.jsp").forward(req, resp);
            return;
        }
        req.getSession().setAttribute("admin", username);
        resp.sendRedirect(req.getContextPath() + "/admin/home");
    }
}

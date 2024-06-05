package controller;

import java.io.IOException;

import data_access.UserDataAccess;
import jakarta.servlet.ServletException;
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
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = userDAO.authenticate(email, password);
        if (user == null) {
            req.setAttribute("message", "Login Failed!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
        else {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect(req.getContextPath());
        }
    }
}

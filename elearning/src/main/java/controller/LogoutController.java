package controller;

import java.io.IOException;

import data_access.UserDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User)req.getSession().getAttribute("user");
        UserDataAccess.getInstance().removeUserLogin(user.getAccount().getId());
        req.getSession().removeAttribute("user");

        Cookie userCookie = new Cookie("user_login", "");
        userCookie.setMaxAge(0);
        resp.addCookie(userCookie);
        
        resp.sendRedirect(req.getContextPath());
    }
}

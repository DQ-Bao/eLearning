package controller;

import java.io.IOException;

import data_access.ManagerDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Manager;


public class ManagerController extends HttpServlet {
    private ManagerDataAccess dao;

    @Override
    public void init() throws ServletException {
        dao = ManagerDataAccess.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Manager manager = dao.getManagerByName(name);
        request.setAttribute("manager", manager);
        request.getRequestDispatcher("manager.jsp").forward(request, response);
    }
}

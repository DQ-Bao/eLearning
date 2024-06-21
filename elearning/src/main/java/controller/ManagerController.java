package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import model.Manager; // Assuming you have a Manager model class
import service.ManagerService; // Assuming you have a ManagerService to handle database operations

public class ManagerController extends HttpServlet {

    private ManagerService managerService;

    @Override
    public void init() throws ServletException {
        super.init();
        managerService = new ManagerService(); // Initialize your service layer
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve managers from the database using ManagerService
        List<Manager> managers = managerService.getAllManagers();
        
        // Set managers as a request attribute
        request.setAttribute("managers", managers);
        
        // Forward the request to the manager.jsp view for rendering
        request.getRequestDispatcher("/WEB-INF/view/manager.jsp").forward(request, response);
    }

}

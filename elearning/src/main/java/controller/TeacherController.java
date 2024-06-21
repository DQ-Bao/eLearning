package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



import model.Teacher; // Assuming you have a Teacher model class
import service.TeacherService; // Assuming you have a TeacherService to handle database operations

public class TeacherController extends HttpServlet {

    private TeacherService teacherService;

    @Override
    public void init() throws ServletException {
        super.init();
        teacherService = new TeacherService(); // Initialize your service layer
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Teacher> teachers = teacherService.getAllTeachers(); // Retrieve teachers from database
        request.setAttribute("teachers", teachers); // Set teachers as a request attribute
        request.getRequestDispatcher("/WEB-INF/view/teacher.jsp").forward(request, response); // Forward to JSP
    }
}
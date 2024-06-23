package controller;

import java.io.IOException;
import model.Teacher;
import data_access.TeacherDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TeacherController extends HttpServlet {
    private TeacherDataAccess dao;

    @Override
    public void init() throws ServletException {
        dao = TeacherDataAccess.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = dao.getTeacherById(id);
        request.setAttribute("teacher", teacher);
        request.getRequestDispatcher("teacher.jsp").forward(request, response);
    }
}

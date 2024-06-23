package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;
import java.util.List;
import java.io.IOException;
import data_access.CourseDataAccess;

public class CourseCatalogController extends HttpServlet {
    private CourseDataAccess dao;

    @Override
    public void init() throws ServletException {
        dao = CourseDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category");
        List<Course> courseList = null;
        if (category != null) {
            courseList = dao.getAllCoursesOfCategory(category);
        }
        else {
            courseList = dao.getAllCourses();
        }
        if (courseList != null) {
            req.setAttribute("course_list", courseList);
        }
        req.getRequestDispatcher("course_catalog.jsp").forward(req, resp);
        return;
    }
}
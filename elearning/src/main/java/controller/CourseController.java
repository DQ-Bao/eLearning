package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;
import model.CourseContent;
import model.Teacher;
import java.util.List;
import java.io.IOException;
import data_access.CourseDataAccess;

public class CourseController extends HttpServlet {
    private CourseDataAccess dao;

    @Override
    public void init() throws ServletException {
        dao = CourseDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getPathInfo();
        if (idStr == null || idStr.equals("/")) {
            resp.sendRedirect(req.getContextPath() + "/courses");
            return;
        }
        idStr = idStr.substring(1);
        if (!idStr.matches("^[0-9]+$")) {
            resp.sendError(404);
            return;
        }
        int id = Integer.parseInt(idStr);
        List<CourseContent> contentList = dao.getAllContentsOfCourse(id);
        List<Teacher> teacherList = dao.getAllTeachersOfCourse(id);
        Course course = dao.getCourseById(id);
        req.setAttribute("teacher_list", teacherList);
        req.setAttribute("content_list", contentList);
        req.setAttribute("course", course);
        req.getRequestDispatcher("/course_detail.jsp").forward(req, resp);
    }
}
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;
import model.Category;
import model.Lesson;
import model.User;
import java.util.List;
import java.io.IOException;
import data_access.CourseDataAccess;

public class CourseController extends HttpServlet {
    private CourseDataAccess dao;

    @Override
    public void init() {
        dao = CourseDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idStr = req.getParameter("id");
        if (idStr == null) {

            List<Course> list = dao.getAllCourses();
            List<Category> listcate = dao.getAllCategories();
            req.setAttribute("categorylist", listcate);
            req.setAttribute("courselist", list);
            req.getRequestDispatcher("courses.jsp").forward(req, resp);
        } else {
            
            int id = Integer.parseInt(idStr);
            List<Lesson> lessonlist = dao.getAllLessons(id);
            List<User> teacherlist = dao.getAllTeachers(id);
            Course course = dao.getCourse(id);
            req.setAttribute("teacherlist", teacherlist);
            req.setAttribute("lessonlist", lessonlist);
            req.setAttribute("course", course);
            req.getRequestDispatcher("coursedetails.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
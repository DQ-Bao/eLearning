package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Course;
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
            List<Course> courseList = dao.getAllCourses();
            List<String> cateList = dao.getAllCategories();
            req.setAttribute("category_list", cateList);
            req.setAttribute("course_list", courseList);
            req.getRequestDispatcher("courses.jsp").forward(req, resp);
        } else {
            int id = Integer.parseInt(idStr);
            List<Lesson> lessonlist = dao.getAllLessonsOfCourse(id);
            List<User> teacherlist = dao.getAllTeachersOfCourse(id);
            Course course = dao.getCourseById(id);
            req.setAttribute("teacherlist", teacherlist);
            req.setAttribute("lessonlist", lessonlist);
            req.setAttribute("course", course);
            req.getRequestDispatcher("course_detail.jsp").forward(req, resp);
        }

    }
}
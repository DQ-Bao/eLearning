package controller;

import data_access.CourseContentDataAccess;
import data_access.TeacherDataAccess;
import model.Lesson;
import model.Teacher;
import util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LessonController extends HttpServlet {
    private CourseContentDataAccess lessonDAO;
    private TeacherDataAccess teacherDAO;
    private ValidationUtil validator;

    @Override
    public void init() throws ServletException {
        lessonDAO = CourseContentDataAccess.getInstance();
        teacherDAO = TeacherDataAccess.getInstance();
        validator = ValidationUtil.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getPathInfo();
        if (idStr == null || idStr.equals("/") || !validator.validateInt(idStr.substring(1))) {
            resp.sendError(404);
            return;
        }
        int id = Integer.parseInt(idStr.substring(1));
        Lesson lesson = lessonDAO.getLessonById(id);
        Teacher teacher = teacherDAO.getTeacherById(lesson.getTeacherId());
        req.setAttribute("lesson", lesson);
        req.setAttribute("teacher", teacher);
        req.getRequestDispatcher("/lesson.jsp").forward(req, resp);
    }
}

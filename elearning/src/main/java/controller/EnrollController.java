package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Message;
import model.User;

import java.io.IOException;

import data_access.EnrollmentDataAccess;

public class EnrollController extends HttpServlet {
    private EnrollmentDataAccess dao;

    @Override
    public void init() throws ServletException {
        dao = EnrollmentDataAccess.getInstance();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendError(404);
            return;
        }
        if (action.equals("enroll")) {
            String idStr = req.getParameter("course_id");
            if (idStr == null || !idStr.matches("^[0-9]+$")) {
                resp.sendError(404);
                return;
            }
            int cid = Integer.parseInt(idStr);
            User user = (User)req.getSession().getAttribute("user");
            if (!dao.enrollStudent(user.getId(), cid)) {
                req.setAttribute("message", new Message(Message.Type.Error, "Enroll Failed!"));
                req.getRequestDispatcher("/courses/" + cid).forward(req, resp);
                return;
            }
            resp.sendRedirect(req.getContextPath() + "/courses/" + cid);
        }
    }
}

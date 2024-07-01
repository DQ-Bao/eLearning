package controller;

import model.Course;
import data_access.SearchDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SearchController extends HttpServlet {
    private SearchDataAccess dao;

    @Override
    public void init() throws ServletException {
        dao = SearchDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("search_query");
        if (query == null || query.equals("")) {
            resp.sendError(404);
            return;
        }
        List<Course> courseList = dao.searchCourses(query);
        req.setAttribute("course_list", courseList);
        req.getRequestDispatcher("/search.jsp").forward(req, resp);
    }
}

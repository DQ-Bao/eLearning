package controller;

import data_access.RequestDataAccess;
import model.Request;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AdminHomeController extends HttpServlet {
    private RequestDataAccess dao;

    @Override
    public void init() throws ServletException {
        dao = RequestDataAccess.getInstance();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Request> reqList = dao.getAllRequests();
        req.setAttribute("request_list", reqList);
        req.getRequestDispatcher("/WEB-INF/admin/home.jsp").forward(req, resp);
    }
}

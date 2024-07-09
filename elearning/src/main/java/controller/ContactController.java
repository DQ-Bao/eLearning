package controller;

import model.ContactRequest;
import model.Message;
import model.Request;
import util.ValidationUtil;
import data_access.RequestDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ContactController extends HttpServlet {
    private RequestDataAccess dao;
    private ValidationUtil validator;

    @Override
    public void init() throws ServletException {
        dao = RequestDataAccess.getInstance();
        validator = ValidationUtil.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/contact.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String orgName = req.getParameter("org_name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String message = req.getParameter("message");
        List<String> errors = new ArrayList<>();
        if (!validator.validateName(name)) {
            errors.add("Name should not have special symbols");
        }
        if (!validator.validateEmail(email)) {
            errors.add("Email should be in the correct format");
        }
        if (!validator.validatePhone(phone)) {
            errors.add("Phone number should be in the format 000-000-0000");
        }
        if (!errors.isEmpty()) {
            req.getSession().setAttribute("message", new Message.MessageBuilder(Message.Type.Error)
                                                                .addBoldText("Wrong data format").addLineBreak()
                                                                .addList(errors)
                                                                .build());
            resp.sendRedirect(req.getContextPath() + "/contact");
            return;
        }
        ContactRequest request = new ContactRequest(orgName, message, Request.Status.Pending, name, email, phone);
        if (!dao.addContactRequest(request)) {
            req.getSession().setAttribute("message", new Message(Message.Type.Error, "Send contact failed"));
        }
        else {
            req.getSession().setAttribute("message", new Message(Message.Type.Success, "Contact sent"));
        }
        resp.sendRedirect(req.getContextPath() + "/contact");
    }
}

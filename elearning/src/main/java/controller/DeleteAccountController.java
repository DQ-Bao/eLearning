package controller;

import java.io.IOException;

import data_access.UserDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteAccountController extends HttpServlet {
//Mai sau muon goi ham de xoa account thi nho them ?email =Email cua acccount dang login
    private UserDataAccess userDAO = UserDataAccess.getInstance();;
//delete?email=
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                String email = request.getParameter("email");
                if (userDAO.DeleteAccount(email)==true){
                    request.setAttribute("message", "delete Successfull");
                } else {request.setAttribute("message", "delete Failed");}
                // them duong dan 
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}

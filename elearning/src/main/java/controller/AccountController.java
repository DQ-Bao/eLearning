package controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import data_access.UserDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AccountController extends HttpServlet {

    private UserDataAccess userDAO;
    
    @Override
    public void init() throws ServletException {
        this.userDAO = UserDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String rawPasword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String cfPassword = req.getParameter("cfPassword");
        
        if(userDAO.authenticate(email, rawPasword)!=null){
            if(newPassword == cfPassword){
                if(userDAO.updatePassword(email, newPassword)){
                    req.setAttribute("message", "update password successfully");
                }else{
                    req.setAttribute("message", "update failed");
                }
            }
        }

        req.getRequestDispatcher("account_settings.jsp").forward(req, resp);
        
    }

}

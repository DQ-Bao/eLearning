package controller;

import java.io.IOException;
import data_access.UserDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.User;

public class AccountController extends HttpServlet {

    private UserDataAccess userDAO;
    
    @Override
    public void init() throws ServletException {
        this.userDAO = UserDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User)req.getSession().getAttribute("user");
        Account account = user.getAccount();
        req.setAttribute("account", account);
        req.getRequestDispatcher("/account_settings.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Id = req.getParameter("id");
        String email = req.getParameter("email");
        String rawPasword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String cfPassword = req.getParameter("cfPassword");

        int id = Integer.parseInt(Id);
        User acc = userDAO.authenticate(email, rawPasword);
        if(acc!=null){
            if(newPassword == cfPassword){
                if(userDAO.changePassword(acc.getId(), newPassword)||userDAO.updateEmail(acc.getId(), email)){
                    req.setAttribute("message", "update account successfully");
                }else{
                    req.setAttribute("message", "update failed");
                }
            }
        } else {  req.setAttribute("message", "Wrong email or password");}

        req.getRequestDispatcher("404.jsp").forward(req, resp);
        
    }

}

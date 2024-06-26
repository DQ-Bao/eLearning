package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import data_access.UserDataAccess;
import jakarta.mail.internet.ParseException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserProfileController extends HttpServlet {

    private UserDataAccess userDAO;
    
    @Override
    public void init() throws ServletException {
        this.userDAO = UserDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Id = req.getParameter("id");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String genderString = req.getParameter("gender");
        String dobString = req.getParameter("dob");
        String pimg = req.getParameter("pimg");

        boolean gender = Boolean.parseBoolean(genderString);
        boolean status = false;
        int id = Integer.parseInt(Id);
        Date dob = null;
        if (dobString != null && !dobString.trim().isEmpty()) {
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsedDate = dateFormat.parse(dobString);
                dob = new Date(parsedDate.getTime());
            } catch (ParseException e) {
                throw new ServletException("Invalid date format, please use yyyy-MM-dd", e);
            }
        } else {
            throw new ServletException("Date of birth cannot be null or empty");
        }

        

        if(firstName!=null){
            try {
                status = userDAO.updateFirstName(id, firstName);
            } catch (SQLException e) {
                
                e.printStackTrace();
            }
        }

        if(lastName!=null){
            try {
                status = userDAO.updateLastName(id, lastName);
            } catch (SQLException e) {
                
                e.printStackTrace();
            }
        }

        if(genderString!=null){
            try {
                status = userDAO.updateGender(id, gender);
            } catch (SQLException e) {
                
                e.printStackTrace();
            }
        }

        if(dob!=null){
            try {
                status = userDAO.updateDateOfBirth(id, dob);
            } catch (SQLException e) {
                
                e.printStackTrace();
            }
        }

        if(pimg!=null){
            try {
                status = userDAO.updateProfileImage(id, pimg);
            } catch (SQLException e) {
                
                e.printStackTrace();
            }
        }
        
        if(status==false){
            req.setAttribute("message", "Failed");
        }else{
            req.setAttribute("message", "Update Successfully");
        }

        req.getRequestDispatcher("user_profile.jsp").forward(req, resp);
    }


}

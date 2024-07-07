package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.time.LocalDate;
import data_access.UserDataAccess;
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
        boolean gender;
        if (genderString.equalsIgnoreCase("0")) {
            gender = false;
        } else {
            gender = true;
        }
        boolean status = false;
        int id = Integer.parseInt(Id);
        LocalDate dob = userDAO.convertStringToLocalDate(dobString);

        if (firstName != null) {
            status = userDAO.updateFirstName(id, firstName);
            
        } else {
            req.setAttribute(",", ",");
        }

        if (lastName != null) {

            status = userDAO.updateLastName(id, lastName);

        } else {
            req.setAttribute(",", ",");
        }

        if (genderString != null) {

            status = userDAO.updateGender(id, gender);

        } else {
            req.setAttribute(",", ",");
        }

        if (dob != null) {
            userDAO.updateDateOfBirth(id, dob);
        } else {
            req.setAttribute(",", ",");
        }

        if (pimg != null) {

            status = userDAO.updateProfileImage(id, pimg);

        } else {
            req.setAttribute(",", ",");
        }

        if (status == false) {
            req.setAttribute("message", "Failed");
        } else {
            req.setAttribute("message", "Update Successfully");
        }

        req.getRequestDispatcher("user_profile.jsp").forward(req, resp);
    }

}

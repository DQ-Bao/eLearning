package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import data_access.UserDataAccess;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Message;
import model.User;
import util.ImageUtil;

public class ProfileController extends HttpServlet {
    private UserDataAccess userDAO;

    @Override
    public void init() throws ServletException {
        this.userDAO = UserDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User)req.getSession().getAttribute("user");
        java.util.Date dob = null;
        if (user.getDateOfBirth() != null) {
            dob = java.util.Date.from(user.getDateOfBirth().atStartOfDay(ZoneId.systemDefault()).toInstant());
        }
        java.util.Date joinAt = null;
        if (user.getAccount().getCreatedAt() != null) {
            joinAt = java.util.Date.from(user.getAccount().getCreatedAt().atZone(ZoneId.systemDefault()).toInstant());
        }
        req.setAttribute("user", user);
        req.setAttribute("user_dob", dob);
        req.setAttribute("join_at", joinAt);
        req.getRequestDispatcher("/user_profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User)req.getSession().getAttribute("user");
        int id = user.getId();
        String oldImagePath = user.getProfileImagePath();
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendError(404);
            return;
        }
        if (action.equals("update_profile_image")) {
            if (req.getContentType() != null && req.getContentType().toLowerCase().contains("multipart/form-data")) {
                Part filePart = req.getPart("profile_image");
                String imagePath = null;
                if (filePart != null && filePart.getSize() > 0) {
                    ImageUtil.getInstance().deleteImage(oldImagePath);
                    imagePath = ImageUtil.getInstance().saveImage(filePart.getInputStream(), "", ImageUtil.ImageType.UserProfile);
                }
                if (imagePath == null || !userDAO.updateProfileImage(id, imagePath)) {
                    req.getSession().setAttribute("message", new Message(Message.Type.Error, "Update profile image failed!"));
                }
                else {
                    User newUser = userDAO.getUserByEmail(user.getAccount().getEmail());
                    if (newUser != null) {
                        req.getSession().setAttribute("user", newUser);
                    }
                    req.getSession().setAttribute("message", new Message(Message.Type.Success, "Update profile image success!"));
                }
                resp.sendRedirect(req.getContextPath() + "/profile");
            }
            else {
                resp.sendError(404);
            }
        }
        else if (action.equals("update_profile")) {
            String firstName = req.getParameter("first_name");
            String lastName = req.getParameter("last_name");
            User.Gender gender = User.stringToGender(req.getParameter("gender"));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String dobStr = req.getParameter("dob");
            LocalDate dob = null;
            if (dobStr != null) {
                dob = LocalDate.parse(dobStr, formatter);
            }
            User data = new User(firstName, lastName, gender, dob);
            if (!userDAO.updateUserProfile(id, data)) {
                req.getSession().setAttribute("message", new Message(Message.Type.Error, "Update profile failed!"));
            }
            else {
                User newUser = userDAO.getUserByEmail(user.getAccount().getEmail());
                if (newUser != null) {
                    req.getSession().setAttribute("user", newUser);
                }
                req.getSession().setAttribute("message", new Message(Message.Type.Success, "Update profile success!"));
            }
            resp.sendRedirect(req.getContextPath() + "/profile");
        }
    }
}

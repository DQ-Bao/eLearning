package data_access;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.sql.ResultSet;
import data_access.internal.DataAccess;
import model.Teacher;
import model.User.Gender;

public class TeacherDataAccess {
    private static TeacherDataAccess INSTANCE;

    private TeacherDataAccess() {

    }

    public static TeacherDataAccess getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new TeacherDataAccess();
        }
        return INSTANCE;
    }
    
    public Teacher getTeacherById(int id) {
        String sql = "select td.*, u.[first_name], u.[last_name], u.[gender], u.[date_of_birth], u.[profile_image]from [teacher_details] as td join [user] as u on td.[user_id] = u.[id] where td.[id] = ?;";
        Teacher teacher = null;
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int tid = res.getInt("id");
                int uid = res.getInt("user_id");
                int mid = res.getInt("manager_id");
                String firstName = res.getString("first_name");
                String lastName = res.getString("last_name");
                Gender gender = res.getBoolean("gender") ? Gender.Female : Gender.Male;
                LocalDate dob = null;
                if (res.getDate("date_of_birth") != null) {
                    dob = res.getDate("date_of_birth").toLocalDate();
                }
                String profileImagePath = res.getString("profile_image");
                String position = res.getString("position");
                String bio = res.getString("bio");
                teacher = new Teacher(uid, null, firstName, lastName, gender, dob, profileImagePath, tid, mid, position, bio);
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacher;
    }
}

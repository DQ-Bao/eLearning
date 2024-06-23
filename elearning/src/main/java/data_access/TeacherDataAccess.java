package data_access;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import data_access.internal.DataAccess;
import model.Teacher;

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
        String sql = "select td.*, u.[first_name], u.[last_name] from [teacher_details] as td join [user] as u on td.[user_id] = u.[id] where td.[id] = ?;";
        Teacher teacher = null;
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int tid = res.getInt("id");
                String firstName = res.getString("first_name");
                String lastName = res.getString("last_name");
                String position = res.getString("position");
                String bio = res.getString("bio");
                teacher = new Teacher(tid, firstName, lastName, position, bio);
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacher;
    }
}

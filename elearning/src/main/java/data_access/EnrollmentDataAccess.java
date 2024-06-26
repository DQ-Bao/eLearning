package data_access;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data_access.internal.DataAccess;
import model.Enrollment;

public class EnrollmentDataAccess {
    private static EnrollmentDataAccess INSTANCE;

    private EnrollmentDataAccess() {

    }

    public static EnrollmentDataAccess getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new EnrollmentDataAccess();
        }
        return INSTANCE;
    }

    public boolean enrollStudent(int studentId, int courseId) {
        String sql = "insert into [enrollment]([course_id], [student_id]) values(?, ?);";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, courseId);
            statement.setInt(2, studentId);
            statement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }

    public Enrollment getStudentEnrollmentOfCourse(int studentId, int courseId) {
        Enrollment enroll = null;
        String sql = "select * from [enrollment] where [course_id] = ? and [student_id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, courseId);
            statement.setInt(2, studentId);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int id = res.getInt("id");
                int cid = res.getInt("course_id");
                int sid = res.getInt("student_id");
                double grade = res.getDouble("grade");
                boolean passed = res.getBoolean("passed");
                enroll = new Enrollment(id, cid, sid, grade, passed);
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enroll;
    }
}

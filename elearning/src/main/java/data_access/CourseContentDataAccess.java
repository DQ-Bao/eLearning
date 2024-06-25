package data_access;

import data_access.internal.DataAccess;
import model.Lesson;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import org.commonmark.node.*;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;

public class CourseContentDataAccess {
    private static CourseContentDataAccess INSTANCE;

    private CourseContentDataAccess() {

    }

    public static CourseContentDataAccess getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new CourseContentDataAccess();
        }
        return INSTANCE;
    }

    public Lesson getLessonById(int id) {
        Lesson lesson = null;
        String sql = "select * from [lesson] where [id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            Parser parser = Parser.builder().build();
            statement.setInt(1, id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int lid = res.getInt("id");
                int cid = res.getInt("course_id");
                String title = res.getString("title");
                String mdContent = res.getString("content");
                Node document = parser.parse(mdContent);
                HtmlRenderer renderer = HtmlRenderer.builder().build();
                String content = renderer.render(document);
                int teacherId = res.getInt("created_by");
                java.sql.Timestamp temp = res.getTimestamp("created_at");
                LocalDateTime createdAt = null;
                if (temp != null) {
                    createdAt = temp.toLocalDateTime();
                }
                temp = res.getTimestamp("updated_at");
                LocalDateTime updatedAt = null;
                if (temp != null) {
                    updatedAt = temp.toLocalDateTime();
                }
                lesson = new Lesson(lid, cid, title, teacherId, content, createdAt, updatedAt);
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lesson;
    }
}

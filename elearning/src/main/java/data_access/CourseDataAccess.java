package data_access;

import data_access.internal.DataAccess;
import model.Course;
import model.CourseContent;
import model.Lesson;
import model.Manager;
import model.Quiz;
import model.User;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


public class CourseDataAccess {
    private static CourseDataAccess INSTANCE;

    private CourseDataAccess() {

    }

    public static CourseDataAccess getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new CourseDataAccess();
        }
        return INSTANCE;
    }

    public List<Course> getAllCourses() {
        List<Course> list = new ArrayList<>();
        String sql = "select c.*, cat.[name] as category_name, m.[org_name] from [course] as c join [category] as cat on c.[category_id] = cat.[id] join [manager_details] as m on c.[manager_id] = m.[id];";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int id = res.getInt("id");
                String title = res.getString("title");
                String description = res.getString("description");
                String language = res.getString("language");
                String categoryName = res.getString("category_name");
                double price = res.getDouble("price");
                String imagePath = res.getString("image_path");
                boolean active = res.getBoolean("active");
                boolean archived = res.getBoolean("archived");
                String orgName = res.getString("org_name");
                list.add(new Course(id, new Manager(orgName), title, description, language, categoryName, price, imagePath, active, archived));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Course> getAllCoursesOfCategory(String category) {
        List<Course> list = new ArrayList<>();
        String sql = "select c.*, cat.[name] as category_name, m.[org_name] from [course] as c join [category] as cat on c.[category_id] = cat.[id] join [manager_details] as m on c.[manager_id] = m.[id] where cat.[name] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, category);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int id = res.getInt("id");
                String title = res.getString("title");
                String description = res.getString("description");
                String language = res.getString("language");
                String categoryName = res.getString("category_name");
                double price = res.getDouble("price");
                String imagePath = res.getString("image_path");
                boolean active = res.getBoolean("active");
                boolean archived = res.getBoolean("archived");
                String orgName = res.getString("org_name");
                list.add(new Course(id, new Manager(orgName), title, description, language, categoryName, price, imagePath, active, archived));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<String> getAllCategories(){
        List<String> list = new ArrayList<>();
        String sql = "select [name] from [category];";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                String name = res.getString("name");
                list.add(name);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Course getCourseById(int id){
        Course course = null;
        String sql = "select c.*, cat.[name] as category_name, m.[org_name] from [course] as c join [category] as cat on c.[category_id] = cat.[id] join [manager_details] as m on c.[manager_id] = m.[id] where c.[id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int cid = res.getInt("id");
                String title = res.getString("title");
                String description = res.getString("description");
                String language = res.getString("language");
                String categoryName = res.getString("category_name");
                double price = res.getDouble("price");
                String imagePath = res.getString("image_path");
                boolean active = res.getBoolean("active");
                boolean archived = res.getBoolean("archived");
                String orgName = res.getString("org_name");
                course = new Course(cid, new Manager(orgName), title, description, language, categoryName, price, imagePath, active, archived);
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return course;
    }

    public List<CourseContent> getAllContentsOfCourse(int id){
        List<CourseContent> list = new ArrayList<>();
        String sql = "{call spGetAllContentsOfCourse(?)}";
        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sql)) {
            statement.setInt("Id", id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int lid = res.getInt("id");
                int courseId = res.getInt("course_id");
                String title = res.getString("title");
                int teacherId = res.getInt("created_by");
                String content = res.getString("content");
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
                list.add(new Lesson(lid, courseId, title, teacherId, content, createdAt, updatedAt));
            }
            if (statement.getMoreResults()) {
                res = statement.getResultSet();
                while (res.next()) {
                    int qid = res.getInt("id");
                    int courseId = res.getInt("course_id");
                    String title = res.getString("title");
                    String description = res.getString("description");
                    String contentPath = res.getString("content_file_path");
                    double weight = res.getDouble("weight");
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
                    list.add(new Quiz(qid, courseId, title, teacherId, description, contentPath, weight, createdAt, updatedAt));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<User> getAllTeachersOfCourse(int id){
        List<User> list = new ArrayList<>();
        String sql = "select u.* from [lesson] as l join [teacher_details] as td on l.[created_by] = td.[id] join [user] as u on td.[user_id] = u.[id] where l.[course_id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
               String first_name = res.getString("first_name");
               String last_name = res.getString("last_name");
               String profile_image = res.getString("profile_image");
               list.add(new User(first_name, last_name, profile_image));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}

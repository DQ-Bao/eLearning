package data_access;

import data_access.internal.DataAccess;
import model.Category;
import model.Course;
import model.Lesson;
import model.Manager;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        String sql = "select c.*, m.[org_name] from [course] as c join [manager_details] as m on c.[manager_id] = m.[id];";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                String imagePath = res.getString("imagePath");
                double price = res.getDouble("price");
                String title = res.getString("title");
                String language = res.getString("language");
                String orgName = res.getString("org_name");
                list.add(new Course(imagePath, price, title, language, new Manager(orgName)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Category> getAllCategories(){
        List<Category> listcate = new ArrayList<>();
        String sql = "select * from category;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                String name = res.getString("name");
                listcate.add(new Category(name));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listcate;
    }

    public Course getCourse(int id){
        Course course = null;
        String sql = "select * from [course] where [id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                String imagePath = res.getString("imagePath");
                double price = res.getDouble("price");
                String title = res.getString("title");
                String language = res.getString("language");
                String orgName = res.getString("org_name");
                String description = res.getString("description");
                course = new Course(imagePath, price, title, language, new Manager(orgName), description) ;
                break;
            }
            

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return course;
    }

    public List<Lesson> getAllLessons(int id){
        List<Lesson> lessonlist = new ArrayList<>();
        String sql = "select * from [lesson] where [course_id] = ?";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                String title = res.getString("title");
                lessonlist.add(new Lesson(title));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lessonlist;
    }

    public List<User> getAllTeachers(int id){
        List<User> teacherlist = new ArrayList<>();
        String sql = "select u.* from [lesson] as l join [teacher_details] as td on l.[created_by] = td.[id] join [user] as u on td.[user_id] = u.[id] where l.[course_id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
               
               String first_name = res.getString("first_name");
               String last_name = res.getString("last_name");
               String profile_image = res.getString("profile_image");
               teacherlist.add(new User(first_name, last_name, profile_image));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacherlist;
    }
}

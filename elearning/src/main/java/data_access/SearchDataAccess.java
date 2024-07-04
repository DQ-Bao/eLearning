package data_access;

import model.Course;
import model.Manager;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data_access.internal.DataAccess;

public class SearchDataAccess {
    private static SearchDataAccess INSTANCE;

    private SearchDataAccess() {

    }

    public static SearchDataAccess getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new SearchDataAccess();
        }
        return INSTANCE;
    }

    public List<Course> searchCourses(String query) {
        List<Course> list = new ArrayList<>();
        String sp = "{call spSearchCourses(?)}";
        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            statement.setString("Query", query);
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
                Manager manager = new Manager();
                manager.setOrgName(orgName);
                list.add(new Course(id, manager, title, description, language, categoryName, price, imagePath, active, archived));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}

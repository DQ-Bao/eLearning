package data_access;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import data_access.internal.DataAccess;
import model.Manager;

public class ManagerDataAccess {
    private static ManagerDataAccess INSTANCE;

    private ManagerDataAccess() {

    }

    public static ManagerDataAccess getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new ManagerDataAccess();
        }
        return INSTANCE;
    }
    
    public Manager getManagerById(int id) {
        String sql = "select md.* from [manager_details] where [id] = ?;";
        Manager manager = null;
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int tid = res.getInt("id");
                int uid = res.getInt("user_id");
                String orgName = res.getString("org_name");
                String description = res.getString("description");
                String country = res.getString("country");
                manager = new Manager(tid, uid, orgName, description, country);
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return manager;
    }

    public Manager getManagerByName(String name) {
        String sql = "select md.* from [manager_details] where [org_name] = ?;";
        Manager manager = null;
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, name);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int tid = res.getInt("id");
                int uid = res.getInt("user_id");
                String orgName = res.getString("org_name");
                String description = res.getString("description");
                String country = res.getString("country");
                manager = new Manager(tid, uid, orgName, description, country);
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return manager;
    }
}

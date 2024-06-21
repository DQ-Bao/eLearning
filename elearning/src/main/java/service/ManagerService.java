package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.Manager;

public class ManagerService {
    private DataSource dataSource;

    public ManagerService() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/mydb"); // Replace with your DataSource JNDI name
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<Manager> getAllManagers() {
        List<Manager> managers = new ArrayList<>();
        String sql = "SELECT * FROM manager_details";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Manager manager = new Manager();
                manager.setId(rs.getInt("id"));
                manager.setUserId(rs.getInt("user_id"));
                manager.setOrgName(rs.getString("org_name"));
                manager.setDescription(rs.getString("description"));
                manager.setCountry(rs.getString("country"));
                managers.add(manager);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return managers;
    }
}

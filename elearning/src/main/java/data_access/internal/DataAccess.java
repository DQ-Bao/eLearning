package data_access.internal;

import util.PropertyUtil;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.io.IOException;

public class DataAccess {
    private static Connection conn;
    
    public static Connection getConnection() {
        if (conn != null) {
            return conn;
        }
        try {
            String driver = PropertyUtil.getProperty("/private/application.properties", "db.driver");
            String dbName = PropertyUtil.getProperty("/private/application.properties", "db.name");
            String username = PropertyUtil.getProperty("/private/application.properties", "db.username");
            String password = PropertyUtil.getProperty("/private/application.properties", "db.password");
            Class.forName(driver);
            String connectionString = "jdbc:sqlserver://localhost:1433;databaseName=" + dbName + ";encrypt=false;trustServerCertificate=true;user=" + username + ";password=" + password;
            conn = DriverManager.getConnection(connectionString);
        } catch (ClassNotFoundException | SQLException | IOException e) {
            e.printStackTrace();
        }
        return conn;
    }
}

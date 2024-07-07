package data_access;

import data_access.internal.DataAccess;
import model.Account;
import model.AccountRequest.AccountData;
import model.Account.Role;
import model.User;
import model.User.Gender;
import util.SecurityUtil;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import com.microsoft.sqlserver.jdbc.SQLServerDataTable;

public class UserDataAccess {
    private static UserDataAccess INSTANCE;

    private UserDataAccess() {

    }

    public static UserDataAccess getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new UserDataAccess();
        }
        return INSTANCE;
    }

    public boolean register(String email, String password, Role role) {
        boolean success = false;
        String sp = "{call spRegisterAccount(?, ?, ?, ?)}";
        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            String dbPassword = SecurityUtil.createHashSaltString(password);

            statement.setString("Email", email);
            statement.setString("Password", dbPassword);
            statement.setString("Role", Account.roleToString(role));
            statement.registerOutParameter("Success", java.sql.Types.BIT);
            statement.execute();
            success = statement.getBoolean("Success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public User authenticate(String email, String password) {
        String sp = "{call spGetUserByEmail(?)}";
        User user = null;

        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            statement.setString("Email", email);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                String dbPassword = res.getString("password_hash");
                if (dbPassword == null) {
                    break;
                }
                if (SecurityUtil.equalsHashSalt(dbPassword, password)) {
                    int id = res.getInt("id");
                    String firstName = res.getString("first_name");
                    String lastName = res.getString("last_name");
                    Gender gender = res.getBoolean("gender") ? Gender.Female : Gender.Male;
                    LocalDate dob = null;
                    if (res.getDate("date_of_birth") != null) {
                        dob = res.getDate("date_of_birth").toLocalDate();
                    }
                    String profileImagePath = res.getString("profile_image");

                    int accountId = res.getInt("account_id");
                    String accountEmail = res.getString("email");
                    boolean activated = res.getBoolean("activated");
                    Role role = Role.valueOf(res.getString("role_name"));
                    LocalDateTime createdAt = null;
                    if (res.getTimestamp("created_at") != null) {
                        createdAt = res.getTimestamp("created_at").toLocalDateTime();
                    }
                    user = new User(
                            id, new Account(accountId, accountEmail, activated, role, createdAt),
                            firstName, lastName, gender, dob, profileImagePath);
                    break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean activate(String email) {
        boolean success = false;
        String sp = "{call spActivateAccount(?, ?)}";
        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            statement.setString("Email", email);
            statement.registerOutParameter("Success", java.sql.Types.BIT);
            statement.execute();
            success = statement.getBoolean("Success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public boolean storeUserLogin(int id, String token) {
        String sql = "update [account] set [login_token] = ? where [id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, token);
            statement.setInt(2, id);
            statement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeUserLogin(int id) {
        String sql = "update [account] set [login_token] = null where [id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public User getUserByLoginToken(String token) {
        User user = null;
        String sp = "{call spGetUserByLoginToken(?)}";
        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            statement.setString("Token", token);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int id = res.getInt("id");
                String firstName = res.getString("first_name");
                String lastName = res.getString("last_name");
                Gender gender = res.getBoolean("gender") ? Gender.Female : Gender.Male;
                LocalDate dob = null;
                if (res.getDate("date_of_birth") != null) {
                    dob = res.getDate("date_of_birth").toLocalDate();
                }
                String profileImagePath = res.getString("profile_image");

                int accountId = res.getInt("account_id");
                String accountEmail = res.getString("email");
                boolean activated = res.getBoolean("activated");
                Role role = Role.valueOf(res.getString("role_name"));
                LocalDateTime createdAt = null;
                if (res.getTimestamp("created_at") != null) {
                    createdAt = res.getTimestamp("created_at").toLocalDateTime();
                }
                user = new User(
                        id, new Account(accountId, accountEmail, activated, role, createdAt),
                        firstName, lastName, gender, dob, profileImagePath);
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserByEmail(String email) {
        String sp = "{call spGetUserByEmail(?)}";
        User user = null;
        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            statement.setString("Email", email);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int id = res.getInt("id");
                String firstName = res.getString("first_name");
                String lastName = res.getString("last_name");
                Gender gender = res.getBoolean("gender") ? Gender.Female : Gender.Male;
                LocalDate dob = null;
                if (res.getDate("date_of_birth") != null) {
                    dob = res.getDate("date_of_birth").toLocalDate();
                }
                String profileImagePath = res.getString("profile_image");

                int accountId = res.getInt("account_id");
                String accountEmail = res.getString("email");
                boolean activated = res.getBoolean("activated");
                Role role = Role.valueOf(res.getString("role_name"));
                LocalDateTime createdAt = null;
                if (res.getTimestamp("created_at") != null) {
                    createdAt = res.getTimestamp("created_at").toLocalDateTime();
                }
                user = new User(
                        id, new Account(accountId, accountEmail, activated, role, createdAt),
                        firstName, lastName, gender, dob, profileImagePath);
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean isPasswordSet(String email) {
        String sql = "select [password_hash] from [account] where [email] = ?";
        boolean isSet = false;
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, email);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                String password = res.getString("password_hash");
                if (password != null) {
                    isSet = true;
                }
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSet;
    }

    public boolean updatePassword(String email, String password) {
        String sql = "update [account] set [password_hash] = ? where [email] = ?";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            String dbPassword = SecurityUtil.createHashSaltString(password);

            statement.setString(1, dbPassword);
            statement.setString(2, email);
            statement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addAccountList(List<AccountData> list) {
        boolean success = false;
        String sp = "{call spAddAccountList(?, ?)}";
        try (CallableStatement statement = DataAccess.getConnection().prepareCall(sp)) {
            SQLServerDataTable table = new SQLServerDataTable();
            table.addColumnMetadata("email", java.sql.Types.VARCHAR);
            table.addColumnMetadata("role", java.sql.Types.NVARCHAR);
            table.addColumnMetadata("manager", java.sql.Types.NVARCHAR);
            table.addColumnMetadata("country", java.sql.Types.NVARCHAR);
            table.addColumnMetadata("position", java.sql.Types.NVARCHAR);
            for (AccountData acc : list) {
                if (acc.getRole() == null || acc.getEmail() == null || acc.getEmail().isEmpty()) continue;
                boolean valid = true;
                switch (acc.getRole()) {
                    case Student:
                        break;
                    case Manager:
                    case Teacher:
                        if (acc.getManager() == null || acc.getManager().isEmpty()) {
                            valid = false;
                        }
                        break;
                }
                if (valid) {
                    table.addRow(acc.getEmail(), Account.roleToString(acc.getRole()), 
                                 acc.getManager(), acc.getCountry(), acc.getPosition());
                }
            }

            statement.setObject("AccountList", table);
            statement.registerOutParameter("Success", java.sql.Types.BIT);
            statement.execute();
            success = statement.getBoolean("Success");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public  boolean isOnlyLetters(String input) {
        return input != null && input.matches("[a-zA-Z]+");
    }
    public boolean updateFirstName(int accountId, String firstName)  {
        if (isOnlyLetters(firstName)==false){
            return false;
        }
        String sql = "UPDATE [dbo].[user] SET [first_name] = ? WHERE [account_id] = ?";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, firstName);
            statement.setInt(2, accountId);
            if (statement.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException e) {

        }
        return false;

    }
    
    public boolean updateLastName(int accountId, String lastName)  {
        if (isOnlyLetters(lastName)==false){
            return false;
        }
        String sql = "UPDATE [dbo].[user] SET [last_name] = ? WHERE [account_id] = ?";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, lastName);
            statement.setInt(2, accountId);
            if (statement.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException e) {

        }
        return false;

    }

    public boolean updateGender(int accountId, boolean gender)  {
        String sql = "UPDATE [dbo].[user] SET [gender] = ? WHERE [account_id] = ?";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setBoolean(1, gender);
            statement.setInt(2, accountId);
            if (statement.executeUpdate() > 0) {
                return true;
            }
        } catch(SQLException e){}
        return false;
    }

    public boolean updateDateOfBirth(int accountId, LocalDate dateOfBirth)  {
        
        String sql = "UPDATE [dbo].[user] SET [date_of_birth] = ? WHERE [account_id] = ?";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setDate(1, java.sql.Date.valueOf(dateOfBirth));
            statement.setInt(2, accountId);
            if (statement.executeUpdate() > 0) {
                return true;
            }
        } catch(SQLException e){}
        return false;
    }
    

    public boolean updateProfileImage(int accountId, String profileImage) {
        String sql = "UPDATE [dbo].[user] SET [profile_image] = ? WHERE [account_id] = ?";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, profileImage);
            statement.setInt(2, accountId);
            if (statement.executeUpdate() > 0) {
                return true;
            }
        } catch(SQLException e){}
        return false;
    }
    

    public boolean updateEmail(int accountId, String email) {
        String sql = "UPDATE [dbo].[account] SET [email] = ? WHERE id = ?";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, email);
            statement.setInt(2, accountId);
            if (statement.executeUpdate() > 0) {
                return true;
            }
        } catch(SQLException e){}
        return false;
    }

    public boolean changePassword(int accountId, String passwordHash) {
        String sql = "UPDATE [dbo].[account] SET [password_hash] = ? WHERE id= ?";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            String dbPassword = SecurityUtil.createHashSaltString(passwordHash);

            statement.setString(1, dbPassword);
            statement.setInt(2, accountId);
            statement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean DeleteAccount(String email) {

        String sql = "DELETE FROM [dbo].[account] WHERE email=?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, email);
            if (statement.executeUpdate() > 0) {
                return true;
            }

        } catch (SQLException e) {

        }
        return false;

    }
      public  LocalDate convertStringToLocalDate(String dateString) {
        String pattern ="dd-MM-yyyy";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        try {
            return LocalDate.parse(dateString, formatter);
        } catch (DateTimeParseException e) {
            System.out.println("Invalid date format: " + e.getMessage());
            return null;
        }
    }

    public static void main(String[] args) {
        UserDataAccess dao = new UserDataAccess();
      System.out.println(dao.updateGender(5, true));
    }

}

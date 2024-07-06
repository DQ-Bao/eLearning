package data_access;

import model.AccountRequest;
import model.ContactRequest;
import model.Request;
import model.AccountRequest.AccountData;

import java.lang.reflect.Type;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import data_access.internal.DataAccess;

public class RequestDataAccess {
    private static RequestDataAccess INSTANCE;

    private RequestDataAccess() {
    }

    public static RequestDataAccess getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new RequestDataAccess();
        }
        return INSTANCE;
    }

    public List<Request> getAllRequests() {
        List<Request> list = new ArrayList<>();
        String sql = "select * from [request];";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int id = res.getInt("id");
                String requesterName = res.getString("requester_name");
                String message = res.getString("message");
                String reply = res.getString("reply_message");
                Request.Status status = Request.Status.Pending;
                if (res.getString("status") != null) {
                    status = Request.Status.valueOf(res.getString("status"));
                }

                java.sql.Timestamp temp = res.getTimestamp("requested_at");
                LocalDateTime requestedAt = null;
                if (temp != null) {
                    requestedAt = temp.toLocalDateTime();
                }
                String type = res.getString("type");
                switch (type) {
                    case "Contact":
                    {
                        String representativeName = res.getString("contact_representative_name");
                        String contactEmail = res.getString("contact_email");
                        String phone = res.getString("contact_phone");
                        list.add(new ContactRequest(id, requesterName, message, reply, status, requestedAt, 
                                                    representativeName, contactEmail, phone));
                    }
                    break;
                    case "Account":
                    {
                        String accJson = res.getString("account_data");
                        Gson gson = new Gson();
                        Type accountListType = new TypeToken<List<AccountData>>() {}.getType();
                        List<AccountData> accList = gson.fromJson(accJson, accountListType);
                        list.add(new AccountRequest(id, requesterName, message, reply, status, requestedAt, accList));
                    }
                    break;
                    default:
                        break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Request getRequestById(int id) {
        Request request = null;
        String sql = "select * from [request] where [id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            ResultSet res = statement.getResultSet();
            while (res.next()) {
                int rid = res.getInt("id");
                String requesterName = res.getString("requester_name");
                String message = res.getString("message");
                String reply = res.getString("reply_message");
                Request.Status status = Request.Status.Pending;
                if (res.getString("status") != null) {
                    status = Request.Status.valueOf(res.getString("status"));
                }

                java.sql.Timestamp temp = res.getTimestamp("requested_at");
                LocalDateTime requestedAt = null;
                if (temp != null) {
                    requestedAt = temp.toLocalDateTime();
                }
                String type = res.getString("type");
                switch (type) {
                    case "Contact":
                    {
                        String representativeName = res.getString("contact_representative_name");
                        String contactEmail = res.getString("contact_email");
                        String phone = res.getString("contact_phone");
                        request = new ContactRequest(rid, requesterName, message, reply, status, requestedAt, 
                                                     representativeName, contactEmail, phone);
                    }
                    break;
                    case "Account":
                    {
                        String accJson = res.getString("account_data");
                        Gson gson = new Gson();
                        Type accountListType = new TypeToken<List<AccountData>>() {}.getType();
                        List<AccountData> accList = gson.fromJson(accJson, accountListType);
                        request = new AccountRequest(rid, requesterName, message, reply, status, requestedAt, accList);
                    }
                    break;
                    default:
                        break;
                }
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return request;
    }

    public boolean updateRequest(int id, Request.Status status, String reply) {
        String sql = "update [request] set [status] = ?, [reply_message] = ? where [id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setString(1, status.name());
            statement.setString(2, reply);
            statement.setInt(3, id);
            statement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteRequest(int id) {
        String sql = "delete from [request] where [id] = ?;";
        try (PreparedStatement statement = DataAccess.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

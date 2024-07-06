package model;

import java.time.LocalDateTime;
import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.opencsv.bean.AbstractBeanField;
import com.opencsv.bean.CsvBindByName;
import com.opencsv.bean.CsvCustomBindByName;
import com.opencsv.exceptions.CsvConstraintViolationException;
import com.opencsv.exceptions.CsvDataTypeMismatchException;

public class AccountRequest extends Request {
    public static class AccountData {
        public static class AccountRoleConverter extends AbstractBeanField<Account.Role, String> {
            @Override
            protected Object convert(String value) throws CsvDataTypeMismatchException, CsvConstraintViolationException {
                return Account.stringToRole(value);
            }
        }
        @SerializedName("email")
        @CsvBindByName(column = "Email", required = true)
        private String email;

        @SerializedName("role")
        @CsvCustomBindByName(column = "Role", converter = AccountRoleConverter.class, required = true)
        private Account.Role role;
        
        @SerializedName("manager")
        @CsvBindByName(column = "Manager")
        private String manager;

        @SerializedName("country")
        @CsvBindByName(column = "Country")
        private String country;

        @SerializedName("position")
        @CsvBindByName(column = "Position")
        private String position;
        public AccountData() {
        }
        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
        public Account.Role getRole() { return role; }
        public void setRole(Account.Role role) { this.role = role; }
        public String getManager() { return manager; }
        public void setManager(String manager) { this.manager = manager; }
        public String getCountry() { return country; }
        public void setCountry(String country) { this.country = country; }
        public String getPosition() { return position; }
        public void setPosition(String position) { this.position = position; }
    }
    private List<AccountData> accounts;

    public AccountRequest(int id, String requesterName, String message, String reply, Status status,
            LocalDateTime requestedAt, List<AccountData> accounts) {
        super(id, Type.Account, requesterName, message, reply, status, requestedAt);
        this.accounts = accounts;
    }

    public AccountRequest(String requesterName, String message, Status status, List<AccountData> accounts) {
        super(Type.Account, requesterName, message, status);
        this.accounts = accounts;
    }

    public List<AccountData> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<AccountData> accounts) {
        this.accounts = accounts;
    }
}

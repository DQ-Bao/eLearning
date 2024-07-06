package model;

import java.time.LocalDateTime;

public class ContactRequest extends Request {
    private String representativeName;
    private String email;
    private String phone;
    
    public ContactRequest(int id, String requesterName, String message, String reply, Status status, LocalDateTime requestedAt,
            String representativeName, String email, String phone) {
        super(id, Type.Contact, requesterName, message, reply, status, requestedAt);
        this.representativeName = representativeName;
        this.email = email;
        this.phone = phone;
    }

    public ContactRequest(String requesterName, String message, Status status, String representativeName, String email,
            String phone) {
        super(Type.Contact, requesterName, message, status);
        this.representativeName = representativeName;
        this.email = email;
        this.phone = phone;
    }

    public String getRepresentativeName() {
        return representativeName;
    }

    public void setRepresentativeName(String representativeName) {
        this.representativeName = representativeName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}

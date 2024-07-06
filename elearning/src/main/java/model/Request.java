package model;

import java.time.LocalDateTime;

public abstract class Request {
    public enum Type { Contact, Account }
    public enum Status { Pending, Accepted, Rejected }
    private int id;
    private Type type;
    private String requesterName;
    private String message;
    private String reply;
    private Status status;
    private LocalDateTime requestedAt;

    public Request() {
        this.status = Status.Pending;
    }
    
    public Request(Type type, String requesterName, String message, Status status) {
        this.type = type;
        this.requesterName = requesterName;
        this.message = message;
        this.status = status;
    }

    public Request(int id, Type type, String requesterName, String message, String reply, Status status, LocalDateTime requestedAt) {
        this.id = id;
        this.type = type;
        this.requesterName = requesterName;
        this.message = message;
        this.reply = reply;
        this.status = status;
        this.requestedAt = requestedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRequesterName() {
        return requesterName;
    }

    public void setRequesterName(String requesterName) {
        this.requesterName = requesterName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public LocalDateTime getRequestedAt() {
        return requestedAt;
    }

    public void setRequestedAt(LocalDateTime requestedAt) {
        this.requestedAt = requestedAt;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }
}

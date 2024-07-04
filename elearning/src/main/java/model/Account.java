package model;

import java.time.LocalDateTime;

public class Account {
    public enum Role { Manager, Teacher, Student }

    private int id;
    private String email;
    private boolean activated;
    private Role role;
    private LocalDateTime createdAt;

    public Account(int id, String email, boolean activated, Role role, LocalDateTime createdAt) {
        this.id = id;
        this.email = email;
        this.activated = activated;
        this.role = role;
        this.createdAt = createdAt;
    }

    public Account(String email, boolean activated, Role role) {
        this.email = email;
        this.activated = activated;
        this.role = role;
    }

    public static String roleToString(Role role) throws IllegalArgumentException {
        switch (role) {
            case Manager:
                return "Manager";
            case Teacher:
                return "Teacher";
            case Student:
                return "Student";
            default:
                throw new IllegalArgumentException("Role is not allowed.");
        }
    }

    public static Role stringToRole(String role) {
        if (role == null) return null;
        switch (role) {
            case "Manager":
                return Role.Manager;
            case "Teacher":
                return Role.Teacher;
            case "Student":
                return Role.Student;
            default:
                return null;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }
    
    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}

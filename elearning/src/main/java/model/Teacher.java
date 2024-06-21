package model;

public class Teacher {
    private int id;
    private int userId;
    private int managerId;
    private String position;
    private String bio;

    // Constructors
    public Teacher() {
    }

    public Teacher(int id, int userId, int managerId, String position, String bio) {
        this.id = id;
        this.userId = userId;
        this.managerId = managerId;
        this.position = position;
        this.bio = bio;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    // Optional: Override toString() method for debugging or logging purposes
    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", userId=" + userId +
                ", managerId=" + managerId +
                ", position='" + position + '\'' +
                ", bio='" + bio + '\'' +
                '}';
    }
}

package model;

import java.time.LocalDate;

public class Teacher extends User {
    private int teacherId;
    private int managerId;
    private String position;
    private String bio;

    public Teacher() {
    }
    
    public Teacher(int id, Account account, String firstName, String lastName, Gender gender, LocalDate dateOfBirth,
            String profileImagePath, int teacherId, int managerId, String position, String bio) {
        super(id, account, firstName, lastName, gender, dateOfBirth, profileImagePath);
        this.teacherId = teacherId;
        this.managerId = managerId;
        this.position = position;
        this.bio = bio;
    }

    public Teacher(int teacherId, int managerId, String position, String bio) {
        this.teacherId = teacherId;
        this.managerId = managerId;
        this.position = position;
        this.bio = bio;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
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

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }
}

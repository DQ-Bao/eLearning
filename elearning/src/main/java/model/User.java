package model;

import java.time.LocalDate;

public class User {
    private int id;
    private Account account;
    private String firstName;
    private String lastName;
    private boolean gender;
    private LocalDate dateOfBirth;
    private String profileImagePath;

    

    public User(String firstName, String lastName, String profileImagePath) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.profileImagePath = profileImagePath;
    }

    public User(int id, Account account, String firstName, String lastName, boolean gender, LocalDate dateOfBirth, String profileImagePath) {
        this.id = id;
        this.account = account;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.profileImagePath = profileImagePath;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getProfileImagePath() {
        return profileImagePath;
    }

    public void setProfileImagePath(String profileImagePath) {
        this.profileImagePath = profileImagePath;
    }
}

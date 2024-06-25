package model;

import java.time.LocalDate;

public class Manager extends User {
    private int managerId;
    private String orgName;
    private String description;
    private String country;
    private String logoPath;

    public Manager() {
    }

    public Manager(int id, Account account, String firstName, String lastName, Gender gender, LocalDate dateOfBirth,
            String profileImagePath, int managerId, String orgName, String description, String country,
            String logoPath) {
        super(id, account, firstName, lastName, gender, dateOfBirth, profileImagePath);
        this.managerId = managerId;
        this.orgName = orgName;
        this.description = description;
        this.country = country;
        this.logoPath = logoPath;
    }
    
    public Manager(int managerId, String orgName, String description, String country, String logoPath) {
        this.managerId = managerId;
        this.orgName = orgName;
        this.description = description;
        this.country = country;
        this.logoPath = logoPath;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(String logoPath) {
        this.logoPath = logoPath;
    }
}

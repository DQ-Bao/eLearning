package model;

public class Manager {
    private int id;
    private int userId;
    private String orgName;
    private String description;
    private String country;
    
    public Manager(int id, int userId, String orgName, String description, String country) {
        this.id = id;
        this.userId = userId;
        this.orgName = orgName;
        this.description = description;
        this.country = country;
    }

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
}

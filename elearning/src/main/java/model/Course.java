package model;

public class Course {
    private int id;
    private Manager manager;
    private String title;
    private String description;
    private String language;
    private String categoryName;
    private double price;
    private String imagePath;
    private boolean active;
    private boolean archived;

    public Course(int id, Manager manager, String title, String description, String language, String categoryName,
            double price, String imagePath, boolean active, boolean archived) {
        this.id = id;
        this.manager = manager;
        this.title = title;
        this.description = description;
        this.language = language;
        this.categoryName = categoryName;
        this.price = price;
        this.imagePath = imagePath;
        this.active = active;
        this.archived = archived;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isArchived() {
        return archived;
    }

    public void setArchived(boolean archived) {
        this.archived = archived;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }


    public String getDescription() {
        return description;
    }


    public void setDescription(String description) {
        this.description = description;
    }    
}

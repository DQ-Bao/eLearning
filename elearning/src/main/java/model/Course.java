package model;

public class Course {
    private String imagePath;
    private double price;
    private String title;
    private String language;
    private Manager manager;
    private String description;

    
    public Course() {
    }

    
    
    public Course(String imagePath, double price, String title, String language, Manager manager, String description) {
        this.imagePath = imagePath;
        this.price = price;
        this.title = title;
        this.language = language;
        this.manager = manager;
        this.description = description;
    }

    

    public Course(String imagePath, double price, String title, String language, Manager manager) {
        this.imagePath = imagePath;
        this.price = price;
        this.title = title;
        this.language = language;
        this.manager = manager;
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

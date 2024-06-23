package model;

import java.time.LocalDateTime;

public class Quiz extends CourseContent {
    private int id;
    private String description;
    private String contentPath;
    private double weight;

    public Quiz(int id, int courseId, String title, int teacherId, 
                String description, String contentPath, double weight, 
                LocalDateTime createdAt, LocalDateTime updatedAt) {
        super(courseId, title, ContentType.Quiz, teacherId, createdAt, updatedAt);
        this.id = id;
        this.description = description;
        this.contentPath = contentPath;
        this.weight = weight;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContentPath() {
        return contentPath;
    }

    public void setContentPath(String contentPath) {
        this.contentPath = contentPath;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        if (weight >= 0.0 && weight <= 1.0) {
            this.weight = weight;
        }
    }
}

package model;

import java.time.LocalDateTime;

public abstract class CourseContent {
    public enum ContentType { Lesson, Quiz }
    private int courseId;
    private String title;
    private ContentType type;
    private int teacherId;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public CourseContent() {
    }
    
    public CourseContent(int courseId, String title, ContentType type, int teacherId, LocalDateTime createdAt,
            LocalDateTime updatedAt) {
        this.courseId = courseId;
        this.title = title;
        this.type = type;
        this.teacherId = teacherId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public ContentType getType() {
        return type;
    }

    public void setType(ContentType type) {
        this.type = type;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}

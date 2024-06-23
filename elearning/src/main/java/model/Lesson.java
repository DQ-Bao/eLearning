package model;

import java.time.LocalDateTime;

public class Lesson extends CourseContent {
    private int id;
    private String content;

    public Lesson(int id, int courseId, String title, int teacherId, String content, LocalDateTime createdAt,
            LocalDateTime updatedAt) {
        super(courseId, title, ContentType.Lesson, teacherId, createdAt, updatedAt);
        this.id = id;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}

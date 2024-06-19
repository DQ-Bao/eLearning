package model;

public class Lesson {
    private int id;
    private int courseId;
    private String title;
    private String content;
    private int teacherId;

    public Lesson(int id, int courseId, String title, String content, int teacherId) {
        this.id = id;
        this.courseId = courseId;
        this.title = title;
        this.content = content;
        this.teacherId = teacherId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }   
}

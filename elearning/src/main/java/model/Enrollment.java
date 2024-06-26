package model;

public class Enrollment {
    private int id;
    private int courseId;
    private int studentId;
    private double grade;
    private boolean passed;
    
    public Enrollment(int id, int courseId, int studentId, double grade, boolean passed) {
        this.id = id;
        this.courseId = courseId;
        this.studentId = studentId;
        this.grade = grade;
        this.passed = passed;
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

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }

    public boolean isPassed() {
        return passed;
    }

    public void setPassed(boolean passed) {
        this.passed = passed;
    }
}

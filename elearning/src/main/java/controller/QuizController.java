package controller;

import data_access.CourseContentDataAccess;
import data_access.TeacherDataAccess;
import model.Quiz;
import model.QuizData;
import model.Teacher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import com.google.gson.Gson;

public class QuizController extends HttpServlet {
    private CourseContentDataAccess quizDAO;
    private TeacherDataAccess teacherDAO;
    private QuizData quizData;

    @Override
    public void init() throws ServletException {
        quizDAO = CourseContentDataAccess.getInstance();
        teacherDAO = TeacherDataAccess.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getPathInfo();
        if (idStr == null || idStr.equals("/") || !idStr.substring(1).matches("^[0-9]+$")) {
            resp.sendError(404);
            return;
        }
        int id = Integer.parseInt(idStr.substring(1));
        Quiz quiz = quizDAO.getQuizById(id);
        Teacher teacher = teacherDAO.getTeacherById(quiz.getTeacherId());
        req.setAttribute("quiz", quiz);
        req.setAttribute("teacher", teacher);
        req.getRequestDispatcher("/quiz.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getPathInfo();
        if (idStr == null || idStr.equals("/") || !idStr.substring(1).matches("^[0-9]+$")) {
            resp.sendError(404);
            return;
        }
        int id = Integer.parseInt(idStr.substring(1));
        String action = req.getParameter("action");
        if (action == null) {
            resp.sendError(404);
            return;
        }
        if (action.equals("start_quiz")) {
            Quiz quiz = quizDAO.getQuizById(id);
            if (quiz == null) {
                resp.sendError(404);
                return;
            }
            InputStream stream = req.getServletContext().getResourceAsStream("/WEB-INF/platform/" + quiz.getContentPath());
            if (stream == null) {
                resp.sendError(404);
                return;
            }
            InputStreamReader reader = new InputStreamReader(stream);
            Gson gson = new Gson();
            quizData = gson.fromJson(reader, QuizData.class);
            req.setAttribute("quiz_id", quiz.getId());
            req.setAttribute("question_list", quizData.getQuestions());
            req.getRequestDispatcher("/quiz_detail.jsp").forward(req, resp);
        }
        else if (action.equals("grade_quiz")) {
            if (quizData == null) {
                resp.sendError(404);
                return;
            }
            int correctAnswer = 0;
            List<QuizData.Question> questions = quizData.getQuestions();
            int totalQuestion = questions.size();
            for (int i = 0; i < questions.size(); i++) {
                String[] answers = req.getParameterValues("question_" + questions.get(i).getId());
                if (answers == null) {
                    continue;
                }
                boolean isCorrect = true;
                List<QuizData.Question.Option> options = questions.get(i).getOptions();
                int totalCorrect = 0;
                int correctSelect = 0;
                for (int j = 0; j < options.size(); j++) {
                    if (options.get(j).isCorrect()) {
                        totalCorrect++;
                    }
                    for (int k = 0; k < answers.length; k++) {
                        boolean selected = Integer.parseInt(answers[k]) == options.get(j).getId();
                        options.get(j).setSelected(selected);
                        if (selected) {
                            if (options.get(j).isCorrect()) {
                                correctSelect++;
                            }
                            else {
                                isCorrect = false;
                            }
                            break;
                        }
                    }
                }
                if (correctSelect != totalCorrect) {
                    isCorrect = false;
                }
                if (isCorrect) {
                    correctAnswer++;
                }
            }
            req.setAttribute("question_list", quizData.getQuestions());
            req.setAttribute("correct_answer", correctAnswer);
            req.setAttribute("total_question", totalQuestion);
            req.setAttribute("pass_grade", quizData.getPassGrade());
            req.getRequestDispatcher("/quiz_result.jsp").forward(req, resp);
        }
    }
}

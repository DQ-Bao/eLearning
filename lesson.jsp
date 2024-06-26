<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
    <jsp:attribute name="head">
        <style>
            /* Reset CSS */
            body, html {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            /* Common styles */
            .header, .footer {
                background-color: #333;
                color: #fff;
                text-align: center;
                padding: 1em 0;
            }

            .nav {
                background-color: #444;
                color: #fff;
                padding: 0.5em 0;
                text-align: center;
            }
            .nav ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
                display: inline-block;
            }
            .nav ul li {
                display: inline;
                margin-right: 10px;
            }
            .nav ul li a {
                color: #fff;
                text-decoration: none;
                padding: 0.5em 1em;
                display: inline-block;
            }
            .nav ul li a:hover {
                background-color: #555;
            }

            /* Content area */
            .content {
                margin: 2em auto;
                max-width: 1200px;
                background-color: #fff;
                padding: 2em;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            /* Profile section */
            .profile {
                display: flex;
                align-items: center;
                margin-bottom: 2em;
            }
            .profile img {
                border-radius: 50%;
                margin-right: 1em;
                width: 150px;
                height: 150px;
                object-fit: cover;
            }
            .profile-info {
                max-width: 600px;
            }
            .profile-info h2 {
                margin-top: 0;
            }
            .profile-info p {
                color: #666;
            }

            /* Courses section */
            .courses {
                margin-top: 2em;
            }
            .course-card {
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 1em;
                margin-bottom: 1em;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .course-card h4 {
                margin-top: 0;
            }
            .course-card p {
                color: #666;
            }
            .course-card .btn {
                display: inline-block;
                margin-top: 1em;
                padding: 0.5em 1em;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
            }
            .course-card .btn:hover {
                background-color: #0056b3;
            }
            .course-card .price {
                font-weight: bold;
                color: #007bff;
                font-size: 1.5rem;
                margin-right: 0.5em;
            }

            /* Tabs and tab content */
            ul#tabs {
                list-style-type: none;
                padding: 0;
                text-align: center;
            }
            ul#tabs li {
                display: inline-block;
                background-color: #32c896;
                border-bottom: solid 5px #238b68;
                padding: 5px 20px;
                margin-bottom: 4px;
                color: #fff;
                cursor: pointer;
            }
            ul#tabs li:hover,
            ul#tabs li.active {
                background-color: #238b68;
            }
            ul#tab {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }
            ul#tab li {
                display: none;
            }
            ul#tab li.active {
                display: block;
            }

            /* Quiz section */
            form {
                margin-top: 20px;
            }
            .quiz-container {
                width: 80%;
                margin: 0 auto;
            }
            h1 {
                text-align: center;
            }
            .question {
                width: 45%;
                margin-bottom: 20px;
                background-color: #fff;
                padding: 20px;
            }
            .question:nth-child(odd) {
                margin-right: 5%;
            }
            .question p {
                font-weight: bold;
            }
            .answers {
                margin-bottom: 20px;
            }
            .answers label:not(:first-child) {
                border-top: 1px solid #e0e0e0;
            }
            label {
                padding: 10px 0;
                display: block;
                margin-bottom: 10px;
            }
            input[type="radio"] {
                margin-right: 10px;
            }
            .submit-btn {
                display: block;
                margin: 20px auto;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 5px;
                font-size: 18px;
                cursor: pointer;
            }
            .result {
                font-weight: bold;
                font-size: 22px;
                margin-top: 20px;
                padding: 10px;
                background-color: #f2f2f2;
                border-radius: 5px;
                text-align: center;
            }

            /* Sidebar and content layout */
            .container {
                display: flex;
                width: 100%;
                height: 100vh;
            }
            .sidebar {
                width: 25%;
                background-color: #333;
                color: white;
                padding: 20px;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
                overflow-y: auto;
            }
            .content {
                width: 75%;
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            .lecture {
                margin-bottom: 10px;
            }
            .lecture a {
                text-decoration: none;
                color: white;
            }
            .lecture a:hover {
                text-decoration: underline;
            }
            iframe {
                width: 100%;
                height: 80vh;
                border: none;
            }
        </style>
        <script>
        function showVideo(url) {
            document.getElementById('videoFrame').src = url;
        }
        
        document.addEventListener("DOMContentLoaded", function() {
            var tabs = document.querySelectorAll("#tabs li");
            var tabContents = document.querySelectorAll("#tab li");

            tabs.forEach(function(tab, index) {
                tab.addEventListener("click", function() {
                    tabs.forEach(function(tab) {
                        tab.classList.remove("active");
                    });
                    tab.classList.add("active");

                    tabContents.forEach(function(content) {
                        content.classList.remove("active");
                    });
                    tabContents[index].classList.add("active");
                });
            });

            var addQuestionForm = document.getElementById("new-question-form");
            var quizForm = document.getElementById("quiz-form");

            addQuestionForm.addEventListener("submit", function(event) {
                event.preventDefault();

                // Gather form data
                var question = document.getElementById("new-question").value;
                var optionA = document.getElementById("option-a").value;
                var optionB = document.getElementById("option-b").value;
                var optionC = document.getElementById("option-c").value;
                var optionD = document.getElementById("option-d").value;
                var correctAnswer = document.getElementById("correct-answer").value;

                // Validate the form data (you can add more validation as needed)

                // Create new question HTML
                var newQuestionHtml = `
                    <div class="question">
                        <p>${question}</p>
                        <div class="answers">
                            <label>
                                <input type="radio" name="q${quizForm.children.length}" value="a">
                                ${optionA}
                            </label>
                            <label>
                                <input type="radio" name="q${quizForm.children.length}" value="b">
                                ${optionB}
                            </label>
                            <label>
                                <input type="radio" name="q${quizForm.children.length}" value="c">
                                ${optionC}
                            </label>
                            <label>
                                <input type="radio" name="q${quizForm.children.length}" value="d">
                                ${optionD}
                            </label>
                        </div>
                    </div>
                `;

                // Append new question HTML to the quiz form
                var newQuestionElement = document.createElement("li");
                newQuestionElement.innerHTML = newQuestionHtml;
                quizForm.appendChild(newQuestionElement);

                // Clear form fields after adding the question
                addQuestionForm.reset();
            });
        });
        </script>
    </jsp:attribute>
    <jsp:body>
        <ul id="tabs">
            <li class="active">Lesson</li>
            <li>Quiz</li>
        </ul>
        <ul id="tab">
            <li class="active">
                <div class="container">
                    <div class="sidebar">
                        <h1>Lesson List</h1>
                        <div class="lecture">
                            <a href="#" onclick="showVideo('https://www.youtube.com/embed/dZTq46PzoEQ')">Lesson 1</a>
                        </div>
                        <div class="lecture">
                            <a href="#" onclick="showVideo('https://www.youtube.com/embed/Fie3WIcmNbg')">Lesson 2</a>
                        </div>
                        <div class="lecture">
                            <a href="#" onclick="showVideo('https://www.youtube.com/embed/xNPpMH4qT60')">Lesson 3</a>
                        </div>
                        <!-- Thêm các bài giảng khác tại đây -->
                    </div>
                    <div class="content">
                        <iframe id="videoFrame" src="https://www.youtube.com/embed/dZTq46PzoEQ"></iframe>
                    </div>
                </div>
            </li>
            <li>
                <div class="quiz-container">
                    <h1>Multiple Choice Quiz</h1>
                    <hr>
                    <form id="quiz-form">
                        <div class="d-flex">
                            <div class="question">
                                <p>1. What is the capital of France?</p>
                                <div class="answers">
                                    <label>
                                        <input type="radio" name="q1" value="a">
                                        Paris
                                    </label>
                                    <label>
                                        <input type="radio" name="q1" value="b">
                                        Madrid
                                    </label>
                                    <label>
                                        <input type="radio" name="q1" value="c">
                                        London
                                    </label>
                                    <label>
                                        <input type="radio" name="q1" value="d">
                                        Rome
                                    </label>
                                </div>
                            </div>
                            <div class="question">
                                <p>2. What is the largest planet in our solar system?</p>
                                <div class="answers">
                                    <label>
                                        <input type="radio" name="q2" value="a">
                                        Venus
                                    </label>
                                    <label>
                                        <input type="radio" name="q2" value="b">
                                        Mars
                                    </label>
                                    <label>
                                        <input type="radio" name="q2" value="c">
                                        Jupiter
                                    </label>
                                    <label>
                                        <input type="radio" name="q2" value="d">
                                        Saturn
                                    </label>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="submit-btn">Submit</button>
                    </form>
                    <div class="result" id="result"></div>
                </div>
                <div class="manage-questions">
                    <h2>Add a New Question</h2>
                    <form id="new-question-form">
                        <div>
                            <label for="new-question">Question:</label>
                            <input type="text" id="new-question" name="new-question" required>
                        </div>
                        <div>
                            <label for="option-a">Option A:</label>
                            <input type="text" id="option-a" name="option-a" required>
                        </div>
                        <div>
                            <label for="option-b">Option B:</label>
                            <input type="text" id="option-b" name="option-b" required>
                        </div>
                        <div>
                            <label for="option-c">Option C:</label>
                            <input type="text" id="option-c" name="option-c" required>
                        </div>
                        <div>
                            <label for="option-d">Option D:</label>
                            <input type="text" id="option-d" name="option-d" required>
                        </div>
                        <div>
                            <label for="correct-answer">Correct Answer:</label>
                            <input type="text" id="correct-answer" name="correct-answer" required>
                        </div>
                        <button type="submit">Add Question</button>
                    </form>
                </div>
            </li>
        </ul>
    </jsp:body>
</t:main>

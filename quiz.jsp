<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
    <jsp:attribute name="head">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
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
            .content {
                margin: 2em auto;
                max-width: 1200px;
                background-color: #fff;
                padding: 2em;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
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
            .bio {
                margin-top: 2em;
            }
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
            /* CSS for price display */
            .course-card .price {
                font-weight: bold;
                color: #007bff;
                font-size: 1.5rem;
                margin-right: 0.5em;
            }

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
        ul#tabs li:hover {
            background-color: #238b68;
        }
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

        body {
        font-family: Arial, sans-serif;
        font-size: 16px;
        background-color: aliceblue;
        }
        form{
        margin-top:20px;
        }
        .quiz-container {
        width: 80%;
        margin: 0 auto;
        }

        h1 {
        text-align: center;
        }

        .question {
        width:45%;
        margin-bottom: 20px;
        background-color: #fff;
        padding:20px;
        }
        .question:nth-child(odd){
        margin-right:5%;
        }
        .question p{
        font-weight: bold;
        }

        .answers {
        margin-bottom: 20px;
        }
        .answers label:not(:first-child){
        border-top:1px solid #e0e0e0;
        }

        label {
        padding:10px 0;
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
        .d-flex{
        display: flex;
        }

        </style>


    </jsp:attribute>
    <jsp:body>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function(){
                $("ul#tabs li").click(function(e){
                    if (!$(this).hasClass("active")) {
                        var tabNum = $(this).index();
                        var nthChild = tabNum+1;
                        $("ul#tabs li.active").removeClass("active");
                        $(this).addClass("active");
                        $("ul#tab li.active").removeClass("active");
                        $("ul#tab li:nth-child("+nthChild+")").addClass("active");
                    }
                });
            });
        </script>

<script>
    $(document).ready(function(){
        $("ul#tabs li").click(function(e){
            if (!$(this).hasClass("active")) {
                var tabNum = $(this).index();
                var nthChild = tabNum+1;
                $("ul#tabs li.active").removeClass("active");
                $(this).addClass("active");
                $("ul#tab li.active").removeClass("active");
                $("ul#tab li:nth-child("+nthChild+")").addClass("active");
            }
        });
    });

    const quizForm = document.getElementById('quiz-form');
    const resultDiv = document.getElementById('result');
    const correctAnswers = ['a', 'c'];

    quizForm.addEventListener('submit', e => {
      e.preventDefault();
      
      let score = 0;
      const userAnswers = [quizForm.q1.value,quizForm.q2.value];
      userAnswers.forEach((answer, index) => {
        if (answer === correctAnswers[index]) {
          score += 1;
        }
      });

      resultDiv.innerHTML = `Your score is ${score}/${correctAnswers.length}`;
    });

    function addQuestion() {
        const questionText = document.getElementById('new-question').value;
        const options = [
            document.getElementById('option-a').value,
            document.getElementById('option-b').value,
            document.getElementById('option-c').value,
            document.getElementById('option-d').value
        ];
        const correctAnswer = document.getElementById('correct-answer').value;

        if (questionText && options.every(opt => opt) && correctAnswer) {
            const questionDiv = document.createElement('div');
            questionDiv.classList.add('question');
            questionDiv.innerHTML = `
                <p>${questionText}</p>
                <div class="answers">
                    <label><input type="radio" name="q${document.querySelectorAll('.question').length + 1}" value="a"> ${options[0]}</label>
                    <label><input type="radio" name="q${document.querySelectorAll('.question').length + 1}" value="b"> ${options[1]}</label>
                    <label><input type="radio" name="q${document.querySelectorAll('.question').length + 1}" value="c"> ${options[2]}</label>
                    <label><input type="radio" name="q${document.querySelectorAll('.question').length + 1}" value="d"> ${options[3]}</label>
                </div>
                <button type="button" onclick="editQuestion(this)">Edit</button>
                <button type="button" onclick="deleteQuestion(this)">Delete</button>
            `;
            document.querySelector('.quiz-container form .d-flex').appendChild(questionDiv);

            // Clear input fields
            document.getElementById('new-question').value = '';
            document.getElementById('option-a').value = '';
            document.getElementById('option-b').value = '';
            document.getElementById('option-c').value = '';
            document.getElementById('option-d').value = '';
            document.getElementById('correct-answer').value = '';
        }
    }

    function editQuestion(button) {
        const questionDiv = button.parentNode;
        const questionText = questionDiv.querySelector('p').textContent;
        const options = questionDiv.querySelectorAll('.answers label');
        
        const newQuestionText = prompt("Edit the question:", questionText);
        const newOptions = Array.from(options).map((option, index) => {
            return prompt(`Edit option ${String.fromCharCode(97 + index).toUpperCase()}:`, option.textContent.trim());
        });

        if (newQuestionText && newOptions.every(opt => opt)) {
            questionDiv.querySelector('p').textContent = newQuestionText;
            newOptions.forEach((newOption, index) => {
                options[index].textContent = newOption;
            });
        }
    }

    function deleteQuestion(button) {
        const questionDiv = button.parentNode;
        questionDiv.parentNode.removeChild(questionDiv);
    }
</script>


    <ul id="tabs">
        <li class="active">Lesson</li>
        <li>Quiz</li>
        
    </ul>
    <ul id="tab">
        <li class="active">
            <h2>Noi dung cho tab 1</h2>
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
                            <button type="button" onclick="editQuestion(this)">Edit</button>
                            <button type="button" onclick="deleteQuestion(this)">Delete</button>
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
                            <button type="button" onclick="editQuestion(this)">Edit</button>
                            <button type="button" onclick="deleteQuestion(this)">Delete</button>
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
                    <button type="button" onclick="addQuestion()">Add Question</button>
                </form>
            </div>
        </li>
    </ul>
        </main>
    </jsp:body>
</t:main>

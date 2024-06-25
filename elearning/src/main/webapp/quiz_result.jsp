<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <jsp:attribute name="head">
        <style>
            .correct-answer {
                background-color: lightgreen;
            }
            .wrong-answer {
                background-color: #ffb6b6;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <div class="container-xxl py-5">
            <div class="container mt-5">
                <div class="row">
                    <h1 class="col-12 justify-content-center">Quiz Result</h1>
                </div>
                <div class="row">
                    <div class="col-12 mt-3 mb-4 justify-content-center">
                        <h4>${correct_answer} / ${total_question}</h4>
                        <c:choose>
                            <c:when test="${correct_answer >= pass_grade}">
                                <p class="text-success">Passed</p>
                            </c:when>
                            <c:otherwise>
                                <p class="text-danger">Failed: You need ${pass_grade} answers to pass.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="question" items="${question_list}">
                        <div class="card mb-3">
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${question.text}"/></h5>
                                <c:forEach var="option" items="${question.options}">
                                    <div class="form-check ${option.correct ? 'correct-answer' : ''} ${option.selected && !option.correct ? 'wrong-answer' : ''}">
                                        <input class="form-check-input" type="${question.multipleAnswers ? "checkbox" : "radio"}" id="option_${option.id}" ${option.selected ? "checked" : ""} disabled>
                                        <label class="form-check-label" for="option_${option.id}"><c:out value="${option.text}"/></label>
                                    </div>
                                </c:forEach>
                                <p><c:out value="${question.explanation}"/></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
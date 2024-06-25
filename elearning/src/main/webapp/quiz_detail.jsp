<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <div class="container-xxl py-5">
        <div class="container mt-5">
            <form action="${pageContext.request.contextPath}/quiz/${quiz_id}" method="post">
                <c:forEach var="question" items="${question_list}">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><c:out value="${question.text}"/></h5>
                            <c:forEach var="option" items="${question.options}">
                                <div class="form-check">
                                    <input class="form-check-input" type="${question.multipleAnswers ? "checkbox" : "radio"}" name="question_${question.id}" id="option_${option.id}" value="${option.id}">
                                    <label class="form-check-label" for="option_${option.id}"><c:out value="${option.text}"/></label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
                <button type="submit" name="action" value="grade_quiz" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</t:main>
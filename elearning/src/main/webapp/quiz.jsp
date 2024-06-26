<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <div class="container-xxl py-5">
        <div class="container mt-5">
            <div class="row">
                <div class="col-12">
                    <h1>${quiz.title}</h1>
                    <p class="lead">${quiz.description}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <p class="text-muted">Created by ${teacher.firstName} ${teacher.lastName}</p>
                    <p class="text-muted">Created at <fmt:parseDate type="both" value="${quiz.createdAt}" pattern="yyyy-MM-dd'T'HH:mm"/></p>
                    <p class="text-muted">Modified at <fmt:parseDate type="both" value="${quiz.updatedAt}" pattern="yyyy-MM-dd'T'HH:mm"/></p>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-12 d-flex align-items-center">
                    <form action="${pageContext.request.contextPath}/quiz/${quiz.id}" method="post">
                        <button type="submit" name="action" value="start_quiz" class="btn btn-primary me-3">Start quiz</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</t:main>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <div class="container-xxl py-5">
        <div class="container mt-5">
            <div class="row">
                <div class="col-12">
                    <h1 class="justify-content-center">${lesson.title}</h1>
                    <p class="text-muted">Created by ${teacher.firstName} ${teacher.lastName}</p>
                    <p class="text-muted">Created at <fmt:parseDate type="both" value="${lesson.createdAt}" pattern="yyyy-MM-dd'T'HH:mm"/></p>
                    <p class="text-muted">Modified at <fmt:parseDate type="both" value="${lesson.updatedAt}" pattern="yyyy-MM-dd'T'HH:mm"/></p>
                </div>
            </div>
            <hr>
            <div class="row">
                <c:out value="${lesson.content}" escapeXml="false"/>
            </div>
            <hr>
            <div class="mt-4">
                <button type="button" class="btn btn-success">Mark as completed</button>
            </div>
        </div>
    </div>
</t:main>
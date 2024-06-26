<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <div class="container-xxl py-5">
        <div class="container mt-5">
            <div class="row">
                <div class="col-12">
                    <h1>${course.title}</h1>
                    <p class="lead">${course.description}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <p><i class="fa fa-language text-info me-2"></i><strong>Taught in ${course.language}</strong></p>
                </div>
                <div class="col-12">
                    <p><strong>Created by <a href="${pageContext.request.contextPath}/manager/${course.manager.orgName}">${course.manager.orgName}</a></strong></p>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-12 d-flex align-items-center">
                    <c:choose>
                        <c:when test="${not empty enroll}">
                            <div class="rounded" style="border: 1px solid var(--bs-primary);">Enrolled</div>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${course.price == 0.0}">
                                    <form action="${pageContext.request.contextPath}/enroll" method="post">
                                        <input type="hidden" name="course_id" value="${course.id}">
                                        <button type="submit" name="action" value="enroll" class="btn btn-primary me-3">Enroll for FREE</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <form action="${pageContext.request.contextPath}/payment" method="post">
                                        <input type="hidden" name="amount" value="${course.price}">
                                        <button type="submit" class="btn btn-primary me-3">Enroll for <fmt:formatNumber type="currency" currencyCode="VND" value="${course.price}"/></button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Contents</h6>
                <h1 class="mb-5">Lessons</h1>
            </div>
            <div class="row">
                <div class="col-lg-8 col-md-12">
                    <div class="border rounded mb-3">
                        <c:forEach var="content" items="${content_list}">
                            <div class="row border-bottom px-3 py-2 mx-0">
                                <c:set var="type" value="${content.type == 'Lesson' ? 'lesson' : 'quiz'}"/>
                                <c:choose>
                                    <c:when test="${not empty enroll}">
                                        <div class="col-9">
                                            <a href="${pageContext.request.contextPath}/${type}/${content.id}">${content.title}</a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <p>${content.title}</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="border rounded mb-3">
                        <c:forEach var="teacher" items="${teacher_list}">
                            <div class="row border-bottom px-3 py-2 mx-0 align-items-center">
                                <div class="col-3">
                                    <img src="${pageContext.request.contextPath}/img/${teacher.profileImagePath}" alt="${teacher.firstName} ${teacher.lastName}" class="img-fluid rounded-circle">
                                </div>
                                <div class="col-9"><a href="${pageContext.request.contextPath}/teacher/${teacher.teacherId}">${teacher.firstName} ${teacher.lastName}</a></div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:main>
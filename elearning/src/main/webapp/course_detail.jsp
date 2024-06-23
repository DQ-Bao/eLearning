<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<%@page import="model.CourseContent.ContentType"%>
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
                    <button class="btn btn-primary me-3">Enroll for ${course.price == 0.0 ? "FREE" : "$" + course.price.toString()}</button>
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
                                <div class="col-9">
                                    <c:choose>
                                        <c:when test="${content.type == ContentType.Lesson}">
                                            <a href="${pageContext.request.contextPath}/lesson/${content.id}">${content.title}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/quiz/${content.id}">${content.title}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-3">Done</div>
                            </div>
                        </c:forEach>
                        <div class="row border-bottom px-3 py-2 mx-0">
                            <div class="col-9">Lesson 1</div>
                            <div class="col-3">Done</div>
                        </div>
                        <div class="row border-bottom px-3 py-2 mx-0">
                            <div class="col-9">Lesson 1</div>
                            <div class="col-3">Done</div>
                        </div>
                        <div class="row border-bottom px-3 py-2 mx-0">
                            <div class="col-9">Lesson 1</div>
                            <div class="col-3">Done</div>
                        </div>
                        <div class="row border-bottom px-3 py-2 mx-0">
                            <div class="col-9">Lesson 1</div>
                            <div class="col-3">Done</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="border rounded mb-3">
                        <c:forEach var="teacher" items="${teacher_list}">
                            <div class="row border-bottom px-3 py-2 mx-0 align-items-cente">
                                <div class="col-3">
                                    <img src="${pageContext.request.contextPath}/img/${teacher.imagePath}" alt="${teacher.firstName} ${teacher.lastName}" class="img-fluid rounded-circle">
                                </div>
                                <div class="col-9"><a href="${pageContext.request.contextPath}/teacher/${teacher.id}">${teacher.firstName} ${teacher.lastName}</a></div>
                            </div>
                        </c:forEach>
                        <div class="row border-bottom px-3 py-2 mx-0 align-items-center">
                            <div class="col-3">
                                <img src="${pageContext.request.contextPath}/img/testimonial-1.jpg" alt="test 1" class="img-fluid rounded-circle">
                            </div>
                            <div class="col-9">Person 1</div>
                        </div>
                        <div class="row border-bottom px-3 py-2 mx-0 align-items-center">
                            <div class="col-3">
                                <img src="${pageContext.request.contextPath}/img/testimonial-1.jpg" alt="test 1" class="img-fluid rounded-circle">
                            </div>
                            <div class="col-9">Person 1</div>
                        </div>
                        <div class="row border-bottom px-3 py-2 mx-0 align-items-center">
                            <div class="col-3">
                                <img src="${pageContext.request.contextPath}/img/testimonial-1.jpg" alt="test 1" class="img-fluid rounded-circle">
                            </div>
                            <div class="col-9">Person 1</div>
                        </div>
                        <div class="row border-bottom px-3 py-2 mx-0 align-items-center">
                            <div class="col-3">
                                <img src="${pageContext.request.contextPath}/img/testimonial-1.jpg" alt="test 1" class="img-fluid rounded-circle">
                            </div>
                            <div class="col-9">Person 1</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:main>
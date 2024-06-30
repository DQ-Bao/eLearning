<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <jsp:attribute name="head">
        <style>
            .course-title {
                max-height: 3.6em; /* Adjust based on desired height */
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 2; /* Limit to 2 lines */
                -webkit-box-orient: vertical;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <!-- Start Breadcrumbs -->
        <div class="breadcrumbs overlay">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                        <div class="breadcrumbs-content">
                            <h1 class="page-title">
                                <c:choose>
                                    <c:when test="${param.category == null}">
                                        All Courses
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${param.category}"/>
                                    </c:otherwise>
                                </c:choose>
                            </h1>
                        </div>
                        <ul class="breadcrumb-nav">
                            <li><a href="${pageContext.request.contextPath}">Home</a></li>
                            <li>Courses</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <section class="courses section grid-page">
            <div class="container">
                <div class="row">
                    <c:forEach var="course" items="${course_list}" varStatus="status">
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="single-course wow fadeInUp" data-wow-delay="${0.2 + (status.index * 0.2)}s">
                                <div class="course-image">
                                    <a href="${pageContext.request.contextPath}/courses/${course.id}">
                                        <img src="${pageContext.request.contextPath}/img/${course.imagePath}" alt="${course.title}">
                                    </a>
                                    <p class="price">
                                        <c:choose>
                                            <c:when test="${course.price == 0}">
                                                FREE
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber type="currency" currencyCode="VND" value="${course.price}"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <div class="content">
                                    <h3><a href="${pageContext.request.contextPath}/courses/${course.id}">${course.title}</a></h3>
                                </div>
                                <div class="bottom-content">
                                    <div class="row">
                                        <div class="col-7">
                                            <i class="lni lni-graduation"></i>
                                            <p>${course.manager.orgName}</p>
                                        </div>
                                        <div class="col-5 tag">
                                            <i class="lni lni-tag"></i>
                                            <a href="${pageContext.request.contextPath}/courses?category=${course.categoryName}">${course.categoryName}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </jsp:body>
</t:main>
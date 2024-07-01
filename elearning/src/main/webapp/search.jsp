<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <c:set var="course_cnt" value="${course_list == null || course_list.isEmpty() ? 0 : course_list.size()}"/>
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">
                            Found ${course_cnt} results
                        </h1>
                    </div>
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}">Home</a></li>
                        <li>Search</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <c:if test="${course_cnt != 0}">
        <section class="courses section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <div class="section-icon wow zoomIn" data-wow-delay=".4s">
                                <i class="lni lni-graduation"></i>
                            </div>
                            <h2 class="wow fadeInUp" data-wow-delay=".4s">Courses</h2>
                        </div>
                    </div>
                </div>
                <div class="single-head">
                    <div class="row">
                        <c:forEach var="course" items="${course_list}" varStatus="status">
                            <div class="col-lg-4 col-md-6 col-12">
                                <t:course id="${course.id}" title="${course.title}"
                                image_path="${course.imagePath}" price="${course.price}"
                                manager_name="${course.manager.orgName}" category_name="${course.categoryName}" index="${status.index}"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
    </c:if>
</t:main>
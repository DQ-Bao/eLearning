<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">${course.title}</h1>
                    </div>
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/courses">Courses</a></li>
                        <li>${course.id}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="course-details section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-12">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="overview-tab" data-bs-toggle="tab"
                                data-bs-target="#overview" type="button" role="tab" aria-controls="overview"
                                aria-selected="true">Overview</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="curriculum-tab" data-bs-toggle="tab"
                                data-bs-target="#curriculum" type="button" role="tab" aria-controls="curriculum"
                                aria-selected="false">Curriculum</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="instructor-tab" data-bs-toggle="tab"
                                data-bs-target="#instructor" type="button" role="tab" aria-controls="instructor"
                                aria-selected="false">Teacher</button>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                            <div class="course-overview">
                                <h3 class="title">About This Course</h3>
                                <p>${course.description}</p>
                                <ul>
                                    <li><p>Language: ${course.language}</p></li>
                                </ul>
                                <div class="bottom-content">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="button">
                                                <a href="#0" class="btn">Buy this course</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="curriculum" role="tabpanel" aria-labelledby="curriculum-tab">
                            <div class="course-curriculum">
                                <ul class="curriculum-sections">
                                    <li class="single-curriculum-section">
                                        <div class="section-header">
                                            <div class="section-left">
                                                <h5 class="title">All Lessons</h5>
                                            </div>
                                        </div>
                                        <ul class="section-content">
                                            <c:forEach var="content" items="${content_list}">
                                                <c:set var="type" value="${content.type == 'Lesson' ? 'lesson' : 'quiz'}"/>
                                                <li class="course-item">
                                                    <a class="section-item-link lesson" href="${pageContext.request.contextPath}/${type}/${content.id}">
                                                        <span class="item-name">${content.title}</span>
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="instructor" role="tabpanel" aria-labelledby="instructor-tab">
                            <div class="course-instructor">
                                <c:forEach var="teacher" items="${teacher_list}">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="profile-image">
                                                <img src="${pageContext.request.contextPath}/img/${teacher.profileImagePath}" alt="${teacher.firstName} ${teacher.lastName}">
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="profile-info">
                                                <h5><a href="javascript:void(0)">${teacher.firstName} ${teacher.lastName}</a></h5>
                                                <p class="author-career">${teacher.position}</p>
                                                <p class="author-bio">${teacher.bio}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-12">
                    <div class="course-sidebar">
                        <div class="sidebar-widget">
                            <h3 class="sidebar-widget-title">Offered by</h3>
                            <div class="sidebar-widget-content">
                                <ul class="sidebar-widget-course">
                                    <li class="single-course">
                                        <div class="thumbnail">
                                            <a href="javascript:void(0)" class="image">
                                                <img src="${pageContext.request.contextPath}/img/${course.manager.logoPath}" alt="${course.manager.orgName}">
                                            </a>
                                        </div>
                                        <div class="info">
                                            <h6 class="title">
                                                <a href="${pageContext.request.contextPath}/manager/${course.manager.orgName}">${course.manager.orgName}</a>
                                            </h6>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:main>
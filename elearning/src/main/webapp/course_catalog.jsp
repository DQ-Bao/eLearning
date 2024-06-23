<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main nav_active="courses">
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
        <!-- Header Start -->
        <div class="container-fluid bg-primary py-5 mb-5 page-header">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-10 text-center">
                        <h1 class="display-3 text-white animated slideInDown">Courses</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a class="text-white" href="${pageContext.request.contextPath}">Home</a></li>
                                <li class="breadcrumb-item text-white active" aria-current="page">Courses</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->

        <!-- Courses Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">Courses</h6>
                    <h1 class="mb-5">${param.category == null ? "All Courses" : param.category}</h1>
                </div>
                
                <div class="row g-4">
                    <c:forEach var="course" items="${course_list}" varStatus="status">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="${0.1 + (status.index * 0.2)}s">
                            <div class="course-item bg-light">
                                <div class="position-relative overflow-hidden">
                                    <img class="img-fluid" src="${pageContext.request.contextPath}/img/${course.imagePath}" alt="">
                                </div>
                                <div class="text-center p-4 pb-0">
                                    <h3 class="mb-0">$${course.price==0?"FREE":course.price}</h3>
                                    <h5 class="mb-4 course-title"><a href="${pageContext.request.contextPath}/courses/${course.id}">${course.title}</a></h5>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>${course.manager.orgName}</small>
                                    <small class="flex-fill text-center border-end py-2"><i class="fa fa-book text-primary me-2"></i>${course.language}</small>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Courses End -->
    </jsp:body>
</t:main>
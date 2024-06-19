<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main nav_active="courses">
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
                <h1 class="mb-5">All Courses</h1>
            </div>

            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Categories</a>
                <div class="dropdown-menu fade-down m-0">
                    <c:forEach var="categoryName" items="${category_list}" >
                        <a href="${pageContext.request.contextPath}/courses/${categoryName}" class="dropdown-item">${categoryName}</a>
                    </c:forEach>
                </div>
            </div>
            
            <div class="row g-4 justify-content-center">
                <c:forEach var="course" items="${course_list}" varStatus="status">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="${0.1 + (status.index * 0.2)}s">
                        <div class="course-item bg-light">
                            <div class="position-relative overflow-hidden">
                                <img class="img-fluid" src="${course.imagePath}" alt="">
                            </div>
                            <div class="text-center p-4 pb-0">
                                <h3 class="mb-0">$${course.price}</h3>
                                <h5 class="mb-4">${course.title}</h5>
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
</t:main>
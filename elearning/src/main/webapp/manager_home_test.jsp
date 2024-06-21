<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
    <!-- Course Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Your Courses</h6>
            </div>
            <form action="${pageContext.request.contextPath}/manager">
                <button type="submit" name="action" value="add_course" class="btn btn-primary mb-3">Add new courses</button>
            </form>
            <div class="row g-4">
                    <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <img class="img-fluid" src="${course.imgpath}" alt="" style="width: 300px; height: auto;">
                            </div>
                           
                        </div>
                    </div>
           
            </div>
        </div>
    </div>
    <!-- Course End -->

    <!-- Teacher Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Your Teachers</h6>
            </div>
            <div class="row g-4">
              
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item bg-light">
                            <div class="overflow-hidden">
                                <img class="img-fluid" src="${teacher.imagePath}" alt="">
                            </div>
                            <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                               
                            </div>
                           
                    </div>
                
            </div>
        </div>
    </div>
    <!-- Teacher End -->
</t:main>

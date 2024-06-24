<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
    <!-- Course Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Your Courses</h6>
            </div>
            <form action="${pageContext.request.contextPath}/add_courses.jsp">
                <button type="submit" name="action" value="add_course" class="btn btn-primary mb-3">Add new courses</button>
            </form>
            <div class="row g-4">
                <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Img</th>
                                <th>Title</th>
                                <th>Status</th>
                                <th>Action</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="course" items="${courses}">
                                <tr>
                                    <td><img class="img-fluid" src="${course.imgpath}" alt="" style="width: 100px; height: auto;"></td>
                                    <td>${course.title}</td>
                                    <td>${course.status}</td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/manager" method="post">
                                            <button type="submit" name="action" value="publish_course_${course.id}" class="btn btn-success">Publish</button>
                                            <button type="submit" name="action" value="unpublish_course_${course.id}" class="btn btn-warning">Unpublish</button>
                                            <button type="submit" name="action" value="remove_course_${course.id}" class="btn btn-danger">Remove</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table> 
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
            <form action="${pageContext.request.contextPath}/add_teacher.jsp">
                <button type="submit" name="action" value="add_teacher" class="btn btn-primary mb-3">Add new teacher</button>
            </form>
            <div class="row g-4">
                <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="teacher" items="${teachers}">
                                <tr>
                                    <td><img class="img-fluid" src="${teacher.imagePath}" alt="" style="width: 100px; height: auto;"></td>
                                    <td>${teacher.name}</td>
                                    <td>${teacher.email}</td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/manager" method="post">
                                            <button type="submit" name="action" value="remove_teacher_${teacher.id}" class="btn btn-danger">Remove</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- Teacher End -->
</t:main>

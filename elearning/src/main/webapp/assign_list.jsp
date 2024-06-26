<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
        <t:main>
            <!-- Course Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h6 class="section-title bg-white text-center text-primary px-3">Assignlist</h6>
                    </div>
                    <form action="${pageContext.request.contextPath}/add_courses.jsp">
                        <button type="submit" name="action" value="remove" class="btn btn-primary mb-3">Remove</button>
                    </form>
                    <div class="row g-4">
                        <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                            <table class="table table-bordered">
                                <thead>
                                    <h3>Assign list</h3>
                                    <tr>
                                        <th>Course</th>



                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>${course.title}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </t:main>
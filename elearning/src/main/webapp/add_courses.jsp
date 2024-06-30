<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <div class="container-xxl d-block">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6 col-lg-4" style="min-width: 500px;">
                <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                    <div class="card-body p-5 text-center">
                        <h1>Add Courses</h1>
                        
                        <form action="${pageContext.request.contextPath}/login" method="post">
                            <div class="row g-3">
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="name" name="img" placeholder="img " id="img" class="form-control" required>
                                        <label for="name">Img</label>
                                    </div>

                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" name="password" placeholder="email" id="email" class="form-control" required>
                                        <label for="email">Title</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" name="description" placeholder="description" id="description" class="form-control" required>
                                        <label for="email">Description</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" name="language" placeholder="language" id="language" class="form-control" required>
                                        <label for="email">Language</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" name="price" placeholder="price" id="price" class="form-control" required>
                                        <label for="email">Price</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" name="category" placeholder="category" id="category" class="form-control" required>
                                        <label for="email">Category</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <h5>Teacher</h5>
                                        <select id="teacher" name="teacher">
                                            <c:forEach var="teacher" items="${teachers}">
                                                <option value="${teacher.id}">${teacher.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-between align-items-center">
                                    <div class="submit">
                                        <button type="submit">Edit Content</button>
                                        
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="Add" name="add" value="add" class="btn btn-primary w-100 py-3">Add</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</t:main>

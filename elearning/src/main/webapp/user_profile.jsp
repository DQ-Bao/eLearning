<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-12">
                    <div class="card">
                        <img src="${pageContext.request.contextPath}/img/${user.profileImagePath}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/img/default-user.jpg'"  class="card-img-top" alt="Profile Image">
                        <div class="card-body">
                            <h5 class="card-title">${user.firstName} ${user.lastName}</h5>
                            <p class="card-text">Gender: ${user.gender}</p>
                            <p class="card-text">Date of Birth: <fmt:formatDate type="date" value="${user_dob}" pattern="yyyy-MM-dd"/></p>
                            <p class="card-text">Join At: <fmt:formatDate type="both" value="${join_at}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-12">
                    <div class="form-head">
                        <h4 class="title mb-3">Change Profile Picture</h4>
                        <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data" class="form">
                            <div class="row align-items-center">
                                <div class="form-group col-6 mb-3">
                                    <label>Upload Image</label>
                                    <input type="file" name="profile_image" accept="image/jpeg" class="form-control">
                                </div>
                                <div class="form-group button col-3">
                                    <button type="submit" name="action" value="update_profile_image" class="btn">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="form-head">
                        <h4 class="title mb-3">Update Profile</h4>
                        <form action="${pageContext.request.contextPath}/profile" method="post" class="form">
                            <div class="row">
                                <div class="form-group col-lg-6 col-12 mb-2">
                                    <label>First Name</label>
                                    <input type="text" name="first_name" class="form-control">
                                </div>
                                <div class="form-group col-lg-6 col-12 mb-2">
                                    <label>Last Name</label>
                                    <input type="text" name="last_name" class="form-control">
                                </div>
                                <div class="form-group col-lg-6 col-12 mb-2">
                                    <label>Gender</label>
                                    <select name="gender" class="form-control">
                                        <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-6 col-12 mb-2">
                                    <label>Date of Birth</label>
                                    <input type="date" name="dob" class="form-control">
                                </div>
                                <div class="form-group button col-12">
                                    <button type="submit" name="action" value="update_profile" class="btn">Update Profile</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:main>
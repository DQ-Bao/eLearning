<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <section class="login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <ul class="nav nav-tabs" id="register-tablist" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="student-register-tab" data-bs-toggle="tab"
                                data-bs-target="#student-register" type="button" role="tab" aria-controls="student-register"
                                aria-selected="true">For Student</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="org-register-tab" data-bs-toggle="tab"
                                data-bs-target="#org-register" type="button" role="tab" aria-controls="org-register"
                                aria-selected="false">For Organization</button>
                        </li>
                    </ul>
                    <div class="tab-content" id="register-tab-content">
                        <div class="tab-pane fade show active" id="student-register" role="tabpanel" aria-labelledby="student-register-tab">
                            <div class="form-head">
                                <h4 class="title">Register</h4>
                                <form action="${pageContext.request.contextPath}/register" method="post">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" name="email" placeholder="Enter Email" id="email" class="margin-5px-bottom" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" name="password" placeholder="Enter Password" id="password" class="margin-5px-bottom" required>
                                    </div>
                                    <div class="button">
                                        <button type="submit" name="action" value="register" class="btn">Register</button>
                                    </div>
                                    <p class="outer-link">Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></p>
                                </form>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="org-register" role="tabpanel" aria-labelledby="org-register-tab">
                            <div class="form-head">
                                <h4 class="title">Enter your email</h4>
                                <form action="${pageContext.request.contextPath}/register" method="post">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" name="email" placeholder="Enter email provided by your organization" id="email" class="margin-5px-bottom" required>
                                    </div>
                                    <div class="button">
                                        <button type="submit" name="action" value="check_email" class="btn">Next</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</t:main>

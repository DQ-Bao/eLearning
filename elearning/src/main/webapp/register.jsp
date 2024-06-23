<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <div class="container-xxl d-block">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6 col-lg-4" style="min-width: 500px;">
                <div class="nav nav-tabs mt-5">
                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#student-register" type="button" aria-controls="student-register" aria-selected="true">For Student</button>
                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#org-register" type="button" aria-controls="org-register" aria-selected="false">For Organization</button>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="student-register">
                        <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                            <div class="card-body p-5 text-center">
                                <h1>Sign Up</h1>
                                <p>Sign up an account by filling in this form</p>
                                
                                <form action="${pageContext.request.contextPath}/register" method="post">
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <div class="form-floating">
                                                <input type="email" name="email" placeholder="Enter Email" id="email" class="form-control" required>
                                                <label for="email">Enter Email</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating">
                                                <input type="password" name="password" placeholder="Enter Password" id="password" class="form-control" required>
                                                <label for="password">Enter Password</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
                                        </div>
                                        <div class="col-12">
                                            <button type="submit" name="action" value="register" class="btn btn-primary w-100 py-3">Sign up</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="org-register">
                        <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                            <div class="card-body p-5 text-center">
                                <h1>Enter your email</h1>
                                <p>Enter the email provided by your organization</p>
                                <form action="${pageContext.request.contextPath}/register" method="post">
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <div class="form-floating">
                                                <input type="email" name="email" placeholder="Enter Email" id="email" class="form-control" required>
                                                <label for="email">Enter Email</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <button type="submit" name="action" value="check_email" class="btn btn-primary w-100 py-3">Next</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:main>

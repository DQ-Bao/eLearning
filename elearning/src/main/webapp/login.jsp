<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main nav_active="login">
    <div class="container-xxl d-block">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6 col-lg-4" style="min-width: 500px;">
                <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                    <div class="card-body p-5 text-center">
                        <h1>Log in</h1>
                        <p>Please fill in this form to log in</p>
                        
                        <form action="${pageContext.request.contextPath}/login" method="post">
                            <div class="row g-3">
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="email" name="email" placeholder="Your Email" id="email" class="form-control" required>
                                        <label for="email">Your Email</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="password" name="password" placeholder="Your Password" id="password" class="form-control" required>
                                        <label for="password">Your Password</label>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-between align-items-center">
                                    <div class="form-check">
                                        <input type="checkbox" name="remember_me" value="true" id="remember_me" class="form-check-input">
                                        <label for="remember_me" class="form-check-label">Remember me</label>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/login?action=forgot_pw" class="text-decoration-none">Forgot password?</a>
                                </div>
                                <div class="col-12">
                                    <button type="submit" name="action" value="login" class="btn btn-primary w-100 py-3">Log in</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:main>

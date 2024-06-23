<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <jsp:body>
        <div class="container-xxl d-block">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6 col-lg-4" style="min-width: 500px;">
                    <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                        <div class="card-body p-5 text-center">
                            <h1>Enter your email</h1>
                            <p>Enter your account's email address</p>
                            
                            <form action="${pageContext.request.contextPath}/login" method="post">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="email" name="email" placeholder="Enter Email" class="form-control" required>
                                            <label for="email">Enter Email</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" name="action" value="fpw_check_email" class="btn btn-primary w-100 py-3">Next</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
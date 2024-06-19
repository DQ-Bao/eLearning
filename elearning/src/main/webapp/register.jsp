<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <jsp:attribute name="head">
        <style>
            input[type=text], input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            /* Add a background color when the inputs get focus */
            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
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
                                        <input type="text" placeholder="Enter Email" name="email" required>
                                        <input type="password" placeholder="Enter Password" name="password" required>

                                        <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
                                        <button type="submit" name="action" value="register" class="btn btn-primary mb-3">Sign up</button>
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
                                        <input type="text" placeholder="Enter Email" name="email" required>
                                        <button type="submit" name="action" value="check_email" class="btn btn-primary mb-3">Next</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>

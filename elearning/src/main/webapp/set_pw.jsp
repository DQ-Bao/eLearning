<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <jsp:attribute name="script">
        <script>
            function checkPassword() {
                const password = document.getElementById("password");
                const confirmPassword = document.getElementById("confirm-password");
                const submit = document.getElementById("submit");
                if (password.value !== "" && password.value === confirmPassword.value) {
                    submit.disabled = false;
                }
                else {
                    submit.disabled = true;
                }
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="container-xxl d-block">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6 col-lg-4" style="min-width: 500px;">
                    <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                        <div class="card-body p-5 text-center">
                            <h1>Set your password</h1>
                            <p>${requestScope.set_pw_message}</p>
                            
                            <form action="${pageContext.request.contextPath}/register" method="post">
                                <input type="hidden" name="email" value="${requestScope.email}">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="password" name="password" placeholder="Enter Password" id="password" class="form-control" onkeyup="checkPassword()" required>
                                            <label for="password">Enter Password</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="password" placeholder="Re-enter Password" id="confirm-password" class="form-control" onkeyup="checkPassword()" required>
                                            <label for="password">Re-enter Password</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" name="action" value="set_pw" id="submit" class="btn btn-primary w-100 py-3" disabled>Sign up</button>
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
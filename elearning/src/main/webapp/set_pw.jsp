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
        <section class="login section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                        <div class="form-head">
                            <h4 class="title">Set your password</h4>
                            <form action="${pageContext.request.contextPath}/register" method="post">
                                <input type="hidden" name="email" value="${requestScope.email}">
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="password" placeholder="Enter Password" id="password" class="margin-5px-bottom" onkeyup="checkPassword()" required>
                                </div>
                                <div class="form-group">
                                    <label>Re-enter Password</label>
                                    <input type="password" placeholder="Re-enter Password" id="confirm-password" class="margin-5px-bottom" onkeyup="checkPassword()" required>
                                </div>
                                <div class="button">
                                    <button type="submit" name="action" value="set_pw" id="submit" class="btn" disabled>Next</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:main>
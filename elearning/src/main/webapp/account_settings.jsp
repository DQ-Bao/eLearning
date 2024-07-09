<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
    <jsp:attribute name="head">
        <style>
            .button .delete-btn::before {
                position: absolute;
                left: 0;
                top: 0;
                height: 100%;
                width: 0;
                background-color: #EF5B5B;
                content: "";
                -webkit-transition: all 0.4s ease-in-out;
                transition: all 0.4s ease-in-out;
                z-index: -1;
            }
        </style>
    </jsp:attribute>
    <jsp:attribute name="script">
        <script>
            function checkPassword() {
                const password = document.getElementById("new-password");
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
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-12">
                        <ul class="nav flex-column nav-tabs" role="tablist">
                            <li class="nav-item mb-2" role="presentation">
                                <button class="nav-link active" id="settings-tab" data-bs-toggle="tab"
                                    data-bs-target="#settings" type="button" role="tab" aria-controls="settings"
                                    aria-selected="true"><i class="fa-solid fa-gear"></i> Settings</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="purchase-history-tab" data-bs-toggle="tab"
                                    data-bs-target="#purchase-history" type="button" role="tab" aria-controls="purchase-history"
                                    aria-selected="false"><i class="fa-solid fa-cart-shopping"></i> Purchase History</button>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-9 col-12">
                        <div class="tab-content">
                            <div id="settings" class="container tab-pane fade show active" role="tabpanel" aria-labelledby="settings-tab">
                                <div class="form-head mb-5">
                                    <h4 class="title mb-3">Change Password</h4>
                                    <form action="${pageContext.request.contextPath}/account" method="post" class="form">
                                        <div class="row">
                                            <div class="form-group col-12 mb-2">
                                                <label>Old Password</label>
                                                <input type="password" name="old_password" class="form-control" required>
                                            </div>
                                            <div class="form-group col-12 mb-2">
                                                <label>New Password</label>
                                                <input type="password" name="new_password" id="new-password" class="form-control" onkeyup="checkPassword()" required>
                                            </div>
                                            <div class="form-group col-12 mb-2">
                                                <label>Re-enter Password</label>
                                                <input type="password" id="confirm-password" class="form-control" onkeyup="checkPassword()" required>
                                            </div>
                                            <div class="form-group button col-12">
                                                <button type="submit" name="action" value="change_pw" id="submit" class="btn" disabled>Submit</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="form-head">
                                    <h4 class="title mb-3">Delete Account</h4>
                                    <form action="${pageContext.request.contextPath}/account" method="post" class="form">
                                        <div class="row">
                                            <div class="form-group button col-12">
                                                <button type="submit" name="action" value="delete_account" class="btn delete-btn">Delete Account</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div id="purchase-history" class="container tab-pane fade" role="tabpanel" aria-labelledby="purchase-history-tab">
                                <p>To do</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.svg" />
    <title>Admin</title>
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
</head>
<body>
    <c:if test="${not empty message}">
        <div class="container">
            <div class="row justify-content-center mt-3">
                <c:set var="alert_type" value="alert-info" />
                <c:choose>
                    <c:when test="${message.type == 'Error'}">
                        <c:set var="alert_type" value="alert-danger" />
                    </c:when>
                    <c:when test="${message.type == 'Warn'}">
                        <c:set var="alert_type" value="alert-warning" />
                    </c:when>
                    <c:when test="${message.type == 'Info'}">
                        <c:set var="alert_type" value="alert-info" />
                    </c:when>
                    <c:when test="${message.type == 'Success'}">
                        <c:set var="alert_type" value="alert-success" />
                    </c:when>
                </c:choose>
                <div class="col-6 alert ${alert_type} alert-dismissible fade show position-fixed" role="alert" style="z-index: 1050;">
                    <c:out value="${message.message}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </div>
    </c:if>
    <div class="container mt-5">
        <a href="${pageContext.request.contextPath}/admin?action=log_out" class="btn mb-3">Log Out</a>
        <h1 class="mb-4">Admin Home</h1>
        <div class="row">
            <div class="col-12">
                <ul class="nav nav-tabs" id="admin-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="request-tab" data-bs-toggle="tab"
                            data-bs-target="#request" type="button" role="tab" aria-controls="request"
                            aria-selected="true">Requests</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="tool-tab" data-bs-toggle="tab"
                            data-bs-target="#tool" type="button" role="tab" aria-controls="tool"
                            aria-selected="false">Tools</button>
                    </li>
                </ul>
                <div class="tab-content" id="admin-tab-content">
                    <div class="tab-pane fade show active" id="request" role="tabpanel" aria-labelledby="request-tab">
                        <h2 class="mb-3">Requests</h2>
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Requester</th>
                                    <th>Type</th>
                                    <th>Request At</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="req" items="${request_list}" varStatus="status">
                                <tr>
                                    <td>${status.index}</td>
                                    <td>${req.requesterName}</td>
                                    <td>${req.type}</td>
                                    <td><fmt:parseDate type="both" value="${req.requestAt}" pattern="yyyy-MM-dd'T'HH:mm"/></td>
                                    <td>${req.status}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/req?id=${req.id}" class="btn btn-primary">Details</a>
                                    </td>
                                </tr>
                                </c:forEach>
                                <tr>
                                    <td>1</td>
                                    <td>FPT University</td>
                                    <td>Contact</td>
                                    <td>Tue Jul 02 09:36:00 ICT 2024</td>
                                    <td>Pending</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/req?id=1" class="btn btn-primary">Details</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Michigan University</td>
                                    <td>Account</td>
                                    <td>Mon Jul 01 09:36:00 ICT 2024</td>
                                    <td>Done</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/req?id=2" class="btn btn-primary">Details</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Google</td>
                                    <td>Account</td>
                                    <td>Mon Jun 24 09:36:00 ICT 2024</td>
                                    <td>Cancel</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/req?id=3" class="btn btn-primary">Details</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="tool" role="tabpanel" aria-labelledby="tool-tab">
                        <h2 class="mb-3">Manage Accounts</h2>
                        <form action="${pageContext.request.contextPath}/admin/account" method="post" enctype="multipart/form-data">
                            <div class="mb-2">
                                <button id="add-acc-btn" class="btn btn-primary me-2">Add Account</button>
                                <input type="file" name="acc_file">
                            </div>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="acc-fields"></tbody>
                            </table>
                            <button type="submit" class="btn btn-success mt-3">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        let fieldCount = 0;
        function updateFieldNames() {
            const rows = document.querySelectorAll("#acc-fields tr");
            rows.forEach((row, index) => {
                row.querySelector("input[type=email]").name = "email_" + index;
                row.querySelector("select").name = "role_" + index;
            });
            fieldCount = rows.length;
        }

        document.getElementById("add-acc-btn").addEventListener("click", function() {
            let container = document.getElementById("acc-fields");
            let inputGroup = document.createElement("tr");
            
            let emailInput = document.createElement("input");
            emailInput.type = "email";
            emailInput.name = "email_" + fieldCount;
            emailInput.className = "form-control";
            emailInput.required = true;

            let emailField = document.createElement("td");
            emailField.appendChild(emailInput);
            
            let roleSelect = document.createElement("select");
            roleSelect.name = "role_" + fieldCount;
            roleSelect.className = "form-control";
            roleSelect.required = true;
            
            let option1 = document.createElement("option");
            option1.value = "Manager";
            option1.text = "Manager";
            roleSelect.appendChild(option1);
            let option2 = document.createElement("option");
            option2.value = "Teacher";
            option2.text = "Teacher";
            roleSelect.appendChild(option2);
            let option3 = document.createElement("option");
            option3.value = "Student";
            option3.text = "Student";
            roleSelect.appendChild(option3);

            let roleField = document.createElement("td");
            roleField.appendChild(roleSelect);

            let actionField = document.createElement("td");
            let deleteBtn = document.createElement("button");
            deleteBtn.className = "btn btn-danger";
            deleteBtn.textContent = "Remove";
            deleteBtn.addEventListener("click", function() {
                inputGroup.remove();
                updateFieldNames();
            });
            actionField.appendChild(deleteBtn);

            inputGroup.appendChild(emailField);
            inputGroup.appendChild(roleField);
            inputGroup.appendChild(actionField);
            container.appendChild(inputGroup);
            fieldCount++;
        });
    </script>
</body>
</html>
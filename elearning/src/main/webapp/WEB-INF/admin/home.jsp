<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.svg"/>
    <title>Admin</title>
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
</head>
<body>
    <c:if test="${not empty message}">
        <div class="container">
            <div class="row justify-content-center mt-3">
                <c:set var="alert_type" value="alert-info"/>
                <c:choose>
                    <c:when test="${message.type == 'Error'}">
                        <c:set var="alert_type" value="alert-danger"/>
                    </c:when>
                    <c:when test="${message.type == 'Warn'}">
                        <c:set var="alert_type" value="alert-warning"/>
                    </c:when>
                    <c:when test="${message.type == 'Info'}">
                        <c:set var="alert_type" value="alert-info"/>
                    </c:when>
                    <c:when test="${message.type == 'Success'}">
                        <c:set var="alert_type" value="alert-success"/>
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
                                        <td>${status.index + 1}</td>
                                        <td>${req.requesterName}</td>
                                        <td>${req.type}</td>
                                        <td><fmt:parseDate type="both" value="${req.requestedAt}" pattern="yyyy-MM-dd'T'HH:mm"/></td>
                                        <td>${req.status}</td>
                                        <td class="d-flex">
                                            <a href="${pageContext.request.contextPath}/admin/req?id=${req.id}" class="btn btn-primary">Details</a>
                                            <c:if test="${req.status != 'Pending'}">
                                                <form action="${pageContext.request.contextPath}/admin/req" method="post">
                                                    <input type="hidden" name="id" value="${req.id}">
                                                    <button type="submit" name="action" value="remove_request" class="btn btn-danger ms-3">Remove</button>
                                                </form>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="tool" role="tabpanel" aria-labelledby="tool-tab">
                        <h2 class="mb-3">Manage Accounts</h2>
                        <form action="${pageContext.request.contextPath}/admin/req" method="post" enctype="multipart/form-data">
                            <div class="mb-2 d-flex align-items-center">
                                <button type="button" id="add-acc-btn" class="btn btn-primary me-2">Add Account</button>
                                <div class="form-group">
                                    <input type="file" name="acc_file" accept=".csv" class="form-control ms-2">
                                </div>
                            </div>
                            <table class="table table-bordered table-striped">
                                <thead id="table-header">
                                    <tr>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Organization Name</th>
                                        <th>Country</th>
                                        <th>Position</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="acc-fields"></tbody>
                            </table>
                            <button type="submit" name="action" value="add_account" class="btn btn-success mt-3">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/form.js"></script>
    <script>
        const body = document.getElementById("acc-fields");
        let rowIdx = 0;
        document.getElementById("add-acc-btn").addEventListener("click", function() {
            addTableRow(rowIdx);
            rowIdx++;
        });
        function updateInputNames() {
            const rows = document.querySelectorAll("#acc-fields tr");
            rows.forEach((row, index) => {
                const tds = row.querySelectorAll("td");
                tds.forEach(td => {
                    const input = td.firstElementChild;
                    const lastUnderScore = input.name.lastIndexOf('_');
                    input.name = input.name.substring(0, lastUnderScore) + "_" + index;
                });
            });
            rowIdx = rows.length;
        }

        function addTableRow(index) {
            const row = document.createElement("tr");
            const emailInput = createInput("email_" + index, "email", "form-control", true);
            const managerInput = createInput("manager_" + index, "text", "form-control", false);
            const countries = new Intl.DisplayNames(["en"], { type: "region" });
            let names = [];
            for(let i = 65; i <= 90; ++i) {
                for(let j = 65; j <= 90; ++j) {
                    let code = String.fromCharCode(i) + String.fromCharCode(j)
                    let name = countries.of(code)
                    if (code !== name && name !== "Unknown Region") {
                        names.push(name);
                    }
                }
            }
            names = [ ...new Set(names) ].sort();
            const options = names.map(name => ({
                value: name,
                text: name,
                selected: false
            }));
            const countryInput = createSelect("country_" + index, options, "form-control", false);
            const positionInput = createInput("position_" + index, "text", "form-control", false);
            const roleSelect = createSelect("role_" + index, [
                { value: "Manager", text: "Manager", selected: true },
                { value: "Teacher", text: "Teacher", selected: false },
                { value: "Student", text: "Student", selected: false }
            ], "form-control", true, {
                event: "change",
                handler: function() {
                    const role = roleSelect.value;
                    switch (role) {
                        case "Student":
                            managerInput.required = false;
                            managerInput.disabled = true;
                            countryInput.required = false;
                            countryInput.disabled = true;
                            positionInput.required = false;
                            positionInput.disabled = true;
                            break;
                        case "Manager":
                            managerInput.required = true;
                            managerInput.disabled = false;
                            countryInput.required = false;
                            countryInput.disabled = false;
                            positionInput.required = false;
                            positionInput.disabled = true;
                            break;
                        case "Teacher":
                            managerInput.required = true;
                            managerInput.disabled = false;
                            countryInput.required = false;
                            countryInput.disabled = true;
                            positionInput.required = false;
                            positionInput.disabled = false;
                            break;
                        default:
                            break;
                    }
                }
            });
            row.appendChild(document.createElement("td").appendChild(emailInput).parentNode);
            row.appendChild(document.createElement("td").appendChild(roleSelect).parentNode);
            row.appendChild(document.createElement("td").appendChild(managerInput).parentNode);
            row.appendChild(document.createElement("td").appendChild(countryInput).parentNode);
            row.appendChild(document.createElement("td").appendChild(positionInput).parentNode);
            const role = roleSelect.value;
            switch (role) {
                case "Student":
                    managerInput.required = false;
                    managerInput.disabled = true;
                    countryInput.required = false;
                    countryInput.disabled = true;
                    positionInput.required = false;
                    positionInput.disabled = true;
                    break;
                case "Manager":
                    managerInput.required = true;
                    managerInput.disabled = false;
                    countryInput.required = false;
                    countryInput.disabled = false;
                    positionInput.required = false;
                    positionInput.disabled = true;
                    break;
                case "Teacher":
                    managerInput.required = true;
                    managerInput.disabled = false;
                    countryInput.required = false;
                    countryInput.disabled = true;
                    positionInput.required = false;
                    positionInput.disabled = false;
                    break;
                default:
                    break;
            }
            const deleteBtn = createButton("button", "btn btn-danger", "Remove", {
                event: "click",
                handler: function() {
                    row.remove();
                    updateInputNames();
                }
            });
            row.appendChild(document.createElement("td").appendChild(deleteBtn).parentNode);
            body.appendChild(row);
        }
    </script>
</body>
</html>
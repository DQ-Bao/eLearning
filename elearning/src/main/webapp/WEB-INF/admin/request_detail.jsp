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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/simplemde.min.css"/>
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
                    <c:out value="${message.message}" escapeXml="false"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </div>
    </c:if>
    <div class="container my-5">
        <h1>Request Details</h1>
        <c:choose>
            <c:when test="${req.type == 'Contact'}">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Contact Information</h2>
                        <p class="card-text"><strong>Name:</strong> ${req.representativeName}</p>
                        <p class="card-text"><strong>Organization Name:</strong> ${req.requesterName}</p>
                        <p class="card-text"><strong>Email:</strong> ${req.email}</p>
                        <p class="card-text"><strong>Phone Number:</strong> ${req.phone}</p>
                        <p class="card-text"><strong>Message:</strong> ${req.message}</p>
                        <p class="card-text"><strong>Time Sent:</strong> <fmt:parseDate type="both" value="${req.requestedAt}" pattern="yyyy-MM-dd'T'HH:mm"/></p>
                        <p class="card-text"><strong>Status:</strong> ${req.status}</p>
                    </div>
                </div>
                <c:if test="${req.status == 'Pending'}">
                    <div class="mt-4">
                        <h2>Reply</h2>
                        <form action="${pageContext.request.contextPath}/admin/req" method="post">
                            <input type="hidden" name="id" value="${req.id}">
                            <input type="hidden" name="email" value="${req.email}">
                            <div class="form-group mb-2">
                                <select name="status" id="status" class="form-control" required>
                                    <option value="Pending" ${req.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                    <option value="Accepted" ${req.status == 'Accepted' ? 'selected' : ''}>Accepted</option>
                                    <option value="Rejected" ${req.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <textarea name="reply_message" id="reply_message_box" class="form-control"></textarea>
                            </div>
                            <button type="submit" name="action" value="send_contact_reply" class="btn btn-primary">Send Email</button>
                        </form>
                    </div>
                </c:if>
            </c:when>
            <c:otherwise>
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Account Request</h2>
                        <p class="card-text"><strong>Organization Name:</strong> ${req.requesterName}</p>
                        <p class="card-text"><strong>Message:</strong> ${req.message}</p>
                        <p class="card-text"><strong>Time Sent:</strong> <fmt:parseDate type="both" value="${req.requestedAt}" pattern="yyyy-MM-dd'T'HH:mm"/></p>
                        <p class="card-text"><strong>Status:</strong> ${req.status}</p>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${req.status == 'Pending'}">
                        <div class="mt-4">
                            <h2>Account List</h2>
                            <form action="${pageContext.request.contextPath}/admin/req" method="post">
                                <input type="hidden" name="id" value="${req.id}">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <td>Position</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="acc" items="${req.accounts}" varStatus="status">
                                            <input type="hidden" name="manager_${status.index}" value="${acc.manager}" readonly>
                                            <tr>
                                                <td><input type="email" name="email_${status.index}" value="${acc.email}" class="form-control-plaintext" readonly></td>
                                                <td><input type="text" name="role_${status.index}" value="${acc.role}" class="form-control-plaintext" readonly></td>
                                                <td><input type="text" name="position_${status.index}" value="${acc.position}" class="form-control-plaintext" readonly></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="mt-2">
                                    <div class="form-group mb-2">
                                        <select name="status" id="status" class="form-control" required>
                                            <option value="Pending" ${req.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                            <option value="Accepted" ${req.status == 'Accepted' ? 'selected' : ''}>Accepted</option>
                                            <option value="Rejected" ${req.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                                        </select>
                                    </div>
                                    <div class="form-group mb-2">
                                        <textarea name="reply_message" class="form-control" style="min-height: 300px;">${req.reply}</textarea>
                                    </div>
                                    <button type="submit" name="action" value="send_account_reply" class="btn btn-primary">Send Reply</button>
                                </div>
                            </form>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="mt-4">
                            <h2>Account List</h2>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <td>Position</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="acc" items="${req.accounts}" varStatus="status">
                                        <tr>
                                            <td>${acc.email}</td>
                                            <td>${acc.role}</td>
                                            <td>${acc.position}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="mt-2">
                                <textarea class="form-control" style="min-height: 300px;" readonly>${req.reply}</textarea>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </div>

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/simplemde.min.js"></script>
    <c:if test="${req.type == 'Contact'}">
        <script>
            const simplemde = new SimpleMDE({ element: document.getElementById("reply_message_box") });
        </script>
    </c:if>
</body>
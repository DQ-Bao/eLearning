<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                    <c:out value="${message.message}" escapeXml="false"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </div>
    </c:if>
    <div class="d-flex align-items-center bg-light" style="height: 100vh;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h2 class="text-center mb-4">Admin Login</h2>
                            <form action="${pageContext.request.contextPath}/admin" method="post">
                                <div class="form-group mb-3">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username" class="form-control" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="password">Password</label>
                                    <input type="password" id="password" name="password" class="form-control" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>
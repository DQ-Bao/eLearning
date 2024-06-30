<%@tag description="Page layout" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="head" fragment="true"%>
<%@attribute name="nav" fragment="true"%>
<%@attribute name="script" fragment="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>eLEARNING</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.svg">
    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/LineIcons.2.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <jsp:invoke fragment="head"/>
</head>
<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

    <!-- Start Header Area -->
    <header class="header navbar-area sticky">
        <c:if test="${empty sessionScope.user}">
            <!-- Toolbar Start -->
            <div class="toolbar-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-6 col-12">
                            <div class="toolbar-social">
                                <ul>
                                    <li><span class="title">Follow Us On : </span></li>
                                    <li><a href="javascript:void(0)"><i class="lni lni-facebook-original"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="lni lni-instagram"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="lni lni-linkedin-original"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="lni lni-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="toolbar-login">
                                <div class="button">
                                    <a href="${pageContext.request.contextPath}/register">Create an Account</a>
                                    <a href="${pageContext.request.contextPath}/login" class="btn">Log In</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Toolbar End -->
        </c:if>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <div class="nav-inner">
                        <nav class="navbar navbar-expand-lg">
                            <a class="navbar-brand" href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/img/logo.svg" alt="Logo">
                            </a>
                            <form action="${pageContext.request.contextPath}/search" method="post" class="d-flex search-form">
                                <input name="query" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success" type="submit"><i class="lni lni-search-alt"></i></button>
                            </form>
                            <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                                <ul id="nav" class="navbar-nav ms-auto">
                                    <li class="nav-item">
                                        <a class="page-scroll dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#category-submenu" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">Explore</a>
                                        <ul class="sub-menu collapse" id="category-submenu">
                                            <c:forEach var="category" items="${category_list}">
                                                <li class="nav-item"><a href="${pageContext.request.contextPath}/courses?category=${category}">${category}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                    <li class="nav-item"><a href="${pageContext.request.contextPath}/courses">Courses</a></li>
                                    <li class="nav-item"><a href="${pageContext.request.contextPath}/about.jsp">About</a></li>
                                    <li class="nav-item"><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
                                    <jsp:invoke fragment="nav"/>
                                    <c:if test="${not empty sessionScope.user}">
                                        <li class="nav-item">
                                            <a class="page-scroll dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#user-submenu" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                                <c:choose>
                                                    <c:when test="${not empty sessionScope.user.firstName and not empty sessionScope.user.lastName}">
                                                        ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${sessionScope.user.account.email}
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                            <ul class="sub-menu collapse" id="user-submenu">
                                                <li class="nav-item"><a href="${pageContext.request.contextPath}/user_profile.jsp">Profile</a></li>
                                                <li class="nav-item"><a href="${pageContext.request.contextPath}/account">Account</a></li>
                                                <li class="nav-item"><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                                            </ul>
                                        </li>
                                    </c:if>
                                </ul>
                            </div> <!-- navbar collapse -->
                        </nav> <!-- navbar -->
                    </div>
                </div>
            </div> <!-- row -->
        </div> <!-- container -->
    </header>
    <!-- End Header Area -->

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

    <jsp:doBody/>

    <!-- Start Footer Area -->
    <footer class="footer">
        <!-- Start Middle Top -->
        <div class="footer-middle">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- Single Widget -->
                        <div class="f-about single-footer">
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/logo.svg" alt="Logo"></a>
                            </div>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>FPT University, Hoa Lac, Thach That, Ha Noi, Viet Nam</p>
                            <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>(+81) 123 456 789</p>
                            <p class="mb-2"><i class="fa fa-envelope me-3"></i>elearningswp@gmail.com</p>
                            <div class="footer-social">
                                <ul>
                                    <li><a href="javascript:void(0)"><i class="lni lni-facebook-original"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="lni lni-linkedin-original"></i></a></li>
                                    <li><a href="javascript:void(0)"><i class="lni lni-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Footer Middle -->
        <!-- Start Footer Bottom -->
        <div class="footer-bottom">
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-12">
                            <div class="left">
                                <p>Designed by<a href="https://graygrids.com/" rel="nofollow" target="_blank">GrayGrids</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Footer Middle -->
    </footer>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover" style="display: flex;"><i class="lni lni-chevron-up"></i></a>

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <jsp:invoke fragment="script"/>
</body>

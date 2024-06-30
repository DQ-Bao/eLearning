<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs overlay">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 offset-lg-2 col-md-12 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">About Us</h1>
                    </div>
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}">Home</a></li>
                        <li>About Us</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start About Us Area -->
    <section class="about-us section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-12">
                    <div class="about-left">
                        <div class="about-title align-left">
                            <span class="wow fadeInDown" data-wow-delay=".2s">About Our Platform</span>
                            <h2 class="wow fadeInUp" data-wow-delay=".4s">Welcome to eLEARNING</h2>
                            <p class="wow fadeInUp" data-wow-delay=".6s">Welcome to eLEARNING, your premier destination for online education! At eLEARNING, we are dedicated to transforming the way you learn by providing a comprehensive, accessible, and engaging platform that caters to learners of all ages and backgrounds.</p>
                            <p class="qote wow fadeInUp" data-wow-delay=".8s">Our mission is to democratize education and make high-quality learning experiences accessible to everyone, regardless of location or background. We believe that education is the key to personal and professional growth, and we are committed to empowering individuals through knowledge.</p>
                            <div class="button wow fadeInUp" data-wow-delay="1s">
                                <a href="javascript:void(0)" class="btn">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="about-right wow fadeInRight" data-wow-delay=".4s">
                        <img src="${pageContext.request.contextPath}/img/about-img2.png" alt="About Us">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /End About Us Area -->
</t:main>
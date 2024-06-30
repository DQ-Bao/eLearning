<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
    <jsp:attribute name="script">
        <script>
            //========= Hero Slider 
            tns({
                container: '.hero-slider',
                items: 1,
                slideBy: 'page',
                autoplay: false,
                mouseDrag: true,
                gutter: 0,
                nav: true,
                controls: false,
                controlsText: ['<i class="lni lni-arrow-left"></i>', '<i class="lni lni-arrow-right"></i>'],
            });
            //========= testimonial 
            tns({
                container: '.testimonial-slider',
                items: 3,
                slideBy: 'page',
                autoplay: false,
                mouseDrag: true,
                gutter: 0,
                nav: true,
                controls: false,
                controlsText: ['<i class="lni lni-arrow-left"></i>', '<i class="lni lni-arrow-right"></i>'],
                responsive: {
                    0: {
                        items: 1,
                    },
                    540: {
                        items: 1,
                    },
                    768: {
                        items: 2,
                    },
                    992: {
                        items: 2,
                    },
                    1170: {
                        items: 3,
                    }
                }
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <!-- Start Hero Area -->
        <section class="hero-area">
            <div class="hero-slider">
                <!-- Single Slider -->
                <div class="hero-inner overlay" style="background-image: url('${pageContext.request.contextPath}/img/slider-bg1.jpg');">
                    <div class="container">
                        <div class="row ">
                            <div class="col-lg-8 offset-lg-2 col-md-12 co-12">
                                <div class="home-slider">
                                    <div class="hero-text">
                                        <h5 class="wow fadeInUp" data-wow-delay=".3s">Start to Learning Today</h5>
                                        <h1 class="wow fadeInUp" data-wow-delay=".5s">Excellent And Friendly <br> Faculty Members</h1>
                                        <p class="wow fadeInUp" data-wow-delay=".7s">Lorem Ipsum is simply dummy text of the
                                            printing and typesetting <br> industry. Lorem Ipsum has been the industry's
                                            standard
                                            <br>dummy text ever since an to impression.</p>
                                        <div class="button wow fadeInUp" data-wow-delay=".9s">
                                            <a href="${pageContext.request.contextPath}/about.jsp" class="btn">Learn More</a>
                                            <a href="${pageContext.request.contextPath}/courses" class="btn alt-btn">Our Courses</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ End Single Slider -->
                <!-- Single Slider -->
                <div class="hero-inner overlay" style="background-image: url('${pageContext.request.contextPath}/img/slider-bg2.jpg');">
                    <div class="container">
                        <div class="row ">
                            <div class="col-lg-8 offset-lg-2 col-md-12 co-12">
                                <div class="home-slider">
                                    <div class="hero-text">
                                        <h5 class="wow fadeInUp" data-wow-delay=".3s">Start to learning Today</h5>
                                        <h1 class="wow fadeInUp" data-wow-delay=".5s">Innovation Paradise<br> For Students </h1>
                                        <p class="wow fadeInUp" data-wow-delay=".7s">Lorem Ipsum is simply dummy text of the
                                            printing and typesetting <br> industry. Lorem Ipsum has been the industry's
                                            standard
                                            <br>dummy text ever since an to impression.</p>
                                        <div class="button wow fadeInUp" data-wow-delay=".9s">
                                            <a href="${pageContext.request.contextPath}/about.jsp" class="btn">Learn More</a>
                                            <a href="${pageContext.request.contextPath}/courses" class="btn alt-btn">Our Courses</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ End Single Slider -->
                <!-- Single Slider -->
                <div class="hero-inner overlay" style="background-image: url('${pageContext.request.contextPath}/img/slider-bg3.jpg');">
                    <div class="container">
                        <div class="row ">
                            <div class="col-lg-8 offset-lg-2 col-md-12 co-12">
                                <div class="home-slider">
                                    <div class="hero-text">
                                        <h5 class="wow fadeInUp" data-wow-delay=".3s">Start to learning Today</h5>
                                        <h1 class="wow fadeInUp" data-wow-delay=".5s">Your Ideas Will Be <br> Heard & Supported</h1>
                                        <p class="wow fadeInUp" data-wow-delay=".7s">Lorem Ipsum is simply dummy text of the
                                            printing and typesetting <br> industry. Lorem Ipsum has been the industry's
                                            standard
                                            <br>dummy text ever since an to impression.</p>
                                        <div class="button wow fadeInUp" data-wow-delay=".9s">
                                            <a href="${pageContext.request.contextPath}/about.jsp" class="btn">Learn More</a>
                                            <a href="${pageContext.request.contextPath}/courses" class="btn alt-btn">Our Courses</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ End Single Slider -->
            </div>
        </section>
        <!--/ End Hero Area -->
        <!-- Start Features Area -->
        <section class="features">
            <div class="container-fluid">
                <div class="single-head">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-12 padding-zero">
                            <!-- Start Single Feature -->
                            <div class="single-feature">
                                <h3><a href="javascript:void(0)">Trending Courses</a></h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus, quaerat beatae
                                    nulla debitis vitae temporibus sed.</p>
                                <div class="button">
                                    <a href="javascript:void(0)" class="btn">Explore <i class="lni lni-arrow-right"></i></a>
                                </div>
                            </div>
                            <!-- End Single Feature -->
                        </div>
                        <div class="col-lg-4 col-md-4 col-12 padding-zero">
                            <!-- Start Single Feature -->
                            <div class="single-feature">
                                <h3><a href="javascript:void(0)">Certified Teachers</a></h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus, quaerat beatae
                                    nulla debitis vitae temporibus sed.</p>

                                <div class="button">
                                    <a href="javascript:void(0)" class="btn">Explore <i class="lni lni-arrow-right"></i></a>
                                </div>
                            </div>
                            <!-- End Single Feature -->
                        </div>
                        <div class="col-lg-4 col-md-4 col-12 padding-zero">
                            <!-- Start Single Feature -->
                            <div class="single-feature last">
                                <h3><a href="javascript:void(0)">Books & Library</a></h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus, quaerat beatae
                                    nulla debitis vitae temporibus sed.</p>

                                <div class="button">
                                    <a href="javascript:void(0)" class="btn">Explore <i class="lni lni-arrow-right"></i></a>
                                </div>
                            </div>
                            <!-- End Single Feature -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /End Features Area -->

        <!-- Start About Us Area -->
        <section class="about-us section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-12">
                        <div class="about-left">
                            <div class="about-title align-left">
                                <span class="wow fadeInDown" data-wow-delay=".2s">About Our Platform</span>
                                <h2 class="wow fadeInUp" data-wow-delay=".4s">Welcome to eLEARNING</h2>
                                <p class="wow fadeInUp" data-wow-delay=".6s">
                                    Welcome to eLEARNING, your premier destination for online education! 
                                    At eLEARNING, we are dedicated to transforming the way you learn by providing a comprehensive, accessible, and engaging platform that caters to learners of all ages and backgrounds.</p>
                                <p class="qote wow fadeInUp" data-wow-delay=".8s">
                                    Our mission is to democratize education and make high-quality learning experiences accessible to everyone, regardless of location or background. 
                                    We believe that education is the key to personal and professional growth, and we are committed to empowering individuals through knowledge.
                                </p>
                                <div class="button wow fadeInUp" data-wow-delay="1s">
                                    <a href="${pageContext.request.contextPath}/about.jsp" class="btn">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-12">
                        <div class="about-right wow fadeInRight" data-wow-delay=".4s">
                            <img src="${pageContext.request.contextPath}/img/about-img2.png" alt="#">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /End About Us Area -->

        <!-- Start Courses Area -->
        <section class="courses section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <div class="section-icon wow zoomIn" data-wow-delay=".4s">
                                <i class="lni lni-graduation"></i>
                            </div>
                            <h2 class="wow fadeInUp" data-wow-delay=".4s">Featured Courses</h2>
                            <p class="wow fadeInUp" data-wow-delay=".6s">There are many variations of passages of Lorem
                                Ipsum available, but the majority have suffered alteration in some form.</p>
                        </div>
                    </div>
                </div>
                <div class="single-head">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Start Single Course -->
                            <div class="single-course wow fadeInUp" data-wow-delay=".2s">
                                <div class="course-image">
                                    <a href="course-details.html"><img src="${pageContext.request.contextPath}/img/courses-1.jpg"
                                            alt="#"></a>
                                    <p class="price">$180</p>
                                </div>
                                <div class="content">
                                    <h3><a href="course-details.html">Computer Science</a></h3>
                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                                        laborum.</p>
                                </div>
                                <div class="bottom-content">
                                    <ul class="review">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li>22 Reviews</li>
                                    </ul>
                                    <span class="tag">
                                        <i class="lni lni-tag"></i>
                                        <a href="javascript:void(0)">Programming</a>
                                    </span>
                                </div>
                            </div>
                            <!-- End Single Course -->
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Start Single Course -->
                            <div class="single-course wow fadeInUp" data-wow-delay=".4s">
                                <div class="course-image">
                                    <a href="course-details.html"><img src="${pageContext.request.contextPath}/img/courses-2.jpg"
                                            alt="#"></a>
                                    <p class="price">$200</p>
                                </div>
                                <div class="content">
                                    <h3><a href="course-details.html">Business Management</a></h3>
                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                                        laborum.</p>
                                </div>
                                <div class="bottom-content">
                                    <ul class="review">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li>10 Reviews</li>
                                    </ul>
                                    <span class="tag">
                                        <i class="lni lni-tag"></i>
                                        <a href="javascript:void(0)">Business</a>
                                    </span>
                                </div>
                            </div>
                            <!-- End Single Course -->
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Start Single Course -->
                            <div class="single-course wow fadeInUp" data-wow-delay=".6s">
                                <div class="course-image">
                                    <a href="course-details.html"><img src="${pageContext.request.contextPath}/img/courses-3.jpg"
                                            alt="#"></a>
                                    <p class="price">Free</p>
                                </div>
                                <div class="content">
                                    <h3><a href="course-details.html">Java Online Course</a></h3>
                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                                        laborum.</p>
                                </div>
                                <div class="bottom-content">
                                    <ul class="review">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li>55 Reviews</li>
                                    </ul>
                                    <span class="tag">
                                        <i class="lni lni-tag"></i>
                                        <a href="javascript:void(0)">Programming</a>
                                    </span>
                                </div>
                            </div>
                            <!-- End Single Course -->
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Start Single Course -->
                            <div class="single-course wow fadeInUp" data-wow-delay=".2s">
                                <div class="course-image">
                                    <a href="course-details.html"><img src="${pageContext.request.contextPath}/img/courses-4.jpg"
                                            alt="#"></a>
                                    <p class="price">$299</p>
                                </div>
                                <div class="content">
                                    <h3><a href="course-details.html">Electrical Engineering</a></h3>
                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                                        laborum.</p>
                                </div>
                                <div class="bottom-content">
                                    <ul class="review">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li>60 Reviews</li>
                                    </ul>
                                    <span class="tag">
                                        <i class="lni lni-tag"></i>
                                        <a href="javascript:void(0)">Science</a>
                                    </span>
                                </div>
                            </div>
                            <!-- End Single Course -->
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Start Single Course -->
                            <div class="single-course wow fadeInUp" data-wow-delay=".4s">
                                <div class="course-image">
                                    <a href="course-details.html"><img src="${pageContext.request.contextPath}/img/courses-5.jpg"
                                            alt="#"></a>
                                    <p class="price">$150</p>
                                </div>
                                <div class="content">
                                    <h3><a href="course-details.html">Architecture Design</a></h3>
                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                                        laborum.</p>
                                </div>
                                <div class="bottom-content">
                                    <ul class="review">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li>25 Reviews</li>
                                    </ul>
                                    <span class="tag">
                                        <i class="lni lni-tag"></i>
                                        <a href="javascript:void(0)">Design</a>
                                    </span>
                                </div>
                            </div>
                            <!-- End Single Course -->
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Start Single Course -->
                            <div class="single-course wow fadeInUp" data-wow-delay=".6s">
                                <div class="course-image">
                                    <a href="course-details.html"><img src="${pageContext.request.contextPath}/img/courses-6.jpg"
                                            alt="#"></a>
                                    <p class="price">$250</p>
                                </div>
                                <div class="content">
                                    <h3><a href="course-details.html">Medical Technology</a></h3>
                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                                        laborum.</p>
                                </div>
                                <div class="bottom-content">
                                    <ul class="review">
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li><i class="lni lni-star-filled"></i></li>
                                        <li>35 Reviews</li>
                                    </ul>
                                    <span class="tag">
                                        <i class="lni lni-tag"></i>
                                        <a href="javascript:void(0)">Medical</a>
                                    </span>
                                </div>
                            </div>
                            <!-- End Single Course -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Courses Area -->

        <!-- Start Testimonials Area -->
        <section class="testimonials section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title align-center gray-bg">
                            <div class="section-icon wow zoomIn" data-wow-delay=".4s">
                                <i class="lni lni-quotation"></i>
                            </div>
                            <h2 class="wow fadeInUp" data-wow-delay=".4s">What Our Students Say</h2>
                            <p class="wow fadeInUp" data-wow-delay=".6s">There are many variations of passages of Lorem
                                Ipsum available, but the majority have suffered alteration in some form.</p>
                        </div>
                    </div>
                </div>
                <div class="row testimonial-slider">
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Testimonial -->
                        <div class="single-testimonial">
                            <div class="text">
                                <p>"It's amazing how much easier it has been to meet new people and create instant
                                    connections. I have the exact same personality, the only thing that has changed is my
                                    mindset and a few behaviors."</p>
                            </div>
                            <div class="author">
                                <img src="${pageContext.request.contextPath}/img/testi-1.jpg" alt="#">
                                <h4 class="name">
                                    Jane Anderson
                                    <span class="deg">Founder & CEO</span>
                                </h4>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Testimonial -->
                        <div class="single-testimonial">
                            <div class="text">
                                <p>"It's amazing how much easier it has been to meet new people and create instant
                                    connections. I have the exact same personality, the only thing that has changed is my
                                    mindset and a few behaviors."</p>
                            </div>
                            <div class="author">
                                <img src="${pageContext.request.contextPath}/img/testi-2.jpg" alt="#">
                                <h4 class="name">
                                    Jane Anderson
                                    <span class="deg">Founder & CEO</span>
                                </h4>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Testimonial -->
                        <div class="single-testimonial">
                            <div class="text">
                                <p>"It's amazing how much easier it has been to meet new people and create instant
                                    connections. I have the exact same personality, the only thing that has changed is my
                                    mindset and a few behaviors."</p>
                            </div>
                            <div class="author">
                                <img src="${pageContext.request.contextPath}/img/testi-3.jpg" alt="#">
                                <h4 class="name">
                                    Jane Anderson
                                    <span class="deg">Founder & CEO</span>
                                </h4>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Testimonial -->
                        <div class="single-testimonial">
                            <div class="text">
                                <p>"It's amazing how much easier it has been to meet new people and create instant
                                    connections. I have the exact same personality, the only thing that has changed is my
                                    mindset and a few behaviors."</p>
                            </div>
                            <div class="author">
                                <img src="${pageContext.request.contextPath}/img/testi-4.jpg" alt="#">
                                <h4 class="name">
                                    Jane Anderson
                                    <span class="deg">Founder & CEO</span>
                                </h4>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                    </div>

                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Testimonial -->
                        <div class="single-testimonial">
                            <div class="text">
                                <p>"It's amazing how much easier it has been to meet new people and create instant
                                    connections. I have the exact same personality, the only thing that has changed is my
                                    mindset and a few behaviors."</p>
                            </div>
                            <div class="author">
                                <img src="${pageContext.request.contextPath}/img/testi-3.jpg" alt="#">
                                <h4 class="name">
                                    Jane Anderson
                                    <span class="deg">Founder & CEO</span>
                                </h4>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Testimonial -->
                        <div class="single-testimonial">
                            <div class="text">
                                <p>"It's amazing how much easier it has been to meet new people and create instant
                                    connections. I have the exact same personality, the only thing that has changed is my
                                    mindset and a few behaviors."</p>
                            </div>
                            <div class="author">
                                <img src="${pageContext.request.contextPath}/img/testi-2.jpg" alt="#">
                                <h4 class="name">
                                    Jane Anderson
                                    <span class="deg">Founder & CEO</span>
                                </h4>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <!-- Start Single Testimonial -->
                        <div class="single-testimonial">
                            <div class="text">
                                <p>"It's amazing how much easier it has been to meet new people and create instant
                                    connections. I have the exact same personality, the only thing that has changed is my
                                    mindset and a few behaviors."</p>
                            </div>
                            <div class="author">
                                <img src="${pageContext.request.contextPath}/img/testi-3.jpg" alt="#">
                                <h4 class="name">
                                    Jane Anderson
                                    <span class="deg">Founder & CEO</span>
                                </h4>
                            </div>
                        </div>
                        <!-- End Single Testimonial -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Testimonial Area -->
    </jsp:body>
</t:main>
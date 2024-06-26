<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
    <jsp:attribute name="head">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .header, .footer {
                background-color: #333;
                color: #fff;
                text-align: center;
                padding: 1em 0;
            }
            .nav {
                background-color: #444;
                color: #fff;
                padding: 0.5em 0;
                text-align: center;
            }
            .nav ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
                display: inline-block;
            }
            .nav ul li {
                display: inline;
                margin-right: 10px;
            }
            .nav ul li a {
                color: #fff;
                text-decoration: none;
                padding: 0.5em 1em;
                display: inline-block;
            }
            .nav ul li a:hover {
                background-color: #555;
            }
            .content {
                margin: 2em auto;
                max-width: 1200px;
                background-color: #fff;
                padding: 2em;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .profile {
                display: flex;
                align-items: center;
                margin-bottom: 2em;
            }
            .profile img {
                border-radius: 50%;
                margin-right: 1em;
                width: 150px;
                height: 150px;
                object-fit: cover;
            }
            .profile-info {
                max-width: 600px;
            }
            .profile-info h2 {
                margin-top: 0;
            }
            .profile-info p {
                color: #666;
            }
            .bio {
                margin-top: 2em;
            }
            .courses {
                margin-top: 2em;
            }
            .course-card {
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 1em;
                margin-bottom: 1em;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .course-card h4 {
                margin-top: 0;
            }
            .course-card p {
                color: #666;
            }
            .course-card .btn {
                display: inline-block;
                margin-top: 1em;
                padding: 0.5em 1em;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
            }
            .course-card .btn:hover {
                background-color: #0056b3;
            }
            /* CSS for price display */
            .course-card .price {
                font-weight: bold;
                color: #007bff;
                font-size: 1.5rem;
                margin-right: 0.5em;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <main class="content">
            <div class="container-fluid bg-primary py-5 mb-5 page-header">
                <div class="container py-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-10 text-center">
                            <h1 class="display-3 text-white animated slideInDown">Courses</h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Courses</h6>
                <h1 class="mb-5">Assigned courses</h1>
            </div>
            
            <div class="row g-4 justify-content-center">
                <div data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                    <div class="course-item bg-light">
                        <div class="position-relative overflow-hidden">
                            <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                            </div>
                        </div>
                        <div class="text-center p-4 pb-0">
                            <h3 class="mb-0">Building Your Freelancing Career Building Your Freelancing Career Specialization <span class="price">$149.00</span></h3>
                        </div>
                    </div>
                </div>
                <div data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
                    <div class="course-item bg-light">
                        <div class="position-relative overflow-hidden">
                            <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                            </div>
                        </div>
                        <div class="text-center p-4 pb-0">
                            <h3 class="mb-0">Game Design: Art and Concepts Game Design: Art and Concepts Specialization <span class="price">$149.00</span></h3>
                        </div>
                    </div>
                </div>
                <div data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                    <div class="course-item bg-light">
                        <div class="position-relative overflow-hidden">
                            <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                            </div>
                        </div>
                        <div class="text-center p-4 pb-0">
                            <h3 class="mb-0">Graphic Design Specialization <span class="price">$149.00</span></h3>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </jsp:body>
</t:main>

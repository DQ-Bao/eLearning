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
        </style>
    </jsp:attribute>
    <jsp:body>
        <main class="content">
            <div class="profile">
                <img src="path/to/profile/image.jpg" alt="Profile Image">
                <div class="profile-info">
                    <h2>Welcome, ${teacher.firstName} ${teacher.lastName}!</h2>
                </div>
            </div>
            <section class="bio">
                <h3>About Me</h3>
                <p>${teacher.bio}</p>
            </section>
            <section class="courses">
                <h3>Your Courses</h3>
                <c:forEach var="course" items="${course_list}">
                    <div class="course-card">
                        <h4>
                            <a href="${pageContext.request.contextPath}/courses?id=${course.id}" class="btn">${course.title}</a>
                        </h4>
                        <p>${course.description}</p>
                    </div>
                </c:forEach>
            </section>
        </main>
    </jsp:body>
</t:main>
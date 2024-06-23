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
            .intro, .courses, .management {
                margin-bottom: 2em;
            }
            .intro img {
                max-width: 100%;
                border-radius: 5px;
                margin-bottom: 1em;
            }
            .card {
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 1em;
                margin-bottom: 1em;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .card h3 {
                margin-top: 0;
            }
            .card p {
                color: #666;
            }
            .card .btn {
                display: inline-block;
                margin-top: 1em;
                padding: 0.5em 1em;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
            }
            .card .btn:hover {
                background-color: #0056b3;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <main class="content">
            <section class="intro">
                <h2>About ${manager.orgName}</h2>
                <img src="path/to/calarts/image.jpg" alt="CalArts Image">
                <p>${manager.description}</p>
            </section>
            <section class="courses">
                <h2>Our Courses</h2>
                <c:forEach var="course" items="${course_list}">
                    <div class="card">
                        <h3>${course.title}</h3>
                        <p>${course.description}</p>
                        <a href="${pageContext.request.contextPath}/courses?id=${course.id}" class="btn">View Course</a>
                    </div>
                </c:forEach>
                <!-- Add more course cards as needed -->
            </section>
        </main>
    </jsp:body>
</t:main>
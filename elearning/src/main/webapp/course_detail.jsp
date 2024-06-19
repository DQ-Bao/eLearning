<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <jsp:attribute name="head">
        <style>
            body {
                font-family: "Heebo",sans-serif;
            }
            .header {
                position: relative;
                text-align: center;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
            }
            .header img {
                width: 50%;
                height: auto;
                display: block;
                filter: brightness(50%); /* Adjust the brightness as needed */
            }
            .header-text {
                position: absolute;
                font-size: 2em;
                font-weight: bold;
                width: 100%; /* Adjust as needed */
                white-space: normal; /* Allow text to wrap */
                text-align: center; /* Center align the text */
            }
            .form-container {
                padding: 20px;
                max-width: 1000px;
                margin: 0 auto;
                background-color: #f7f7f7;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
            }
            .form-group input,
            .form-group textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .form-group button {
                padding: 10px 20px;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .form-group button:hover {
                background-color: #218838;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <div class="header">
            <img src="${course.imagePath}" alt="Header Image">
            <div class="header-text">${course.title}</div>
        </div>
    
        
        <div class="form-container">
            <form action="/submit-form" method="post">
                <div class="form-group">
                    <button class="">Enroll</button> $${course.price==0?"FREE":course.price}
                    <h1>Details:</h1>
                    <h2>Description:</h2>
                    <p>${course.description}</p>
                    <h2>Language:</h2>
                    <p>${course.language}</p>
                </div>
            </form>
        </div>
        <br>
        <div class="form-container">
            <h1>Lessons</h1>
            <c:forEach var="lesson" items="${lesson_list}">
                <div>
                    <h2>${lesson.title}</h2>
                    <h3>Status:</h3> 
                </div>
            </c:forEach>
        </div>
        <br>
        <div class="form-container">
            <c:forEach var="teacher" items="${teacher_list}">
                <h1>Teacher:</h1>
                <div style="display: flex; align-items: center;">
                    <img src="${teacher.imagePath}" style="width: 50%; height: auto; padding-right: 20%;">
                    <h2>${teacher.firstName} ${teacher.lastName}</h2>
                </div>
            </c:forEach>
        </div>
    </jsp:body>
</t:main>
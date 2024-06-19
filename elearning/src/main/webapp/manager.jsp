<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manager Dashboard - CalArts</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
</head>
<body>
    <header class="header">
        <h1>CalArts - Manager Dashboard</h1>
    </header>
    <nav class="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/manageUsers">Manage Users</a></li>
            <li><a href="${pageContext.request.contextPath}/reports">Reports</a></li>
            <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
        </ul>
    </nav>
    <main class="content">
        <section class="intro">
            <h2>About CalArts</h2>
            <img src="path/to/calarts/image.jpg" alt="CalArts Image">
            <p>California Institute of the Arts (CalArts) is renowned internationally as a game-changer in the education of professional artists. Our school offers a comprehensive program of undergraduate and graduate degrees in art, design, film, music, theater, and dance. Our vibrant campus community is a fertile environment for the collaborative and interdisciplinary work that defines CalArts' educational philosophy.</p>
        </section>
        <section class="courses">
            <h2>Our Courses</h2>
            <div class="card">
                <h3>Course Title 1</h3>
                <p>Brief description of the course.</p>
                <a href="${pageContext.request.contextPath}/course/1" class="btn">View Course</a>
            </div>
            <div class="card">
                <h3>Course Title 2</h3>
                <p>Brief description of the course.</p>
                <a href="${pageContext.request.contextPath}/course/2" class="btn">View Course</a>
            </div>
            <!-- Add more course cards as needed -->
        </section>
        <section class="management">
            <h2>Management Tools</h2>
            <div class="card">
                <h3>Manage Users</h3>
                <p>View and manage users registered on the platform.</p>
                <a href="${pageContext.request.contextPath}/manageUsers" class="btn">Manage Users</a>
            </div>
            <div class="card">
                <h3>Reports</h3>
                <p>Access various reports related to platform usage and performance.</p>
                <a href="${pageContext.request.contextPath}/reports" class="btn">View Reports</a>
            </div>
            <div class="card">
                <h3>System Settings</h3>
                <p>Configure system settings and preferences.</p>
                <a href="${pageContext.request.contextPath}/settings" class="btn">System Settings</a>
            </div>
            <div class="card">
                <h3>Support Requests</h3>
                <p>Manage and respond to user support requests.</p>
                <a href="${pageContext.request.contextPath}/support" class="btn">View Support Requests</a>
            </div>
        </section>
    </main>
    <footer class="footer">
        <p>&copy; 2024 eLearning Platform</p>
    </footer>
</body>
</html>

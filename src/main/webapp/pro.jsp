<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Professor Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2 class="mb-4">Welcome, Professor!</h2>

    <!-- Add Course Section -->
    <div class="card mb-4">
        <div class="card-header">Create a New Course</div>
        <div class="card-body">
            <form action="/courses/create" method="post">
                <div class="form-group">
                    <label for="courseTitle">Course Title</label>
                    <input type="text" class="form-control" id="courseTitle" name="title" required>
                </div>
                <div class="form-group">
                    <label for="courseDescription">Description</label>
                    <textarea class="form-control" id="courseDescription" name="description" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Create Course</button>
            </form>
        </div>
    </div>

    <!-- Manage Courses Section -->
    <div class="card mb-4">
        <div class="card-header">Your Courses</div>
        <div class="card-body">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.title}</td>
                        <td>${course.description}</td>
                        <td>
                            <a href="/courses/edit/${course.id}" class="btn btn-sm btn-warning">Edit</a>
                            <a href="/courses/delete/${course.id}" class="btn btn-sm btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- View Enrollments Section -->
    <div class="card">
        <div class="card-header">Enrolled Students</div>
        <div class="card-body">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Course</th>
                        <th>Student Name</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="enrollment" items="${enrollments}">
                    <tr>
                        <td>${enrollment.course.title}</td>
                        <td>${enrollment.student.name}</td>
                        <td>${enrollment.status}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

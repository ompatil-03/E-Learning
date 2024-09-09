<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom styles */
        body {
            font-family: 'Arial', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">
<!-- Navbar -->
<nav class="bg-gray-800 text-white px-6 py-4 shadow-md">
    <div class="container mx-auto flex justify-between items-center">
        <a href="#" class="text-2xl font-bold">Student Dashboard</a>
        <ul class="flex space-x-6">
            <li><a href="#enrolled-courses" class="hover:text-blue-400">Enrolled Courses</a></li>
            <li><a href="#available-courses" class="hover:text-blue-400">Available Courses</a></li>
            <li>
                <form action="/student/logout" method="post">
                    <button class="hover:text-blue-400" type="submit">Logout</button>
                </form>
            </li>
        </ul>
    </div>
</nav>

<!-- Main Content -->
<main class="flex-grow container mx-auto py-8 px-4">
    <!-- Student Profile Section -->
    <section class="bg-white p-6 rounded-lg shadow-md mb-8">
        <p><strong>Name:</strong> ${student.name}</p>
            <p><strong>Email:</strong> ${student.email}</p>
    </section>

    <!-- Enrolled Courses Table -->
    <section id="enrolled-courses" class="bg-white p-6 rounded-lg shadow-md mb-8">
        <h2 class="text-2xl font-semibold text-gray-800 mb-4">Your Enrolled Courses</h2>
        <table class="min-w-full bg-white rounded-lg overflow-hidden shadow-md">
            <thead class="bg-gray-800 text-white">
                <tr>
                    <th class="py-3 px-6 text-left">Course ID</th>
                    <th class="py-3 px-6 text-left">Course Name</th>
                    <th class="py-3 px-6 text-left">Topic</th>
                    <th class="py-3 px-6 text-left">Link</th>
                    <th class="py-3 px-6 text-left">Study Material</th>
                    <th class="py-3 px-6 text-left">Description</th>
                    <th class="py-3 px-6 text-left">Progress</th>
                    <th class="py-3 px-6 text-left">Actions</th>
                </tr>
            </thead>
            <tbody class="text-gray-700">
                <c:forEach var="course" items="${enrolledCourse}">
                    <tr class="border-b border-gray-200">
                        <td class="py-4 px-6">${course.id}</td>
                        <td class="py-4 px-6">${course.name}</td>
                        <td class="py-4 px-6">${course.topic}</td>
                        <td class="py-4 px-6"><a href="${course.link}" class="text-blue-500 hover:underline">View Link</a></td>
                        <td class="py-4 px-6">
                            <c:if test="${not empty course.studyMaterial}">
                                <a href="${course.studyMaterial}" class="text-blue-500 hover:underline" target="_blank">View Material</a>
                            </c:if>
                            <c:if test="${empty course.studyMaterial}">
                                No Material
                            </c:if>
                        </td>
                        <td class="py-4 px-6">
                            <p class="w-48 h-24 p-2 border border-gray-300 rounded-md">${course.description}</p>
                        </td>
                        <td class="py-4 px-6">
                            <form action="/student/updateProgress" method="post" class="flex items-center" onsubmit="return getSelectedValue(this)">
                                <input type="hidden" name="courseId" value="${course.id}">
                                <input type="hidden" name="studentId" value="${student.id}">
                                <select name="progress" class="border border-gray-300 rounded-md p-2">
                                    <option value="not_started" ${course.progress == 'not_started' ? 'selected' : ''}>Not Started</option>
                                    <option value="in_progress" ${course.progress == 'in_progress' ? 'selected' : ''}>In Progress</option>
                                    <option value="done" ${course.progress == 'done' ? 'selected' : ''}>Done</option>
                                </select>
                                <button type="submit" class="ml-2 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Update</button>
                            </form>
                        </td>
                        <td class="py-4 px-6">
                            <form action="/student/dropCourse" method="post">
                                <input type="hidden" name="courseId" value="${course.id}">
                                <input type="hidden" name="studentId" value="${student.id}">
                                <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">Drop Course</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>

    <!-- All Available Courses Section -->
    <section id="available-courses" class="bg-white p-6 rounded-lg shadow-md">
        <h2 class="text-2xl font-semibold text-gray-800 mb-4">All Available Courses</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            <c:forEach var="course" items="${allCourse}">
                <div class="bg-white border border-gray-200 rounded-lg shadow-md p-4">
                    <h3 class="text-xl font-semibold text-gray-800 mb-2">${course.name}</h3>
                    <p class="text-gray-600 mb-2"><strong>Topic:</strong> ${course.topic}</p>
                    <p class="text-gray-600 mb-2"><strong>Description:</strong> ${course.description}</p>
                    <div class="flex flex-col space-y-2">
                        <a href="${course.link}" class="text-blue-500 hover:underline" target="_blank">View Link</a>
                        <c:if test="${not empty course.studyMaterial}">
                            <a href="${course.studyMaterial}" class="text-blue-500 hover:underline" target="_blank">View Material</a>
                        </c:if>
                        <c:if test="${empty course.studyMaterial}">
                            <span>No Material</span>
                        </c:if>
                    </div>
                    <form action="/student/enroll" method="post" class="mt-4">
                        <input type="hidden" name="courseId" value="${course.id}">
                        <input type="hidden" name="studentId" value="${student.id}">
                        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Enroll Now</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </section>
</main>

<!-- Footer -->
<footer class="bg-gray-800 text-white py-4">
    <div class="container mx-auto text-center">
        <p>&copy; 2024 Student Dashboard. All rights reserved.</p>
    </div>
</footer>

<script>
    function getSelectedValue(form) {
        var selectedValue = form.querySelector('select[name="progress"]').value;
        console.log(selectedValue); // Log the selected value for debugging
        return true; // Allow form submission
    }
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>
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
            <a href="#" class="text-2xl font-bold">Teacher Dashboard</a>
            <ul class="flex space-x-6">
                <li><a href="#" class="hover:text-blue-400">Dashboard</a></li>
                <li><a href="#create-course" class="hover:text-blue-400">Create Course</a></li>
                <form action="/teacher/logout" method="post">
                    <li><button class="hover:text-blue-400" type="submit">Logout</button></li>
                </form>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="flex-grow container mx-auto py-8 px-4">
        <!-- Created Courses Table -->
        <section class="bg-white p-6 rounded-lg shadow-md mb-8">
            <h2 class="text-2xl font-semibold text-gray-800 mb-4">Your Created Courses</h2>
            <table class="min-w-full bg-white rounded-lg overflow-hidden shadow-md">
                <thead class="bg-gray-800 text-white">
                    <tr>
                        <th class="py-3 px-6 text-left">Course Id</th>
                        <th class="py-3 px-6 text-left">Course Name</th>
                        <th class="py-3 px-6 text-left">Link</th>
                        <th class="py-3 px-6 text-left">Study Material</th>
                        <th class="py-3 px-6 text-left">Actions</th>
                    </tr>
                </thead>
                <tbody class="text-gray-700">
                    <c:forEach var="course" items="${courseList}">
                        <tr class="border-b border-gray-200">
                         <td class="py-4 px-6">${course.getId()}</td>
                            <td class="py-4 px-6">${course.getName()}</td>
                            <td class="py-4 px-6"><a href="${course.getLink()}" class="text-blue-500 hover:underline">View Link</a></td>
                            <td class="py-4 px-6">
                                <c:if test="${not empty course.getStudyMaterial()}">
                                    <a href="${course.getStudyMaterial()}" class="text-blue-500 hover:underline" target="_blank">View Material</a>
                                </c:if>
                                <c:if test="${empty course.getStudyMaterial()}">
                                    No Material
                                </c:if>
                            </td>
                            <td class="py-4 px-6 flex">
                              <form action="/teacher/editCourse">
                              		<input type="hidden" name="id" value="${course.getId()}">
                                     <button class="mx-3 bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600"
                                       type="submit">Edit</button>
                                </form>
                                <form action="/teacher/deleteCourse">
                                	<input type="hidden" name="id" value="${course.getId()}">
                                     <button class="mx-3 bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600"
                                       type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>

        <!-- Course Creation Form -->
        <section id="create-course" class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-2xl font-semibold text-gray-800 mb-4">Create New Course</h2>
            <form action="/teacher/createCourse" method="post" class="max-w-lg mx-auto grid grid-cols-1 gap-6">
                <input type="hidden" id="id" name="teacherId" value="${teacherId}">
                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="name">Course Name:</label>
                    <input type="text" id="name" name="name" required
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
                </div>
                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="topic">Topic:</label>
                    <input type="text" id="topic" name="topic" required
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
                </div>
                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="link">Link:</label>
                    <input type="text" id="link" name="link" required
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
                </div>
                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="studyMaterial">Study Material:</label>
                    <input type="text" id="studyMaterial" name="studyMaterial" placeholder="Upload Study Material here"
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
                </div>
                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="description">Description:</label>
                    <textarea id="description" name="description" rows="4" required
                              class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"></textarea>
                </div>
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">
                    Create Course
                </button>
            </form>
        </section>
    </main>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white py-4">
        <div class="container mx-auto text-center">
            <p>&copy; 2024 Teacher Dashboard. All rights reserved.</p>
        </div>
    </footer>

    <script>
        
    </script>
</body>
</html>

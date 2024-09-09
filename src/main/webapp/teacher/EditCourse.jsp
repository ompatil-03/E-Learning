<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Course</title>
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
            <a href="#" class="text-2xl font-bold">Edit Course</a>
            <ul class="flex space-x-6">
                <li><a href="/teacher/dashboard?id=${teacherId}" class="hover:text-blue-400">Back to Dashboard</a></li>
                <form action="/teacher/logout" method="post">
                    <li><button class="hover:text-blue-400" type="submit">Logout</button></li>
                </form>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="flex-grow container mx-auto py-8 px-4">
        <!-- Edit Course Form -->
        <section class="bg-white p-6 rounded-lg shadow-md max-w-4xl mx-auto">
            <h2 class="text-2xl font-semibold text-gray-800 mb-4">Edit Course</h2>
            <form action="/teacher/updateCoures" method="post" class="grid grid-cols-1 gap-6">
                <input type="hidden" name="courseId" value="${course.getId()}">
                <input type="hidden" name="teacherId" value="${teacherId}">
                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="name">Course Name:</label>
                    <input type="text" id="name" name="name" value="${course.getName()}" required
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
                </div>

                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="topic">Topic:</label>
                    <input type="text" id="topic" name="topic" value="${course.topic}" required
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
                </div>

                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="link">Link:</label>
                    <input type="text" id="link" name="link" value="${course.link}" required
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
                </div>

                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="studyMaterial">Study Material:</label>
                    <input type="text" id="studyMaterial" name="studyMaterial" value="${course.studyMaterial}"
                           placeholder="Upload Study Material here"
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
                </div>

                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="description">Description:</label>
                    <textarea id="description" name="description" rows="4" required
                              class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">${course.description}</textarea>
                </div>

                <div>
                    <label class="block text-gray-700 font-medium mb-2" for="progress">Progress:</label>
                    <select id="progress" name="progress" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
                        <option value="not_started" ${course.progress == 'not_started' ? 'selected' : ''}>Not Started</option>
                        <option value="in_progress" ${course.progress == 'in_progress' ? 'selected' : ''}>In Progress</option>
                        <option value="completed" ${course.progress == 'completed' ? 'selected' : ''}>Completed</option>
                    </select>
                </div>

                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">
                    Update Course
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

</body>
</html>

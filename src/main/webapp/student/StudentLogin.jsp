<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-100">
    <!-- Login Form Container -->
    <div class="min-h-screen flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
            <h2 class="text-3xl font-bold text-center text-blue-700 mb-6">Student Login</h2>
            <form action="/student/loginform" method="post" class="space-y-4">
                <!-- Email Input -->
                <div>
                    <label for="email" class="block text-gray-700 font-semibold mb-2">Email</label>
                    <input type="email" id="email" name="email" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-600"
                        placeholder="Enter your email">
                </div>

                <!-- Password Input -->
                <div>
                    <label for="password" class="block text-gray-700 font-semibold mb-2">Password</label>
                    <input type="password" id="password" name="password" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-600"
                        placeholder="Enter your password">
                </div>

                <!-- Login Button -->
                <button type="submit"
                    class="w-full bg-blue-700 text-white py-2 rounded-md font-semibold hover:bg-blue-800 transition">Login</button>

                <!-- Forgot Password Link -->
                <div class="text-center mt-4">
                    <a href="forgotPassword.jsp" class="text-blue-700 hover:underline">Forgot your password?</a>
                </div>
            </form>

            <!-- Sign Up Link -->
            <div class="text-center mt-6">
            <form action="/student/signup" method="get"> 
                <p class="text-gray-600">Don't have an account? 
                        <button type="submit" class="text-blue-700 font-semibold hover:underline">Sign Up as Student</button></p>
            </form>
            </div>
        </div>
    </div>
</body>

</html>

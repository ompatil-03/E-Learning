<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Sign Up</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-100">
    <!-- Sign-Up Form Container -->
    <div class="min-h-screen flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
            <h2 class="text-3xl font-bold text-center text-green-700 mb-6">Teacher Sign Up</h2>
            <form action="/teacher/signupform" method="post" class="space-y-4">
                
                <!-- Name Input -->
                <div>
                    <label for="name" class="block text-gray-700 font-semibold mb-2">Full Name</label>
                    <input type="text" id="name" name="name" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600"
                        placeholder="Enter your full name">
                </div>

                <!-- Email Input -->
                <div>
                    <label for="email" class="block text-gray-700 font-semibold mb-2">Email</label>
                    <input type="email" id="email" name="email" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600"
                        placeholder="Enter your email">
                </div>

                <!-- Password Input -->
                <div>
                    <label for="password" class="block text-gray-700 font-semibold mb-2">Password</label>
                    <input type="password" id="password" name="password" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600"
                        placeholder="Enter your password">
                </div>

                <!-- Confirm Password Input -->
                <div>
                    <label for="confirm_password" class="block text-gray-700 font-semibold mb-2">Qualification</label>
                    <input type="qualification" id="qualification" name="qualification" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-600"
                        placeholder="Enter your qualification">
                </div>


                <!-- Sign-Up Button -->
                <button type="submit"
                    class="w-full bg-green-700 text-white py-2 rounded-md font-semibold hover:bg-green-800 transition">
                    Sign Up
                </button>

                <!-- Login Link -->
                <div class="text-center mt-4">
                    <p class="text-gray-600">Already have an account? 
                    <a href="/teacher/login" class="text-green-700 hover:underline font-semibold">Login here</a>
                    </p>
                </div>
            </form>
        </div>
    </div>
</body>

</html>

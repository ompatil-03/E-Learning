<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Learning Platform</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-50">
    <!-- Navbar -->
    <nav class="bg-white shadow-md">
        <div class="container mx-auto flex justify-between items-center px-6 py-4">
            <a href="/" class="text-2xl font-bold text-blue-700">E-Learning Platform</a>
            <div class="space-x-6">
                <form action="/" method="get" class="inline">
                    <button type="submit" class="text-gray-800 hover:text-blue-700 transition">Home</button>
                </form>
                <form action="#about" method="get" class="inline">
                    <button type="submit" class="text-gray-800 hover:text-blue-700 transition">About Us</button>
                </form>
                <form action="#reviews" method="get" class="inline">
                    <button type="submit" class="text-gray-800 hover:text-blue-700 transition">Reviews</button>
                </form>
                <form action="/student/login" method="get" class="inline">
                    <button type="submit" class="bg-blue-700 text-white px-4 py-2 rounded-full hover:bg-blue-800 transition">Login</button>
                </form>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="bg-blue-700 text-white py-16">
        <div class="container mx-auto flex flex-col md:flex-row items-center px-6">
            <div class="flex-1 text-center md:text-left">
                <h1 class="text-5xl font-extrabold mb-4">Empower Your Learning and Teaching Journey</h1>
                <p class="text-lg mb-6">Join thousands of students and instructors to learn new skills and share knowledge.</p>
                <form action="/student/login" method="get" class="inline">
                    <button type="submit" class="bg-yellow-400 text-blue-900 px-8 py-3 rounded-full font-semibold hover:bg-yellow-500 transition mr-4">As Student</button>
                </form>
                <form action="/teacher/login" method="get" class="inline">
                    <input type="hidden" name="type" value="teacher">
                    <button type="submit" class="bg-white text-blue-700 px-8 py-3 rounded-full font-semibold hover:bg-gray-100 transition">Join as Teacher</button>
                </form>
            </div>
            <div class="flex-1 mt-10 md:mt-0">
                <img src="https://imgs.search.brave.com/_IZnFWoVs79SXQD1XZwV457EvEtmpie2yLPgHnToGvs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTMy/Mzg1MTk3Ni9waG90/by9jbGFzc21hdGVz/LWFyZS1sZWFybmlu/Zy10aHJvdWdoLWxh/cHRvcC5qcGc_cz02/MTJ4NjEyJnc9MCZr/PTIwJmM9TnAxb3NM/R01hLWIxaktMdnJw/dGVKQk85dmluaGtT/SGtSVmdnLTdWQU9B/az0" alt="Learning and Teaching" class="rounded-lg shadow-lg">
            </div>
        </div>
    </header>

    <!-- About Us Section -->
    <section id="about" class="py-12">
        <div class="container mx-auto px-6 text-center">
            <h2 class="text-3xl font-bold text-gray-800 mb-6">About Us</h2>
            <p class="text-gray-600">Our E-Learning platform connects students and teachers worldwide, offering comprehensive learning and teaching opportunities across various fields. We strive to make education accessible to everyone, anytime, anywhere.</p>
        </div>
    </section>

    <!-- Features for Students and Teachers -->
    <section class="py-12">
        <div class="container mx-auto px-6">
            <h2 class="text-3xl font-bold text-gray-800 text-center mb-6">For Students and Teachers</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <!-- Student Features -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h3 class="text-2xl font-semibold text-blue-700 mb-4">Students</h3>
                    <ul class="text-gray-600 space-y-2">
                        <li>📚 Access thousands of courses in various fields.</li>
                        <li>🎓 Earn certificates and advance your career.</li>
                        <li>👨‍🏫 Learn from industry experts at your own pace.</li>
                        <li>📅 Flexible learning schedules with 24/7 access.</li>
                    </ul>
                    <form action="/student/signup" method="get" class="inline">
                        <input type="hidden" name="type" value="student">
                        <button type="submit" class="mt-4 inline-block bg-blue-700 text-white px-6 py-2 rounded-full hover:bg-blue-800 transition">Start Learning</button>
                    </form>
                </div>
                <!-- Teacher Features -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h3 class="text-2xl font-semibold text-yellow-500 mb-4">Teachers</h3>
                    <ul class="text-gray-600 space-y-2">
                        <li>📝 Create and share your courses with a global audience.</li>
                        <li>💰 Earn money by teaching what you love.</li>
                        <li>📊 Track student progress and engagement with analytics.</li>
                        <li>🌍 Build your teaching brand and community.</li>
                    </ul>
                    <form action="/teacher/signup" method="get" class="inline">
                        <input type="hidden" name="type" value="teacher">
                        <button type="submit" class="mt-4 inline-block bg-yellow-400 text-blue-900 px-6 py-2 rounded-full hover:bg-yellow-500 transition">Start Teaching</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Reviews Section -->
    <section id="reviews" class="bg-gray-100 py-12">
        <div class="container mx-auto px-6 text-center">
            <h2 class="text-3xl font-bold text-gray-800 mb-6">Hear From Our Community</h2>
            <div class="flex overflow-x-scroll space-x-4">
                <div class="bg-white rounded-lg p-6 shadow-md w-80 flex-none">
                    <p class="text-gray-600">"As a student, I've gained so much knowledge from the courses offered here!"</p>
                    <h3 class="text-xl font-semibold mt-4">- Maria Lopez, Student</h3>
                </div>
                <div class="bg-white rounded-lg p-6 shadow-md w-80 flex-none">
                    <p class="text-gray-600">"Teaching on this platform has been an amazing experience. It’s easy to reach students worldwide!"</p>
                    <h3 class="text-xl font-semibold mt-4">- David Miller, Instructor</h3>
                </div>
            </div>
        </div>
    </section>

    <!-- Final Call to Action -->
    <section class="bg-blue-700 text-white py-12 text-center">
        <h2 class="text-3xl font-bold mb-4">Ready to Begin Your Journey?</h2>
        <div class="flex justify-center space-x-4">
            <form action="/student/signup" method="get" class="inline">
                <input type="hidden" name="type" value="student">
                <button type="submit" class="bg-yellow-400 text-blue-900 px-6 py-3 rounded-full font-semibold hover:bg-yellow-500 transition">Join as Student</button>
            </form>
            <form action="/teacher/signup" method="get" class="inline">
                <input type="hidden" name="type" value="teacher">
                <button type="submit" class="bg-white text-blue-700 px-6 py-3 rounded-full font-semibold hover:bg-gray-100 transition">Join as Teacher</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white py-6">
        <div class="container mx-auto px-6 text-center">
            <p>&copy; 2024 E-Learning Platform. All rights reserved.</p>
        </div>
    </footer>
</body>

</html>

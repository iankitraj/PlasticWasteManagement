<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Plastic Waste Tracker</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body class="bg-gradient-to-br from-green-200 to-blue-200 min-h-screen p-8 font-sans">

  <!-- Header -->
  <header class="bg-white shadow-lg p-8 rounded-lg mb-12">
    <div class="text-center">
      <h1 class="text-5xl font-extrabold text-green-700 mb-3">Plastic Waste Tracker</h1>
      <p class="text-xl text-gray-600">Track, Report, and Reduce Plastic Waste.</p>
    </div>
  </header>

  <!-- Main Content -->
  <main class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-7xl mx-auto">
    <!-- Report Section -->
    <a href="Report.jsp" class="bg-white shadow-lg rounded-3xl hover:bg-green-50 transition duration-300 p-8 flex flex-col justify-center items-center hover:scale-105 transform">
      <div class="mb-6">
        <i class="fas fa-flag-checkered text-5xl text-green-800"></i>
      </div>
      <h2 class="text-3xl font-semibold text-green-800 mb-2">Report Plastic Waste</h2>
      <p class="text-center text-gray-700">Let us know where plastic waste is affecting your area.</p>
    </a>

    <!-- Learn Section -->
    <a href="Learn.jsp" class="bg-white shadow-lg rounded-3xl hover:bg-green-50 transition duration-300 p-8 flex flex-col justify-center items-center hover:scale-105 transform">
      <div class="mb-6">
        <i class="fas fa-book-open text-5xl text-green-800"></i>
      </div>
      <h2 class="text-3xl font-semibold text-green-800 mb-2">Learn About Waste</h2>
      <p class="text-center text-gray-700">Understand the environmental impact and what you can do to help.</p>
    </a>

    <!-- Admin Login Section -->
    <a href="AdminLogin.jsp" class="bg-white shadow-lg rounded-3xl hover:bg-green-50 transition duration-300 p-8 flex flex-col justify-center items-center hover:scale-105 transform">
      <div class="mb-6">
        <i class="fas fa-user-shield text-5xl text-green-800"></i>
      </div>
      <h2 class="text-3xl font-semibold text-green-800 mb-2">Admin Login</h2>
      <p class="text-center text-gray-700">Manage reports and update waste collection statuses.</p>
    </a>
  </main>

  <!-- Real-Time Data Section -->
  <div class="mt-16 text-center mb-6">
    <h2 class="text-4xl font-semibold text-green-700 mb-2">Real-Time Plastic Waste Reports</h2>
    <p class="text-xl text-gray-600 mb-4">Track how much plastic waste has been reported globally!</p>
    <div class="bg-white p-12 mt-6 shadow-xl rounded-xl">
      <h3 class="text-2xl font-bold text-green-600">
        Total Reports: <span id="reportCount" class="text-3xl text-green-700">Loading...</span>
      </h3>
    </div>
  </div>

  <!-- Footer -->
  <footer class="text-center text-sm text-gray-500 mt-16">
    &copy; 2025 Plastic Waste Tracker. All rights reserved.
  </footer>

  <!-- JS to Fetch Real-Time Count -->
  <script>
    // Fetch the total number of reports and show it
    fetch('TotalReportsServlet')
      .then(response => response.json())
      .then(data => {
        document.getElementById('reportCount').innerText = data.totalReports;
      })
      .catch(error => {
        console.error("Error fetching total reports:", error);
        document.getElementById('reportCount').innerText = "Error";
      });
  </script>

</body>

</html>

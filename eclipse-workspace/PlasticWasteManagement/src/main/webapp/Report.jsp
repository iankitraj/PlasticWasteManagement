<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Report Waste</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-green-50 py-10">
  <div class="max-w-xl mx-auto bg-white p-6 rounded-2xl shadow-md">
    <h2 class="text-2xl font-bold text-green-700 mb-6">Report Plastic Waste</h2>
    
    <!-- Form for reporting waste -->
    <form action="ReportServlet" method="post" enctype="multipart/form-data">
  <input name="name" type="text" placeholder="Your Name" class="w-full border p-2 mb-4 rounded" required />
  <input name="email" type="email" placeholder="Email" class="w-full border p-2 mb-4 rounded" required />
  <input name="location" type="text" placeholder="Location" class="w-full border p-2 mb-4 rounded" required />
  <textarea name="description" placeholder="Description" class="w-full border p-2 mb-4 rounded" required></textarea>
  <input name="image" type="file" accept="image/*" class="w-full border p-2 mb-4 rounded" required />
  <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded">Submit Report</button>
</form>

  </div>
</body>
</html>

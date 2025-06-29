<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Login</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-green-50 py-10">
  <div class="max-w-md mx-auto bg-white p-6 rounded-2xl shadow-md">
    <h2 class="text-2xl font-bold text-green-700 mb-6">Admin Login</h2>
    
    <!-- Display Error Message if Invalid Credentials -->
    <c:if test="${not empty requestScope.errorMessage}">
      <div class="text-red-500 mb-4">
        <p>${requestScope.errorMessage}</p>
      </div>
    </c:if>

    <!-- Login Form -->
    <form action="AdminLoginServlet" method="post">
      <input name="username" type="text" placeholder="Username"
        class="w-full border p-2 mb-4 rounded focus:outline-none focus:ring-2 focus:ring-green-500" required />
      
      <input name="password" type="password" placeholder="Password"
        class="w-full border p-2 mb-4 rounded focus:outline-none focus:ring-2 focus:ring-green-500" required />
      
      <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-green-500">
        Login
      </button>
    </form>
  </div>
</body>
</html>

<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Optional: Redirect if session not found (for basic admin protection)
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
  <div class="max-w-6xl mx-auto">
    
    <!-- Header with Title & Logout -->
    <div class="flex justify-between items-center mb-6">
      <h2 class="text-3xl font-bold text-green-700">Plastic Waste Reports</h2>
      <form action="LogoutServlet" method="POST">
        <button class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">
          Logout
        </button>
      </form>
    </div>

    <!-- Summary Cards -->
    <div class="grid grid-cols-2 gap-6 mb-8">
      <%
        int totalReports = 0;
        int cleanedReports = 0;
        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plastic_waste", "root", "807280");

          Statement st = con.createStatement();
          ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM users");
          if (rs1.next()) totalReports = rs1.getInt(1);

          ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM users WHERE status='Cleaned'");
          if (rs2.next()) cleanedReports = rs2.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
      %>
      <div class="bg-white p-6 rounded-xl shadow text-center">
        <h3 class="text-xl font-semibold text-gray-600">Total Reports</h3>
        <p class="text-4xl font-bold text-green-600"><%= totalReports %></p>
      </div>
      <div class="bg-white p-6 rounded-xl shadow text-center">
        <h3 class="text-xl font-semibold text-gray-600">Cleaned Reports</h3>
        <p class="text-4xl font-bold text-blue-600"><%= cleanedReports %></p>
      </div>
    </div>

    <!-- Reports Table -->
    <div class="overflow-x-auto">
      <table class="min-w-full bg-white border border-gray-300 shadow-md rounded-xl">
        <thead>
          <tr class="bg-green-100 text-left">
            <th class="p-3 border">Name</th>
            <th class="p-3 border">Email</th>
            <th class="p-3 border">Location</th>
            <th class="p-3 border">Description</th>
            <th class="p-3 border">Image</th>
            <th class="p-3 border">Status</th>
            <th class="p-3 border">Update</th>
          </tr>
        </thead>
        <tbody>
          <%
            try {
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plastic_waste", "root", "807280");
              Statement stmt = con.createStatement();
              ResultSet rs = stmt.executeQuery("SELECT * FROM users");

              while(rs.next()) {
          %>
          <tr class="hover:bg-gray-100">
            <td class="p-2 border"><%= rs.getString("name") %></td>
            <td class="p-2 border"><%= rs.getString("email") %></td>
            <td class="p-2 border"><%= rs.getString("location") %></td>
            <td class="p-2 border"><%= rs.getString("description") %></td>
            <td class="p-2 border">
              <img src="<%= rs.getString("image_path") %>" class="w-20 h-20 object-cover rounded" alt="Waste Image" />
            </td>
            <td class="p-2 border"><%= rs.getString("status") %></td>
            <td class="p-2 border">
              <form action="UpdateStatusServlet" method="POST" class="flex items-center gap-2">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>" />
                <select name="status" class="border p-1 rounded">
                  <option <%= rs.getString("status").equals("Pending") ? "selected" : "" %>>Pending</option>
                  <option <%= rs.getString("status").equals("In Progress") ? "selected" : "" %>>In Progress</option>
                  <option <%= rs.getString("status").equals("Cleaned") ? "selected" : "" %>>Cleaned</option>
                </select>
                <button type="submit" class="bg-green-500 text-white px-2 py-1 rounded">Update</button>
              </form>
            </td>
          </tr>
          <%
              }
              con.close();
            } catch(Exception e) { e.printStackTrace(); }
          %>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>

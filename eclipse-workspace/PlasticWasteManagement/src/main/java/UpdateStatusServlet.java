import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateStatusServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish DB connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plastic_waste", "root", "807280");

            // Update status in the users table
            PreparedStatement ps = con.prepareStatement("UPDATE users SET status=? WHERE id=?");
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();

            // Redirect to Admin Dashboard after the update
            response.sendRedirect("AdminDashboard.jsp?updated=true");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

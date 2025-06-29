import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/ReportServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,     // 2MB
                 maxFileSize = 1024 * 1024 * 10,           // 10MB
                 maxRequestSize = 1024 * 1024 * 50)        // 50MB
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form fields
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        // Get uploaded image
        Part imagePart = request.getPart("image");
        String fileName = extractFileName(imagePart);
        String uploadPath = getServletContext().getRealPath("") + File.separator + "Image";

        // Create Image folder if not exists
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Save the uploaded file
        String imagePath = "Image" + File.separator + fileName;
        imagePart.write(uploadPath + File.separator + fileName);

        // Save form data and image path in DB
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plastic_waste", "root", "807280");
            PreparedStatement ps = con.prepareStatement("INSERT INTO users (name, email, location, description, image_path) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, location);
            ps.setString(4, description);
            ps.setString(5, imagePath);
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Utility method to get submitted file name
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1); // remove quotes
            }
        }
        return "";
    }
}

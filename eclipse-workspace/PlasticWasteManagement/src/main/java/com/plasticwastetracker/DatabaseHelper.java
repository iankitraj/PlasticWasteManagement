package com.plasticwastetracker;

import java.sql.*;

public class DatabaseHelper {

    public static int getTotalReports() {
        int count = 0;

        try {
            // Update your DB credentials here
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/plastic_waste ", "root", "807280"
            );

            String sql = "SELECT COUNT(*) FROM users";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}

package com.plasticwastetracker;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/TotalReportsServlet")
public class TotalReportsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Fetch the total count of reports from the database
        int totalReports = DatabaseHelper.getTotalReports();

        // Send the count as a JSON response
        out.print("{\"totalReports\": " + totalReports + "}");
        out.flush();
	}
}

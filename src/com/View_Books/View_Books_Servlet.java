package com.View_Books;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view")
public class View_Books_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/Login_Project";
        String username = "root";
        String password = "root";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish the connection
            conn = DriverManager.getConnection(url, username, password);

            // Prepare the SQL query to fetch all records from add_books
            String sql = "SELECT * FROM add_books";
            pstmt = conn.prepareStatement(sql);

            // Execute the query
            rs = pstmt.executeQuery();

            // Process the result set
            out.println("<h2>Books in Library</h2>");
            while (rs.next()) {
                String bookname = rs.getString("bookname");
                String author = rs.getString("author");
                String category = rs.getString("category");
                String urlField = rs.getString("url");
                int id = rs.getInt("id");

                // Display the book information
                out.println("<p><strong>Book Name:</strong> " + bookname + "<br>");
                out.println("<strong>Author:</strong> " + author + "<br>");
                out.println("<strong>Category:</strong> " + category + "<br>");
                out.println("<strong>URL:</strong> " + urlField + "<br>");
                out.println("<strong>id:</strong> " + id + "</p>");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the ResultSet, PreparedStatement, and Connection
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

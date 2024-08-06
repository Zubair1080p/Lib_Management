package com.Update_Books;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/update")
@MultipartConfig
public class Update_Books_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String URL = "jdbc:mysql://localhost:3306/Login_Project";
        String User = "root";
        String Password = "root";

        // Get parameters from request
        String idParam = request.getParameter("id");
        int bookId = 0;
        try {
            if (idParam != null && !idParam.trim().isEmpty()) {
                bookId = Integer.parseInt(idParam);
            } else {
                response.getWriter().println("Book ID cannot be empty");
                return;
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid Book ID: " + idParam);
            return;
        }

        String book_name = request.getParameter("bname");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        String url = request.getParameter("url");

        InputStream inputStream = null;
        Part filePart = request.getPart("file");

        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }

        String query = "UPDATE add_books SET bookname = ?, author = ?, category = ?, file_data = ?, url = ? WHERE id = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver"); // For MySQL Connector/J 8.x
            Connection con = DriverManager.getConnection(URL, User, Password);
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, book_name);
            pst.setString(2, author);
            pst.setString(3, category);
            if (inputStream != null) {
                pst.setBinaryStream(4, inputStream, (int) filePart.getSize());
            } else {
                pst.setNull(4, java.sql.Types.BLOB); // Handle null for file_data
            }
            pst.setString(5, url);
            pst.setInt(6, bookId);
            pst.executeUpdate();
            con.close();
            
         // Setting a flash message in the servlet
            String message = "Book updated successfully!";
            request.setAttribute("flashMessage", message);

            // You can also set a message type to control the color (e.g., success, error)
            String messageType = "success"; // or "error", "info", etc.
            request.setAttribute("flashType", messageType);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Update_Books.jsp");
            dispatcher.forward(request, response);
            
        } catch (ClassNotFoundException e) {
            response.getWriter().println("MySQL Connector/J driver not found: " + e.getMessage());
        } catch (SQLException e) {
            response.getWriter().println("Error executing SQL query: " + e.getMessage());
        } catch (Exception e) {
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}

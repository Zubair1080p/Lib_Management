package com.delete_book;

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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/delete")

public class Delete_Books_Servlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        

        String query = "DELETE from add_books WHERE id = ?";

        try {
            Class.forName("com.mysql.jdbc.Driver"); // For MySQL Connector/J 8.x
            Connection con = DriverManager.getConnection(URL, User, Password);
            PreparedStatement pst = con.prepareStatement(query);
            
            pst.setInt(1, bookId);
            pst.executeUpdate();
            con.close();
            
         // Setting a flash message in the servlet
            String message = "Book deleted successfully!";
            request.setAttribute("flashMessage", message);

            // You can also set a message type to control the color (e.g., success, error)
            String messageType = "success"; // or "error", "info", etc.
            request.setAttribute("flashType", messageType);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Delete_Books.jsp");
            dispatcher.forward(request, response);
            
        } catch (ClassNotFoundException e) {
            
         // Setting a flash message in the servlet
            String message = "INVALID BOOK ID!!";
            request.setAttribute("flashMessage", message);

            // You can also set a message type to control the color (e.g., success, error)
            String messageType = "success"; // or "error", "info", etc.
            request.setAttribute("flashType", messageType);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Delete_Books.jsp");
            dispatcher.forward(request, response);
          
        } catch (SQLException e) {
            
         // Setting a flash message in the servlet
            String message = "INVALID BOOK ID!!";
            request.setAttribute("flashMessage", message);

            // You can also set a message type to control the color (e.g., success, error)
            String messageType = "success"; // or "error", "info", etc.
            request.setAttribute("flashType", messageType);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Delete_Books.jsp");
            dispatcher.forward(request, response);
          
        }
        
        catch (Exception e) {
            
         // Setting a flash message in the servlet
            String message = "INVALID BOOK ID!!";
            request.setAttribute("flashMessage", message);

            // You can also set a message type to control the color (e.g., success, error)
            String messageType = "success"; // or "error", "info", etc.
            request.setAttribute("flashType", messageType);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Delete_Books.jsp");
            dispatcher.forward(request, response);
        }
    }
}

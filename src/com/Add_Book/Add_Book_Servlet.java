package com.Add_Book;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/add")
@MultipartConfig
public class Add_Book_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
    	InputStream inputStream = null;
        String fileName = null;
        Part filePart = request.getPart("file");

        String URL = "jdbc:mysql://localhost:3306/Login_Project";
        String User = "root";
        String Password = "root";
        String query = "INSERT INTO add_books (bookname, author, category, file_data, url) VALUES (?, ?, ?, ?, ?)";

        String book_name = request.getParameter("bname");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        if (filePart != null) {
            // Extract file name
            String contentDisposition = filePart.getHeader("content-disposition");
            String[] items = contentDisposition.split(";");
            for (String item : items) {
                if (item.trim().startsWith("filename")) {
                    fileName = item.substring(item.indexOf("=") + 1).trim().replace("\"", "");
                    break;
                }
            }
            inputStream = filePart.getInputStream();
        }
        String url = request.getParameter("url");

        try {
            Class.forName("com.mysql.jdbc.Driver"); // For MySQL Connector/J 5.x
            Connection con = DriverManager.getConnection(URL, User, Password);
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, book_name);
            pst.setString(2, author);
            pst.setString(3, category);
            if (inputStream != null) {
                pst.setBinaryStream(4, inputStream, (int) filePart.getSize()); // Use setBinaryStream
            }
            pst.setString(5, url);
            pst.executeUpdate();
            con.close();
            out.println("Book added successfully!");
            
            HttpSession session = request.getSession();
            session.setAttribute("flashMessage", "Book added successfully!");
            response.sendRedirect("AddBook.jsp");
        } catch (ClassNotFoundException e) {
            out.println("MySQL Connector/J driver not found: " + e.getMessage());
            HttpSession session = request.getSession();
            session.setAttribute("flashMessage", "Error adding book.");
            response.sendRedirect("AddBook.jsp");
        } catch (SQLException e) {
            out.println("Error executing SQL query: " + e.getMessage());
            HttpSession session = request.getSession();
            session.setAttribute("flashMessage", "Error adding book.");
            response.sendRedirect("AddBook.jsp");
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
            HttpSession session = request.getSession();
            session.setAttribute("flashMessage", "Error adding book.");
            response.sendRedirect("AddBook.jsp");
        }
    }
}
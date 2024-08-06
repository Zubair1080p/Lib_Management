package com.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

@WebServlet("/signup")
public class Signup_Servlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		
		String uname = request.getParameter("uname");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		
		String URL = "jdbc:mysql://localhost:3306/Login_Project";
		String user = "root";
		String pass = "root";
		String query = "INSERT INTO signup (username,email,password) values(?,?,?)";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL,user,pass);
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, uname);
			pst.setString(2, email);
			pst.setString(3, password);
			
			pst.executeUpdate();
			out.print("Data uploaded successfully!!!");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

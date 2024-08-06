package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao 
{
	public boolean check(String uname,String password)
	{
		
	
		String URL = "jdbc:mysql://localhost:3306/Login_Project";
		String user = "root";
		String pass = "root";
		String query = "SELECT * FROM signup where username=? and password =?";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL,user,pass);
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, uname);
			pst.setString(2, password);
			
			ResultSet rs ;
			rs = pst.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
	}

}

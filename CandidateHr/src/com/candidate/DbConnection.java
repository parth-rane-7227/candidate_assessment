package com.candidate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection 
{
  public static Connection connect()
  {
	Connection con =null;
	try 
	{
		Class.forName("com.mysql.jdbc.Driver");
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/candidate","root","");
	}catch (ClassNotFoundException e) 
	{
		e.printStackTrace();
	}catch(SQLException e)
	{
		e.printStackTrace();
	}
	return(con);  
  }
}
package com.candidate;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.candidate.DbConnection;
//import com.bank.Values;

/**
 * Servlet implementation class alogin
 */
public class alogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public alogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try{
			Connection con =DbConnection.connect();
			String aemail=request.getParameter("aemail");
			String apassword=request.getParameter("apassword");
			PreparedStatement pstmt=con.prepareStatement("select * from admin where aemail=? and apassword=?");
			pstmt.setString(1,aemail);
			pstmt.setString(2,apassword);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				values.setAname(rs.getString(2));
				//Values.setCaccno(rs.getInt(2));
				response.sendRedirect("admindashboard.jsp");
			}
			else
			{
				response.sendRedirect("adminlogin.html");
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

}

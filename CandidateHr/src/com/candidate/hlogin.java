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

/**
 * Servlet implementation class hlogin
 */
public class hlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hlogin() {
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
			String hemail=request.getParameter("hemail");
			String hpassword=request.getParameter("hpassword");
			PreparedStatement pstmt=con.prepareStatement("select * from hr where hemail=? and hpassword=?");
			pstmt.setString(1,hemail);
			pstmt.setString(2,hpassword);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				values.setHid(1);
				values.setHname(rs.getString(2));
				response.sendRedirect("hdashboard.jsp");
			}
			else
			{
				response.sendRedirect("hrlogin.html");
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}

	}

}

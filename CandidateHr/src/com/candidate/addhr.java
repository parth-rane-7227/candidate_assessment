package com.candidate;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.candidate.DbConnection;

/**
 * Servlet implementation class addhr
 */
public class addhr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addhr() {
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
		String hname=request.getParameter("hname");
		String hemail=request.getParameter("hemail");
		String hmbno=request.getParameter("hmbno");
		String hpassword=request.getParameter("hpassword");
		String hdesignation=request.getParameter("hdesignation");
		
		PreparedStatement pstmt=con.prepareStatement("INSERT INTO `hr`(`hid`, `hname`, `hemail`, `hpassword`, `hmbno`, `hdesignation`) VALUES (?,?,?,?,?,?)");
		pstmt.setInt(1,0);
		pstmt.setString(2,hname);
		pstmt.setString(3,hemail);
		pstmt.setString(4,hpassword);
		pstmt.setString(5,hmbno);
		pstmt.setString(6,hdesignation);
		
		int i=pstmt.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("admindashboard.html");
		}else
		{
			response.sendRedirect("addhr.html");
		}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

}

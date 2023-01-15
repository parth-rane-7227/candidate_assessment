package com.candidate;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addjob
 */
public class addjob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addjob() {
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
			String jtitle=request.getParameter("jtitle");
			String jdescription=request.getParameter("jdescription");
			String jsalary=request.getParameter("jsalary");
			String jqualities=request.getParameter("jqualities");
			String jexperience=request.getParameter("jexperience");
			
			PreparedStatement pstmt=con.prepareStatement("insert into job values(?,?,?,?,?,?)");
			pstmt.setInt(1,0);
			pstmt.setString(2,jtitle);
			pstmt.setString(3,jdescription);
			pstmt.setString(4,jsalary);
			pstmt.setString(5,jqualities);
			pstmt.setString(6,jexperience);
			
			int i=pstmt.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("hdashboard.html");
			}else
			{
				response.sendRedirect("addjob.html");
			}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
	}

}

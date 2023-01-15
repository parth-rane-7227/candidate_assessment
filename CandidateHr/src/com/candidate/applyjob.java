package com.candidate;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig(maxFileSize = 16177216)
/**
 * Servlet implementation class applyjob
 */
public class applyjob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public applyjob() {
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
			
			String cname=request.getParameter("cname");
			String cemail=request.getParameter("cemail");
			String cgender=request.getParameter("cgender");
			String cdob=request.getParameter("cdob");
			String cexperience=request.getParameter("cexperience");
			String cmbno=request.getParameter("cmbno");
			String ccity=request.getParameter("ccity");
			String cpassword=request.getParameter("cpassword");
			String cselectjob=request.getParameter("cselectjob");
			
			
			
			
			//System.out.println(cselectjob);
			values.setCemail(cemail);
			
     		PreparedStatement pstmt=con.prepareStatement("insert into candidatedetails values(?,?,?,?,?,?,?,?,?,?,?)");
     		pstmt.setInt(1,values.getJid());
			pstmt.setInt(2,0);
			pstmt.setString(3,cname);
			pstmt.setString(4,cemail);
			pstmt.setString(5,cgender);
			pstmt.setString(6,cdob);
			pstmt.setString(7,cexperience);
			pstmt.setString(8,cmbno);
			pstmt.setString(9,ccity);
			pstmt.setString(10,cpassword);
			pstmt.setString(11,cselectjob);
		
			
			
			
			int i=pstmt.executeUpdate();
			if(i>0)
			{
				//values.setJid(1);
				response.sendRedirect("testq.jsp");
			}else
			{
				response.sendRedirect("applyjob.jsp");
			}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
	}

}

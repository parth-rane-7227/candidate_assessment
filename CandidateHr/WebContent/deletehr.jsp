s<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="com.candidate.*" %>


   <%
   Connection con =DbConnection.connect();	
   int hid=Integer.parseInt(request.getParameter("hid"));
   PreparedStatement pstmt=con.prepareStatement("delete from hr where hid=?");
   pstmt.setInt(1,hid);
   int i=pstmt.executeUpdate();
   
   if(i>0)
   {
	   response.sendRedirect("viewhr.jsp");
   }
   else{
	   
	   response.sendRedirect("viewhr.jsp");
   }
   %>
   
</body>
</html>
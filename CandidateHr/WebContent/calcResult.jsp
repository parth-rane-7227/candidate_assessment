<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.candidate.DbConnection"%>
<%@page import="com.candidate.values"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
	//int jid=Integer.parseInt(request.getParameter("jid"));
	//int cid=Integer.parseInt(request.getParameter("cid"));
	int O=0,C=0,E=0,A=0,N=0;
	Connection con=DbConnection.connect();
	PreparedStatement psmt = con.prepareStatement("select * from qna where qid=?");
	for(int i=1; i<=15; i++){
		psmt.setInt(1, i);
		ResultSet rs=psmt.executeQuery();
		rs.next();	
		String result=null;
		if(request.getParameter("q"+i).equals("ha")){
			result=rs.getString(3);
		}
		else if(request.getParameter("q"+i).equals("a")){
			result=rs.getString(4);
		}
		else if(request.getParameter("q"+i).equals("d")){
			result=rs.getString(5);
		}
		else if(request.getParameter("q"+i).equals("hd")){
			result=rs.getString(6);
		}
		
		switch(result.charAt(0)){
		case 'o' : O+=Character.getNumericValue(result.charAt(1));
					break;
		case 'c' : C+=Character.getNumericValue(result.charAt(1));
					break;
		case 'e' : E+=Character.getNumericValue(result.charAt(1));
					break;
		case 'a' : A+=Character.getNumericValue(result.charAt(1));
					break;
		case 'n' : N+=Character.getNumericValue(result.charAt(1));
					break;
		}
	}
	
	PreparedStatement psmt2=con.prepareStatement("insert into result values(?,?,?,?,?,?,?)");
	psmt2.setInt(1, values.getJid());
	psmt2.setInt(2, values.getCid());
	psmt2.setInt(3, O);
	psmt2.setInt(4, C);
	psmt2.setInt(5, E);
	psmt2.setInt(6, A);
	psmt2.setInt(7, N);
	
	if(psmt2.executeUpdate()==1){
		response.sendRedirect("index.html");
	}
	else{
		response.sendRedirect("error.html");
	}
%>
</body>
</html>
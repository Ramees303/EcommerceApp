<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.demo.GetConnection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");

if("admin@inmakes.com".equals(email)&&"admin".equals(password)){
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminhome.jsp");
}
else{
	
	int z=0;
	try{
	    Connection con=DbConnection.getConnection();
	    Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from  user where email='"+email+"' and password='"+password+"'; ");
		while(rs.next()){
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("Home.jsp");
		}
		
		if(z==0){
			response.sendRedirect("Login.jsp?msg=wrongdata");
		}
		
		
	}catch(Exception e){
		response.sendRedirect("Login.jsp?msg=invalid");
	}
	
}



%>
</body>
</html>
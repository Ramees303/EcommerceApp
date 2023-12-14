<%@page import="java.sql.*"%>
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
String name=request.getParameter("username");
String email=request.getParameter("email");
String phone=request.getParameter("telnumber");
String question=request.getParameter("securityquestion");
String answer=request.getParameter("securityanswer");
String password=request.getParameter("password");
String city=" ";
String country=" ";
String address=" ";
String state=" ";

try{
Connection con=DbConnection.getConnection();
PreparedStatement ps=con.prepareStatement("insert into user(name,email,mobile_number,security_question,answer,password,city,country,address,state) values(?,?,?,?,?,?,?,?,?,?);");
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, phone);
ps.setString(4,question);
ps.setString(5, answer);
ps.setString(6, password);
ps.setString(7, city);
ps.setString(8,country);
ps.setString(9,address);
ps.setString(10,state);

int i=ps.executeUpdate();

if(i>=0){
	response.sendRedirect("Sigin.jsp?msg=valid");
}else{
    
	response.sendRedirect("Sigin.jsp?msg=invalid");
}

}catch(Exception e){
	
	response.sendRedirect("Sigin.jsp?msg=invalid");
    
}

%>
</body>
</html>
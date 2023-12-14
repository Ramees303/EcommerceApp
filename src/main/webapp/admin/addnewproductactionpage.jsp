<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.demo.GetConnection.DbConnection"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%

String name=request.getParameter("prod_name");
String category=request.getParameter("prod_category");
String price=request.getParameter("prod_price");
String status=request.getParameter("prod_active");





try{
	
Connection con=DbConnection.getConnection();
PreparedStatement ps=con.prepareStatement("insert into product(name,category,price,status) values(?,?,?,?) ");

ps.setString(1, name);
ps.setString(2, category);
ps.setString(3, price);

ps.setString(4, status);


int j= ps.executeUpdate();
if(j>=0){
	response.sendRedirect("AddNewProduct.jsp?msg=success");
}else{
	response.sendRedirect("AddNewProduct.jsp?msg=failure");
}
}catch(Exception e){
	
    e.printStackTrace();
}





%>
</body>
</html>
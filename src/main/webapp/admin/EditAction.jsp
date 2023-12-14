<%@page import="java.io.PrintWriter"%>
<%@page import="com.demo.GetConnection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String name=request.getParameter("prod_name");
String category=request.getParameter("prod_category");
String price=request.getParameter("prod_price");
String status=request.getParameter("prod_active");
String id=request.getParameter("id");

 
 

try{
	
Connection con=DbConnection.getConnection();
PreparedStatement ps=con.prepareStatement("update product set name='"+name+"' ,category='"+category+"',price='"+price+"',status='"+status+"' where product_id='"+id+"' ; ");




int j= ps.executeUpdate();
if(j>=0){
	response.sendRedirect("allProductAndEditPage.jsp?msg=success");
}else{
	response.sendRedirect("allProductAndEditPage.jsp?msg=failure");
}
}catch(Exception e){
	
    e.printStackTrace();
}


if(("False").equals(status)){
	try{	
	Connection con=DbConnection.getConnection();
	PreparedStatement ps=con.prepareStatement("delete from cart where product_id='"+id+"' and address is null");
	int i=ps.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
}



%>
</body>
</html>
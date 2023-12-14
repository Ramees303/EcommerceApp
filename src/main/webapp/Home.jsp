<%@page import="java.sql.*"%>
<%@page import="com.demo.GetConnection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="./css/userHome.css" rel="stylesheet" >
</head>
<body>
<jsp:include page="userHeader.jsp"></jsp:include>

<div class="container">

<div class="table">
<div class="topheading">
Home <img width="30" height="31" src="https://img.icons8.com/ios/50/home--v1.png" alt="home--v1"/>
</div>

<%
String msg=request.getParameter("msg");
if(("exist").equals(msg)){
	%>
<div class="msg msg1">
Product already exist in cart.Quantity increased.
</div>
	
<%}
%>
<%
if(("added").equals(msg)){
	%>
<div class="msg msg1">
Product added to the cart
</div>
	
<%}
%>

<%
if(("error").equals(msg)){
	%>
<div class="msg msg2">
Something went wrong
</div>
	
<%}
%>
<table border="1" width="100%">
<tr>
<th>Id</th>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Add to Cart</th>
</tr>
<%

Connection con=DbConnection.getConnection();
Statement st =con.createStatement();
ResultSet rs=st.executeQuery("select * from product where status='True';");
while(rs.next()){%>
<tr>

<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getBigDecimal(4) %></td>
<td><a href="AddtoCart.jsp?id=<%=rs.getInt(1)%>">Add to Cart</a></td>
</tr>
<% } %>


</table>
</div>
</div>
<jsp:include page="./admin/Footer.jsp"></jsp:include>
</body>
</html>
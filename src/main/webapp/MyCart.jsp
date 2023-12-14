<%@page import="com.demo.Product.Product"%>
<%@page import="com.demo.Product.ProductDao"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
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
My Cart <img width="30" height="31" src="https://img.icons8.com/ios/50/home--v1.png" alt="home--v1"/>
</div>


<table border="1" width="100%">
<tr>

<th>Name</th>

<th>Quantity</th>
<th>Price</th>
<th>Total</th>

</tr>
<%
String email=(String)session.getAttribute("email");
Connection con=DbConnection.getConnection();
Statement st =con.createStatement();
ResultSet rs=st.executeQuery("select * from cart where email='"+email+"' ;");
while(rs.next()){%>
<tr>
<% 
ArrayList<Product> arr=ProductDao.getProductData(rs.getInt(2));
for(Product i:arr){%>
	<td><%= i.getName() %></td>
	
<% } %>

<td><%=rs.getInt(3) %></td>
<td><%=rs.getDouble(4) %></td>
<td><%=rs.getDouble(5) %></td>

</tr>
<% } %>


</table>
</div>
</div>
<jsp:include page="./admin/Footer.jsp"></jsp:include>
</body>
</html>
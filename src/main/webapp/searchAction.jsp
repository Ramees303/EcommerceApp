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

<table border="1" width="100%">
<tr>
<th>Id</th>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Add to Cart</th>
</tr>
<%
String search=request.getParameter("search");

Connection con=DbConnection.getConnection();
Statement st =con.createStatement();
ResultSet rs=st.executeQuery("select * from product where (name like '%"+search+"%' or category like '%"+search+"%') and status='True';");

int i=0;


while(rs.next()){

  i=1;
%>
<tr>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getBigDecimal(4) %></td>
<td><a href="AddtoCart.jsp?id=<%=rs.getInt(1)%>">Add to Cart</a></td>
</tr>
<% } 
	%>








</table>

<% if(i==0){ %>
	<div class="topheading" style="margin-top:3rem;"> Nothing to Show</div>
<% } %>
</div>
</div>
<jsp:include page="./admin/Footer.jsp"></jsp:include>
</body>
</html>
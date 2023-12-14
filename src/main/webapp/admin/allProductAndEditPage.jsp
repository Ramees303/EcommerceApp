<%@page import="java.sql.*"%>
<%@page import="com.demo.GetConnection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="../css/allProductAndEditPage.css" rel="stylesheet">
</head>
<body>
<%
   String email = (String)session.getAttribute("email");
   if(email == null) {
      response.sendRedirect("../Login.jsp");
   }
%>
<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="container">

<div class=topheading>All Products and Edit Products <img width="30" height="30" src="https://img.icons8.com/ios-filled/50/select-all.png" alt="select-all"/></div>

<div class=msg>
<%
String msg=request.getParameter("msg");
if("success".equals(msg)){ %>
<h1 class="heading1"> Success Entry </h1>
<% }
%>
<%
if("failure".equals(msg)){ %>
<h1 class="heading2"> Entry Failed </h1>
<% }
%>


</div>
<div class="table">
<table border="1" width="100%">
<tr>
<th>Id</th>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Status</th>
<th>Edit</th>
</tr>
<%

Connection con=DbConnection.getConnection();
Statement st =con.createStatement();
ResultSet rs=st.executeQuery("select * from product");
while(rs.next()){%>
<tr>

<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getBigDecimal(4) %></td>
<td><%=rs.getString(5) %></td>
<td><a href="EditPage.jsp?id='<%=rs.getInt(1)%>'">Edit</a></td>
</tr>
<% } %>


</table>
</div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
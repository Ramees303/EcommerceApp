<%@page import="com.demo.GetConnection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="../css/addnewprod.css" rel="stylesheet">
</head>
<body>
<jsp:include page="adminHeader.jsp"></jsp:include>

<%
   String email = (String)session.getAttribute("email");
   if(email == null) {
      response.sendRedirect("../Login.jsp");
   }
%>

<% 
int j=0;
try{
	
Connection con=DbConnection.getConnection();
Statement st=con.createStatement();
ResultSet rs= st.executeQuery("select max(product_id) from product");
while(rs.next()){
	j=rs.getInt(1);

	
}
}catch(Exception e){
      e.printStackTrace();
}

%>


<div class="heading">
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
<div class="adminmsg"> 

<div class=product >
<form action="addnewproductactionpage.jsp" method="post">
<h1 class="product_id heading1">Product ID: <%=j+1 %></h1>

<div class="firstrow">
<div class="product_name">
Enter Product Name 
<input type="text" name="prod_name" placeholder="Enter Name">
</div>


<div class="product_category">
Enter Category 
<input type="text" name="prod_category" placeholder="Enter Category">
</div>
</div>

<div class="secondrow">
<div class="product_price">
Enter price 
<input type="text" name="prod_price" placeholder="Enter price">
</div>


<div class="product_active">
Active
<select name="prod_active">
<option>True</option>
<option>False</option>
</select>
</div>
</div>


<div class="btn">
<input type="submit" value="save">
</div>
</form>

</div>

</div>


<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
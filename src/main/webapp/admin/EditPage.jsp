<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="../css/addnewprod.css" rel="stylesheet">
</head>
<body>
<%
   String email = (String)session.getAttribute("email");
   if(email == null) {
      response.sendRedirect("../Login.jsp");
   }
%>
<jsp:include page="adminHeader.jsp"></jsp:include>

<div class="adminmsg"> 

<div class=product >
<form action="EditAction.jsp" method="post">


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
<%
String name=request.getParameter("id");
%>
<input type="hidden" name="id" value=<%=name%>>
<div class="btn">
<input type="submit" value="save">
</div>
</form>

</div>

</div>


<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
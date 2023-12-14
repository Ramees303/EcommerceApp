<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home Page</title>
<link href="../css/adminHome.css" rel="stylesheet">
</head>
<body >
<%
   String email = (String)session.getAttribute("email");
   if(email == null) {
      response.sendRedirect("../Login.jsp");
   }
%>
<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="adminmsg">Welcome Admin!</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/userHeader.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<nav>
<a href="adminhome.jsp"><h1 class="nav-heading">Online Shopping</h1> </a>
<ul>
<%
String email=(String)session.getAttribute("email");

%>
<a href=""><li><%=email %> <img width="20" height="20" src="https://img.icons8.com/material-rounded/24/user.png" alt="user"/> </li></a>
<a href="Home.jsp"><li>Home <img width="19" height="19" src="https://img.icons8.com/ios/50/home--v1.png" alt="home--v1"/></li></a>
<a href="MyCart.jsp"> <li>My Cart<img width="20" height="20" src="https://img.icons8.com/material-rounded/24/shopping-cart.png" alt="shopping-cart"/></li></a>
<li>My Orders <img width="17" height="17" src="https://img.icons8.com/ios-filled/50/select-all.png" alt="select-all"/> </li>
<li>Change Details <img width="18" height="18" src="https://img.icons8.com/ios-filled/50/edit-property.png" alt="edit-property"/> </li>
<li>Message Us <img width="20" height="20" src="https://img.icons8.com/windows/32/chat-message.png" alt="chat-message"/></li>
<li>About <img width="20" height="19" src="https://img.icons8.com/ios-filled/50/about-me.png" alt="about-me"/></li>
<a href="./admin/Logout.jsp"> <li>Logout <img width="20" height="20" src="https://img.icons8.com/ios-glyphs/30/exit.png" alt="exit"/></li> </a> 

<form action="searchAction.jsp">
<input type="text" name=search>
<button><img width="20" height="20" src="https://img.icons8.com/ios-filled/50/search.png" alt="search"/></button>
</form>
</ul>
</nav>
</body>
</html>
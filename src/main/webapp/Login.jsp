<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
 <link  href="./css/index.css" rel="stylesheet">

</head>
<body>
<body>
 <div class="container" >
    <div class="container-left">
    <form action="LoginAction.jsp" method="post">
            <input type="email" placeholder="Enter Email" name="email">
            <input type="password" placeholder="Enter Password" name="password">
            <input type="submit" value="Login">
          <a href="Sigin.jsp">SignUp</a>
          <a href="forgotpassword.jsp">Forgot Password</a>
          
    </form>
  </div>
  <div class="container-right">
  <%
  String msg=request.getParameter("msg");
  if("wrongdata".equals(msg)){
	  
	  %>
	   <h1 class="rightheading2">Email and Password are incorrect </h1>  
  <% 
  }
  %>
  
  <%
  if("invalid".equals(msg)){
  %>
	  	   <h1 class="rightheading2">Something went wrong!Try Again</h1> 
<%  }   %>
  
 

  </div>
  </div>


</body>
</html>
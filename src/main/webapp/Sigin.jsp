<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link  href="./css/index.css" rel="stylesheet">
</head>
<body>
 <div class="container" >
    <div class="container-left">
    <form action="SigninAction.jsp">
            <input type="text" placeholder="Enter Name" name="username">
            <input type="email" placeholder="Enter Email" name="email">
            <input type="tel" placeholder="Enter Mobile Number" name="telnumber">
            <select name=securityquestion>
            <option>What was your first Car?</option>
            <option>What is your favourite place?</option>
            <option>What is your pet name?</option>
            <option>What is your favourite food?</option>
            </select>
            <input type="text" placeholder="Enter Answer" name="securityanswer" >
            <input type="password" placeholder="Enter Password" name="password">
            <input type="submit" value="submit">
          <a href="Login.jsp">Login</a>
          
    </form>
  </div>
  <div class="container-right">
  <%
  String msg=request.getParameter("msg");
  if("valid".equals(msg)){
	  
	  %>
	   <h1 class="rightheading">User Registered Successfully</h1>  

  <% 
  }
  %>
  <%
  if("invalid".equals(msg)){
  %>
	  	   <h1 class="rightheading1">Something went wrong!Try Again</h1> 
<%  }   %>
  
 

  </div>
  </div>



</body>
</html>
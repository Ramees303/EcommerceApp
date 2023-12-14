<%@page import="java.sql.*"%>
<%@page import="com.demo.GetConnection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String phone=request.getParameter("telnumber");
String question=request.getParameter("securityquestion");
String answer=request.getParameter("securityanswer");
String password=request.getParameter("password");

int z=0;
try{
    Connection con=DbConnection.getConnection();
    Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from  user where email='"+email+"' and mobile_number='"+phone+"' and security_question='"+question+"' and answer='"+answer+"' ; ");
	while(rs.next()){
		z=1;
		 st.executeUpdate("update user set password='"+password+"' where email='"+email+"'");
		response.sendRedirect("forgotpassword.jsp?msg=success");
	}
	
	if(z==0){
		response.sendRedirect("forgotpassword.jsp?msg=wrongdata");
	}
	
	
}catch(Exception e){

	e.printStackTrace();
}



%>
</body>
</html>
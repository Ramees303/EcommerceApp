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


int id=Integer.parseInt(request.getParameter("id"));

String email=(String)session.getAttribute("email");


int quantity=1;
double product_price=0.00;
double total_price=0.00;
double cart_total=0.0;
int i=0;


try{
Connection con=DbConnection.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from product where product_id='"+id+"';");
while(rs.next()){
	product_price=rs.getDouble(4);
	total_price=product_price;

}

ResultSet rs1=st.executeQuery("select * from cart where product_id='"+id+"' ;");
while(rs1.next()){
	cart_total=rs1.getDouble(5);
	cart_total=cart_total+product_price;
	quantity=rs1.getInt(3);
	quantity=quantity+1;
	i=1;
}
if(i==1){
	PreparedStatement st2=con.prepareStatement("update cart set total ='"+cart_total+"',quantity='"+quantity+"' where product_id='"+id+"' ;");
	 int k= st2.executeUpdate();
	 if(k>=0){
		 response.sendRedirect("Home.jsp?msg=exist");
	 }
}


if(i==0){
PreparedStatement st1=con.prepareStatement("insert into cart(email,product_id,quantity,price,total)values(?,?,?,?,?);");
st1.setString(1,email);
st1.setInt(2,id);
st1.setInt(3,quantity);
st1.setDouble(4,product_price);
st1.setDouble(5,total_price);
int j=st1.executeUpdate();
if(j>=0){
	response.sendRedirect("Home.jsp?msg=added");
}

}


}catch(Exception e){
	response.sendRedirect("Home.jsp?msg=error");
}


%>
</body>
</html>
package com.demo.Product;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.demo.GetConnection.DbConnection;

public class ProductDao {

	
	
	public static ArrayList<Product> getProductData(int id) {
		Connection con=DbConnection.getConnection();
		ArrayList<Product> arr=new ArrayList<Product>();
		try {
			Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from product where product_id='"+id+"'");
		while(rs.next()) {
			Product p=new Product();
	          p.setName(rs.getString(2));
	          p.setCategory(rs.getString(3));
	        
	          arr.add(p);
	         
		}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return arr;
	}
	
	
	
}

package dao;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.customer;
import utilities.MySQLConnect2;

public class customerDAO {

	private Connection con;
	public customerDAO() {
		try {
			con=MySQLConnect2.connectDB();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean signup(customer st) {
	    String query = "INSERT INTO user(first_name, last_name, phone_number, email, address, password) VALUES (?, ?, ?, ?, ?, ?)";
	    try {
	        PreparedStatement pstmt = con.prepareStatement(query);
	        pstmt.setString(1, st.getFirst_name());
	        pstmt.setString(2, st.getLast_name());
	        pstmt.setString(3, st.getPnumber());
	        pstmt.setString(4, st.getEmail());
	        pstmt.setString(5, st.getAddress());
	        pstmt.setString(6, st.getPassword());
	        
	        // Hash the password with SHA-256
	        
	        
	        int result = pstmt.executeUpdate();
	        if (result > 0) {
	            return true;
	        } else {
	            return false;
	        }
	    } catch (SQLException  e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public boolean login(customer st) {
	    String query = "SELECT COUNT(*) AS total FROM user WHERE email = ? AND password = ?";
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	        pstmt.setString(1, st.getLog_email());
	        pstmt.setString(2, st.getLog_passsword());
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            int result = rs.getInt("total");
	            return result > 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
	public ArrayList<customer> getAll(){
		ArrayList<customer> customerList=new ArrayList<customer>();
		String query="SELECT * FROM product";
		
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()) {
				int P_Id = rs.getInt("P_Id");
				String P_Name=rs.getString("P_Name");
				String P_Price=rs.getString("P_Price");
				String P_Description=rs.getString("P_Description");
				String image_path =rs.getString("image_path");
				String category =rs.getString("category");
				
				
				customer st=new customer();
				
				st.setP_Id(P_Id);
				st.setP_Name(P_Name);
				st.setP_Description(P_Description);
				st.setP_Price(P_Price);
				st.setImage_path(image_path);
				st.setCategory(category);
				
				
				customerList.add(st);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return customerList;
		}
		return customerList;
	}
	
	
	public boolean InsertintoCart(customer st) {
	    String query = "select * from product";
	    try {
	        PreparedStatement pstmt = con.prepareStatement(query);
	        
    

	        int result = pstmt.executeUpdate();
	        if (result > 0) {
	            return true;
	        } else {
	            return false;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	 
    }
	
	public void userProfile( HttpServletRequest request, HttpServletResponse response) {
		
		
		try {
				HttpSession session = request.getSession();
			    String user_email = (String) session.getAttribute("user_email");
			    String query = "SELECT * FROM user WHERE email = ?";
		        PreparedStatement statement = con.prepareStatement(query);
		        statement.setString(1, user_email);
		        ResultSet resultSet = statement.executeQuery();
			 
			if (resultSet.next()) {
			    String first_name = resultSet.getString("first_name");
			    String last_name = resultSet.getString("last_name");
			    int phone_number = resultSet.getInt("phone_number");
			    String email = resultSet.getString("email");
			    String address = resultSet.getString("address");
			    // ... retrieve other column values as needed
			    request.setAttribute("first_name", first_name);
			    request.setAttribute("last_name", last_name);
			    request.setAttribute("phone_number", phone_number);
			    request.setAttribute("email", email);
			    request.setAttribute("address", address);
			    
			    RequestDispatcher dispatcher = request.getRequestDispatcher("FOS_profile.jsp");
                dispatcher.forward(request, response);
			}else {
                // Handle case where no data is found
				response.sendRedirect("FOS_login.jsp");
            }
			
	       
	        
	    } catch (SQLException | ServletException | IOException  e) {
	         e.printStackTrace();
	        
	    }
	}
}

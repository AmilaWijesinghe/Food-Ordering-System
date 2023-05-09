package dao;

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

import entities.customer;
import utilities.MySQLConnect2;

public class customerDAO {

	private Connection con;
	private MySQLConnect2 connector;
	public customerDAO(MySQLConnect2 connector) {
		try {
			con=MySQLConnect2.connectDB();
			this.connector = connector;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean signup(customer st) {
	    String query = "INSERT INTO user(U_Name, P_Number, U_Email, U_Pwd) VALUES (?, ?, ?, ?)";
	    try {
	        PreparedStatement pstmt = con.prepareStatement(query);
	        pstmt.setString(1, st.getName());
	        pstmt.setString(2, st.getPnumber());
	        pstmt.setString(3, st.getEmail());
	        
	        // Hash the password with SHA-256
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        byte[] hashedPassword = md.digest(st.getPassword().getBytes(StandardCharsets.UTF_8));
	        pstmt.setBytes(4, hashedPassword);
	        
	        int result = pstmt.executeUpdate();
	        if (result > 0) {
	            return true;
	        } else {
	            return false;
	        }
	    } catch (SQLException | NoSuchAlgorithmException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public boolean login(customer st) {
	    String query = "SELECT COUNT(*) AS total FROM user WHERE U_Email = ? AND U_Pwd = ?";
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
	

	
	 public List<customer> getAllCustomers() {
		 
	        List<customer> customers = new ArrayList<>();
	        Connection con = null;
	        PreparedStatement statement = null;
	        ResultSet resultSet = null;
	        

	        try  {
	        	
	        	con = connector.getConnection();
	            // get a connection from the database connector
	        	String query = "SELECT P_Name,P_Description FROM product";
	            statement = con.prepareStatement(query);
	            resultSet = statement.executeQuery();
	            // iterate over the result set and create Customer objects
	            while (resultSet.next()) {
	                String P_Name = resultSet.getString("P_Name");
	                String P_Description = resultSet.getString("P_Description");
	                customer customer = new customer();
	                customers.add(customer);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // close the database resources
	            try {
	                if (resultSet != null) {
	                    resultSet.close();
	                }
	                if (statement != null) {
	                    statement.close();
	                }
	                if (con != null) {
	                	con.close();
	                }
	                
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return customers;
	    }
}

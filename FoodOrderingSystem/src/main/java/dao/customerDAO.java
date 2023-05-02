package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
		String query="INSERT INTO user(U_Name,P_Number,U_Email,U_Pwd)"
				+ "VALUE('"+st.getName()+"','"+st.getPnumber()+"','"+st.getEmail()+"','"+st.getPassword()+"')";
		try {
			
			Statement stmt=con.createStatement();
			int result= stmt.executeUpdate(query);
			if(result > 0) {
				return true;
			}else {
				return false;
			}
			
		} catch (SQLException e) {
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

}

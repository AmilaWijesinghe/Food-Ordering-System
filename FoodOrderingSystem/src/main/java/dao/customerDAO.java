package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import entities.customer;
import utilities.MySQLConnect;

public class customerDAO {

	private Connection con;
	public customerDAO() {
		try {
			con=MySQLConnect.connectDB();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean insert(customer st) {
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
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

}

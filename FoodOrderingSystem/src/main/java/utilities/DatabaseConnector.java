package utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {

	    private String url;
	    private String username;
	    private String password;
	    
	public DatabaseConnector(String url, String username, String password) {
		// TODO Auto-generated constructor stub
		this.url = "jdbc:mysql://localhost:3306/fooddelivery";
        this.username = "root";
        this.password = "";
	}

	public Connection getConnection() throws SQLException {
        Connection connection = DriverManager.getConnection(url, username, password);
        return connection;
    }
}

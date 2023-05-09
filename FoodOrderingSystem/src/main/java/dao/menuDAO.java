package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.customer;
import utilities.DatabaseConnector;

public class menuDAO {
	
	private DatabaseConnector connector;

	public menuDAO(DatabaseConnector connector) {
		// TODO Auto-generated constructor stub
		this.connector = connector;
	}
	public List<customer> getAllCustomers() {
        List<customer> customers = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // get a connection from the database connector
            connection = connector.getConnection();

            // create a prepared statement and execute the query
            String query = "SELECT P_Name, P_Description FROM product";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            // iterate over the result set and create Customer objects
            while (resultSet.next()) {
                String P_Name = resultSet.getString("P_Name");
                String P_Description = resultSet.getString("P_Description");
                customer customer = new customer(P_Name, P_Description);
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
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return customers;
    }

}

package Database;// CHANGE PACKAGE NAME IF NEED BE

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 * @author Naveen Prabakar
 * 
 * Drops all the tables
 *
 */
public class DropTables {
	
	public static void main(String args[]) throws SQLException {

		Connection conn = getConnection();
		// Insert into tables
		String[] deleteStatements = getDeleteStatements();

		try (var statement = conn.createStatement()) {
			conn.setAutoCommit(false);
			for (String stmt : deleteStatements) {
				statement.execute(stmt);
			}
			statement.executeBatch();
			conn.commit();
			conn.setAutoCommit(true);
			System.out.println("Deleted the tables");
		}
	}

	/**
     * The program first creates a schema for the tables to be created,
     * then it establishes the connection between java and MySql
     * 
     * @return the connection to MySql
     * @throws SQLException
     * @throws ClassNotFoundException
     */
	public static Connection getConnection() throws SQLException {

		Connection conn = null;
		String userName = "coms363";//change if need be
		String password = "password";//change if need be
		
		String dbServer = "jdbc:mysql://localhost:3306/assingmentone";
		conn = DriverManager.getConnection(dbServer, userName, password);
		System.out.println("Connected to the database");
		return conn;

	}
	
	/**
	 * Creates all the drop statements
	 * @return an array of drop statements
	 */
	public static String[] getDeleteStatements() {
		
		String delete1 = "Drop Table major;";
		
		String delete2 = "Drop Table minor;";
		
		String delete3 = "Drop Table Degrees;";
		
		String delete4 = "Drop Table register;";
		
		String delete5 = "Drop Table Courses;";
		
		String delete6 = "Drop Table students;";
		
		String delete7 = "Drop Table departments;";
		
		String[] delete = {delete1, delete2, delete3, delete4, delete5, delete6,
				delete7};
		
		return delete;
		
	}

}

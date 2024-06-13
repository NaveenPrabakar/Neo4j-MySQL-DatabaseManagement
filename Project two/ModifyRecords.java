package Database;// CHANGE PACKAGE NAME IF NEED BE

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 * @author naveen prabakar
 * 
 * Modifies the table where the data needs to be changed
 *
 */
public class ModifyRecords {

	public static void main(String args[]) throws SQLException {

		Connection conn = getConnection();
		// Insert into tables
		String[] modifyStatements = getModifyStatements();

		try (var statement = conn.createStatement()) {
			conn.setAutoCommit(false);
			for (String stmt : modifyStatements) {
				statement.execute(stmt);
			}
			statement.executeBatch();
			conn.commit();
			conn.setAutoCommit(true);
			System.out.println("Modified the tables");
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
	 * Creates all the modify statements
	 * @return an array of modify statements
	 */
	public static String[] getModifyStatements() {
		
		String modify1 = "update students\r\n"
				+ "set name = 'Scott'\r\n"
				+ "where ssn = '746897816';";
		
		String modify2 = "update major, students\r\n"
				+ "set major.name = 'Computer science', major.level = 'MS'\r\n"
				+ "where students.ssn = '746897816' and students.snum = major.snum;";
		
		String modify3 = "delete from register\r\n"
				+ "where regtime = 'Spring2021' and course_number >= 0;";
		
		String[] modify = {modify1, modify2, modify3};
		
		return modify;
		
	}

}

package Database;// CHANGE PACKAGE NAME IF NEED BE

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 
 * @author Naveen Prabakar
 * 
 * The Program outputs the result of all the Query statements
 *
 */
public class Query {

	
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
		String password = "password";// change if need be
		String dbServer = "jdbc:mysql://localhost:3306/assingmentone";
		
		conn = DriverManager.getConnection(dbServer, userName, password);
		return conn;

	}

	public static void main(String args[]) throws SQLException {

		Connection conn = getConnection();
		
		String[] QueryStatements = QueryStatements();
		
		ResultSet resultSet = null;
		
		int counter = 1;

		try (var statement = conn.createStatement()) {
			
			conn.setAutoCommit(false);
			
			for (String stmt : QueryStatements) {
				
				resultSet = statement.executeQuery(stmt);
				
				String[] que = stmt.split("\\s+");//spilts the query statement by spaces
				
				ArrayList <String> check = new ArrayList<>();
				
				int x = 0;
				
				//Adds all the things that needed to be outputted into an arraylist
				while(true) {
					
					if(!que[x].equals("Select") && !que[x].equals("From") && 
							!que[x].equals(",")) {
						
						check.add(que[x]);
						
					}
					else if(que[x].equals("From")) {
						
						break;
					}
					x++;
				}
				
				
				
				
				System.out.println("Problem" + counter + ":" +"\n");
				
				int y = 0;
				
				
				while(resultSet.next()) {// prints out the result of the query statement
					
					for(int j = 0; j < check.size(); j++) {
						
						if(check.size() > 1) {
							
							System.out.print(resultSet.getString(check.get(j)));
							
							System.out.print("   ");
							
							y++;
							
							if(y == check.size()) {
								
								System.out.println("\n");
								
								y = 0;
								
								
							}
						}
						else {
							
							System.out.println(resultSet.getString(check.get(j)));
							
						}
						
						
					}
					
				}
				
				System.out.println("\n");
				
				counter++;
				
				
	
			}

			
		}
	}
	
	
	/**
	 * The method creates all the Query Statements
	 * @return an array of Query statements
	 */
	public static String[] QueryStatements() {
		
		String problem1 = "Select snum , ssn From students where name = 'Becky';";
		
		String problem2 = "Select major.name , level From major, students \r\n"
				+ "where students.ssn = '123097834' \r\n"
				+ "and major.snum = students.snum;";
		
		String problem3 = "Select name From Courses \r\n"
				+ "where department_code = 401;";
		
		String problem4 = "Select name , level From degrees \r\n"
				+ "where department_code = 401;";
		
		String problem5 = "Select students.name From students, minor \r\n"
				+ "where students.snum = minor.snum;";
		
		String problem6 = "Select Count(minor.snum) From minor;";
		
		String problem7 = "Select students.name , students.snum \r\n"
				+ "From register, students \r\n"
				+ "where students.snum = register.snum\r\n"
				+ "and course_number = 311;";
		
		String problem8 = "Select name , snum \r\n"
				+ "From students \r\n"
				+ "where students.dob = \r\n"
				+ "(select min(students.dob) from students);";
		
		String problem9 = "Select name , snum \r\n"
				+ "From students \r\n"
				+ "where students.dob = \r\n"
				+ "(select max(students.dob) from students);";
		
		String problem10 = "Select name , snum , ssn \r\n"
				+ "From students \r\n"
				+ "where name like '%n%' or '%N%';";
		
		String problem11 = "Select name , snum , ssn \r\n"
				+ "From students \r\n"
				+ "where name not like '%n%' or '%N%';";
		
		String problem12 = "Select courses.name , register.course_number , COUNT(register.course_number)\r\n"
				+ "From courses, register\r\n"
				+ "where register.course_number = courses.number\r\n"
				+ "group by courses.name, register.course_number;";
		
		String problem13 = "Select students.name  \r\n"
				+ "From register, students\r\n"
				+ "where regtime = 'Fall2020' and register.snum = students.snum;";
		
		String problem14 = "Select number , name \r\n"
				+ "From courses \r\n"
				+ "where department_code = 401;";
		
		String problem15 = "Select number , name \r\n"
				+ "From courses \r\n"
				+ "where department_code  = 401 or department_code = 404;";
		
		String statement[] = {problem1, problem2, problem3, problem4, problem5, problem6, 
				problem7, problem8, problem9, problem10, problem11, problem12, problem13,
				problem14, problem15};
		
		return statement;
	}

}

package Database;// CHANGE PACKAGE NAME IF NEED BE

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 * @author Naveen Prabakar
 * 
 * The program creates the tables for data to be stored
 *
 */
public class CreateTables {
public static void main(String args[]) throws SQLException, ClassNotFoundException {
		
		Connection conn = getConnection();
		//Insert into tables
		String[] CreateStatements = getCreateStatements();
		
		
		try (var statement = conn.createStatement()){
			conn.setAutoCommit(false);
			for (String stmt: CreateStatements) {
			statement.addBatch(stmt);
		    }
		    statement.executeBatch();
		    conn.commit();
			conn.setAutoCommit(true);
			System.out.println("Created the tables");
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
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		
		
		Connection conn = null;	
		String userName = "coms363";// Change the root, if need be
		String password = "password";// Change the password if need be
		String dbServer = "jdbc:mysql://localhost:3306";
		
		conn = DriverManager.getConnection(dbServer,userName,password);
		
		
		
		
		
		String drop = "drop database if exists assingmentone;";// checks if the schema already exists, then drops it
		String sql = "Create Database assingmentone";// creates a new schema
		var statement = conn.createStatement();
		statement.execute(drop);
		statement.execute(sql);
		statement.execute("use assingmentone");// uses the schema that was created
		
		
		dbServer = "jdbc:mysql://localhost:3306/assingmentone";
		conn = DriverManager.getConnection(dbServer, userName, password);
		
		
		
		System.out.println("Connection to the database has been established");
		return conn;
		
	}
	
	
	/**
	 * 
	 * The program creates all the create table commands and stores it
	 * into an array
	 * 
	 * @return the array of Create Table commands
	 */
	public static String[] getCreateStatements() {
		String students = 
				"CREATE TABLE students"+
	                     "(snum integer not null,\n"
	                     + "ssn integer not null,\n"
	                     + "name varchar(10) default null,\n"
	                     + "gender varchar(1) default null,\n"
	                     + "dob datetime default null,\r\n"
	                     + "c_addr varchar (20) default null,\n"
	                     + "c_phone varchar(10) default null,\n"
	                     + "p_addr varchar(20) default null,\n"
	                     + "p_phone varchar(10) default null,\n"
	                     + "\n"
	                     + "Primary Key(ssn),\n"
	                     + "unique(snum));";
		
		
		String departments = "CREATE TABLE departments"+
		                    "(code integer,\r\n"
		                    + "name varChar(50),\n"
		                    + "phone varchar(10),\n"
		                    + "college varchar(20),\n"
		                    + "\r\n"
		                    + "Primary key(code),\n"
		                    + "unique(name)\n"
		                    + "\n"
		                    + ");";
		
		String Degrees = "CREATE TABLE Degrees"+
		                 "(name varchar(50),\n"
		                 + "level varchar(5),\n"
		                 + "department_code integer,\n"
		                 + "\n"
		                 + "Primary key(name, level),\n"
		                 + "foreign key(department_code)\n"
		                 + "  references departments(code)\n"
		                 + ");";
		
		String Courses = "CREATE TABLE Courses"+
		                "(number integer,\n"
		                + "name varchar(50),\n"
		                + "description varchar(50),\n"
		                + "credithours integer,\n"
		                + "level varchar(20),\n"
		                + "department_code integer,\n"
		                + "\n"
		                + "Primary key(number),\n"
		                + "unique(name),\n"
		                + "\n"
		                + "foreign key(department_code)\n"
		                + "references departments(code)\n"
		                + "\n"
		                + ");";
		String register = "CREATE TABLE register"+
		                 "(snum integer,\n"
		                 + "course_number integer,\n"
		                 + "regtime varchar(20),\n"
		                 + "grade integer,\n"
		                 + "\n"
		                 + "Primary key(snum, course_number),\n"
		                 + "\n"
		                 + "foreign key(snum) references students(snum),\n"
		                 + "\n"
		                 + "foreign key(course_number) references courses(number)\r\n"
		                 + ");";
		
		String major = "CREATE TABLE major"+
		              "(snum integer,\n"
		              + "name varchar(50),\n"
		              + "level varchar(5),\n"
		              + "\n"
		              + "Primary key(snum, name, level),\n"
		              + "\n"
		              + "foreign key(snum) references students(snum),\n"
		              + "\n"
		              + "foreign key(name, level) references degrees(name, level)\r\n"
		              + "\n"
		              + ");";
		
		String minor = "CREATE TABLE minor"+
		              "(snum integer,\n"
		              + "name varchar(50),\n"
		              + "level varChar(5),\n"
		              + "\n"
		              + "Primary key(snum, name, level),\n"
		              + "\n"
		              + "foreign key(snum) references students(snum),\n"
		              + "\n"
		              + "foreign key(name, level) references degrees(name, level)\r\n"
		              + "\n"
		              + ");";
				
		
		
		String statement[] = new String[] {students, departments, Degrees, 
				Courses, register, major, minor};
		
		return statement;
	}
}


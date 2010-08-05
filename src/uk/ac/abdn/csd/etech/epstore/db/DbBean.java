package uk.ac.abdn.csd.etech.epstore.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;

/**
 * @author bscharla
 * 
 *         A class to manage JDBC connections
 *         There are a variety of ways that it can be used as
 *         noted under the connect() method
 */
public class DbBean {

	String dbURL = "jdbc:mysql://localhost/ep-store?user=root&password=He1en";
	String dbDriver = "com.mysql.jdbc.Driver";

	private Connection dbCon;

	public DbBean() {
		super();
	}

	public boolean connect() throws NamingException, SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		// the jdk 1.5 way
		 Class.forName(this.getDbDriver()).newInstance();
		 dbCon = DriverManager.getConnection(this.getDbURL());

		// jdk 1.6 method
		//dbCon = DriverManager.getConnection(dbURL);

		// using data connection for pool
		// Context initContext = new InitialContext();
		// Context envContext = (Context)initContext.lookup("java:/comp/env");
		// DataSource ds = (DataSource)envContext.lookup("jdbc/ep-store");
		// dbCon = ds.getConnection();

		return true;
	}

	public void close() throws SQLException {

		dbCon.close();
	}

	public void commit() throws SQLException {
		dbCon.commit();
	}

	public void setAutoCommit(boolean autocommit) throws SQLException {
		dbCon.setAutoCommit(autocommit);
	}

	public void rollback() throws SQLException {
		dbCon.rollback();
	}

	public PreparedStatement prepareStatement(String sql) throws SQLException {
		PreparedStatement s = dbCon.prepareStatement(sql);
		return s;
	}

	public Statement createStatement() throws SQLException {
		Statement s = dbCon.createStatement();
		return s;
	}

	public int executeUpdate(String s) throws SQLException {
		Statement st = dbCon.createStatement();
		int count = st.executeUpdate(s);
		return count;
	}

	public ResultSet execSQL(StringBuffer sqlBuf) throws SQLException {
		Statement s = dbCon.createStatement();
		String sql = sqlBuf.toString();
		ResultSet rs = s.executeQuery(sql);
		return (rs == null) ? null : rs;
	}

	public String getDbDriver() {
		return this.dbDriver;
	}

	public void setDbDriver(String newValue) {
		this.dbDriver = newValue;
	}

	public String getDbURL() {
		return this.dbURL;
	}

	public void setDbURL(String newValue) {
		this.dbURL = newValue;
	}

	public ResultSet doQuery(StringBuffer qry) throws NamingException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		// Connection con = null;
		// Statement stmt = null;

		// set variables to take in resultset values
		// String returnedUserName = null;
		// String returnedPassword = null;
		ResultSet rs = null;

		try {

			// use the DbBean to make the connection to the database
			// now all db connections can be routed through the one place
			// DbBean db = new DbBean();
			connect();
			rs = execSQL(qry);

		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		}
		return rs;
	}

}

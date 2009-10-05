package uk.ac.abdn.csd.etech.epstore.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.NamingException;


import uk.ac.abdn.csd.etech.epstore.db.DbBean;

/**
 * 
 * @author bscharla
 * Basic model of a book from Amazon
 */
public class Book {
	
	int id = 0;
	String ASIN = "";
	String author = "";
	String manufacturer = "";
	String detailsPageURL = "";
	String title = "";
	DbBean db = new DbBean();

	public Book(String asin, String author, String manufacturer,
			String detailsPageURL, String title) {
		super();
	//	this.id = id;
		ASIN = asin;
		this.author = author;
		this.manufacturer = manufacturer;
		this.detailsPageURL = detailsPageURL;
		this.title = title;
	}

	public Book() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * 
	 * add a book to the database
	 * @throws NamingException 
	 */
	public void insertBook () throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException, NamingException {
		
		db.connect();
		StringBuffer insertSQL = new StringBuffer(1024);
		insertSQL.append("INSERT INTO books (detailsPageURL, author, manufacturer, title, ASIN) VALUES(?,?,?,?,?)");
		PreparedStatement prstmt = db.prepareStatement(insertSQL.toString());
		prstmt.setString(1,this.detailsPageURL);
		prstmt.setString(2, this.author);
		prstmt.setString(3,this.manufacturer);
		prstmt.setString(4, this.title);
		prstmt.setString(5,this.ASIN);
		prstmt.executeUpdate();
		prstmt.close();
	}
	
	public Vector getBooks(String quantity) throws SQLException, NamingException, InstantiationException, IllegalAccessException, ClassNotFoundException {

		StringBuffer qry = new StringBuffer(1024);
		ResultSet rs = null;
		Vector items = new Vector();

		if (quantity.equals("all")) {
			qry.append("select * from books");
		} else {
			qry.append("select * from books where id=" + quantity);
		}

		rs = db.doQuery(qry);

		while (rs.next()) {

			// first retrieve items from db
			id = rs.getInt("id");
			ASIN = rs.getString("ASIN");
			manufacturer = rs.getString("manufacturer");
			title = rs.getString("title");
			detailsPageURL = rs.getString("detailsPageURL");
			author = rs.getString("author");

			// second add the items to a bean
			Book book = new Book();

			book.setId(id);
			book.setASIN(ASIN);
			book.setAuthor(author);
			book.setDetailsPageURL(detailsPageURL);
			book.setManufacturer(manufacturer);
			book.setTitle(title);
			

			//third add book to items

			items.addElement(book);
		}

		return items;
	}
	
	public Book getBook(String bookid) throws SQLException, NamingException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		Book book = new Book();
		StringBuffer qry = new StringBuffer(1024);
		ResultSet rs = null;
				qry.append("select * from books where id=" + bookid);
		

		rs = db.doQuery(qry);

		while (rs.next()) {

			// first retrieve items from db
			id = rs.getInt("id");
			ASIN = rs.getString("ASIN");
			manufacturer = rs.getString("manufacturer");
			title = rs.getString("title");
			detailsPageURL = rs.getString("detailsPageURL");
			author = rs.getString("author");

			book.setId(id);
			book.setASIN(ASIN);
			book.setAuthor(author);
			book.setDetailsPageURL(detailsPageURL);
			book.setManufacturer(manufacturer);
			book.setTitle(title);
		}

		return book;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the aSIN
	 */
	public String getASIN() {
		return ASIN;
	}

	/**
	 * @param asin the aSIN to set
	 */
	public void setASIN(String asin) {
		ASIN = asin;
	}

	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}

	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}

	/**
	 * @return the manufacturer
	 */
	public String getManufacturer() {
		return manufacturer;
	}

	/**
	 * @param manufacturer the manufacturer to set
	 */
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	/**
	 * @return the detailsPageURL
	 */
	public String getDetailsPageURL() {
		return detailsPageURL;
	}

	/**
	 * @param detailsPageURL the detailsPageURL to set
	 */
	public void setDetailsPageURL(String detailsPageURL) {
		this.detailsPageURL = detailsPageURL;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String toString() {
		StringBuffer sb = new StringBuffer(1024);
		sb.append("The author of ");
		sb.append(this.title);
		sb.append(" is ");
		sb.append(this.author);
		sb.append(" which was published by " );
		sb.append(this.manufacturer);
		return sb.toString();
	}

}

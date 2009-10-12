package uk.ac.abdn.csd.etech.epstore.models;

/*Dvd.java class is a domain object which acts as POJO 
with a default Constructor (automatically provided if not specified).
Getters and setters are defined for its properties "ASIN","actor1","actor2" etc.
*/
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.naming.NamingException;




import uk.ac.abdn.csd.etech.epstore.db.DbBean;

public class Dvd {
	
	int id = 0;
	String ASIN = "";
	String actor = "";
	String actor2 = "";
	String director = "";
	String detailsPageURL = "";
	String title = "";					
	String genre = "kids"; 				// have to change genre when inserting data
	String image="";
	DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    java.util.Date date = new java.util.Date();
    String datetime = dateFormat.format(date);
    String dateadded= dateFormat.format(date);
	
	public Dvd(int id, String asin, String actor,String actor2, String director,String detailsPageImage, String title, String genre, 	String Image) {
		super();
		this.id = id;
		this.ASIN = asin;
		this.actor = actor;
		this.actor2 = actor2;
		this.director = director;
		this.detailsPageURL = detailsPageURL;
		this.title = title;
		this.genre =genre;
		this.image =image;

	}
	
	public Dvd() {
	}
	
	/**
	 * The method below inserts a dvd record into the database
	 * @throws NamingException 
	 */
	public void insertDvd () throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException, NamingException {
		DbBean db = new DbBean();
		db.connect();		
		StringBuffer insertSQL = new StringBuffer(1024);
		insertSQL.append("INSERT INTO dvds (ASIN, detailsPageURL, title, actor, actor2, director, genre, dateadded, image) VALUES		(?,?,?,?,?,?,?,?,?)");

		PreparedStatement prstmt = db.prepareStatement(insertSQL.toString());
		
		
		prstmt.setString(1,this.ASIN);
		prstmt.setString(2, this.detailsPageURL);
		prstmt.setString(3,this.title);
		prstmt.setString(4,this.actor);
		prstmt.setString(5, this.actor2);
		prstmt.setString(6,this.director);
		prstmt.setString(7,genre);
		prstmt.setString(8,dateadded);
		prstmt.setString(9,image);


		prstmt.executeUpdate();
		prstmt.close();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getASIN() {
		return ASIN;
	}

	public void setASIN(String asin) {
		ASIN = asin;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getActor2() {
		return actor;
	}

	public void setActor2(String actor2) {
		this.actor2 = actor2;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getDetailsPageURL() {
		return detailsPageURL;
	}

	public void setDetailsPageURL(String detailsPageURL) {
		this.detailsPageURL = detailsPageURL;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDateAdded() {
		return dateadded;
	}

	public void setDateAdded(String dateadded) {
		this.dateadded = dateadded;
	}
	
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public Dvd getDvd(int dvd_id) throws SQLException, NamingException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		DbBean db = new DbBean();
		Dvd dvd = new Dvd();
		
			StringBuffer qry = new StringBuffer(1024);
			ResultSet rs = null;
					qry.append("select * from dvds where id=" + dvd_id);
			

			rs = db.doQuery(qry);

			while (rs.next()) {

				// first retrieve items from db
				id = rs.getInt("id");
				ASIN = rs.getString("ASIN");
				director = rs.getString("director");
				title = rs.getString("title");
				detailsPageURL = rs.getString("detailsPageURL");
				actor = rs.getString("actor");
				actor2 = rs.getString("actor2");
				genre = rs.getString("genre");
				image = rs.getString("image");

				dvd.setId(id);
				dvd.setASIN(ASIN);
				dvd.setDirector(director);
				dvd.setDetailsPageURL(detailsPageURL);
				dvd.setActor(actor);
				dvd.setActor2(actor2);
				dvd.setTitle(title);
				dvd.setImage(image);
				dvd.setGenre(genre);
			}
		
		return dvd;
	}
	
}
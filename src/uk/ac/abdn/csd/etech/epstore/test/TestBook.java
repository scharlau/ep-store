package uk.ac.abdn.csd.etech.epstore.test;

import java.sql.SQLException;

import javax.naming.NamingException;

import uk.ac.abdn.csd.etech.epstore.models.Book;
import junit.framework.TestCase;

public class TestBook extends TestCase {

	public TestBook(String name) {
		super(name);
	}

	protected void setUp() throws Exception {
		super.setUp();
	}

	protected void tearDown() throws Exception {
		super.tearDown();
	}

	public void testBookStringStringStringStringString() {
		Book theBook = new Book("1234512345","ambrose","penguin","http://thedevilsdictionary.com","devil's dictionary");
		assertEquals("Manufacturer", "penguin", theBook.getManufacturer());
	}

	public void testInsertBook() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException, NamingException {
		Book theBook = new Book("1234512345","ambrose","penguin","http://thedevilsdictionary.com","devil's dictionary");
		theBook.insertBook();
	}

}

package uk.ac.abdn.csd.etech.epstore.parse;

import java.io.CharArrayWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;

import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;
import org.xml.sax.helpers.XMLReaderFactory;

import uk.ac.abdn.csd.etech.epstore.models.Dvd;

/**
 * 
 * Class to parseItems in REST format from Amazon
 */
public class ParseItems extends DefaultHandler {
	boolean image = false;

	// default parser to use
	ArrayList<String> name = new ArrayList<String>();
	private static String parserClass = "org.apache.xerces.parsers.SAXParser";

	// local customer to store data from the xml document
	private Dvd dvd = new Dvd();

	// local list of order items
	private Vector<Dvd> orderItems = new Vector<Dvd>();

	// local current reference
	private Dvd currentDvdItem;

	// buffer for collecting data from the characters() sax event
	private CharArrayWriter contents = new CharArrayWriter();

	// override methods of the DefaultHandler class
	// to gain notification of sax events
	// see org.xml.sax.ContentHandler for all available events
	// 
	public void startDocument() throws SAXException {
		System.out.println("sax event: startDocument");
	}

	public void endDocument() throws SAXException {
		System.out.println("sax event: endDocument");
	}

	public void startElement(String namespaceURI, String localName,
			String qName, Attributes attr) throws SAXException {
	//	System.out.println("startElement: " + localName.toString());
	//	System.out.println("contents: " + contents.toString());
		contents.reset();

		if (localName.equals("Item")) {
			currentDvdItem = new Dvd();
			System.out.println("new dvd");
			orderItems.addElement(currentDvdItem);
		}
		
		if (localName.equals("ItemAttributes")) {
			
		     name.clear();
		}

		if (localName.equals("SmallImage")) {
		     name.clear();
		     image = true;
			
		}

	} // end of startElement

	public void endElement(String namespaceURI, String localName, String qName)
			throws SAXException {

		
		if (localName.equals("Actor")) {					/* Checks to see if the namespace matches a given 	

								dvd attribute and then stores the record. */
			
			 name.add(contents.toString());
			currentDvdItem.setActor(name.get(0));
				if(name.size()>1)				/* If more than 1 actor exists, store the second actor as 

well*/
				currentDvdItem.setActor2(name.get(1));			
		}
		
		if (localName.equals("DetailPageURL")) {
			currentDvdItem.setDetailsPageURL(contents.toString());
		}
		if (localName.equals("Director")) {
			currentDvdItem.setDirector(contents.toString());	
		}
		
		if (localName.equals("Title")) {
			currentDvdItem.setTitle(contents.toString());
			System.out.println("Title: " + currentDvdItem.getTitle());
		}
		
		
		if (localName.equals("ASIN")) {
			currentDvdItem.setASIN(contents.toString());
		}

		if (localName.equals("URL")&&image) {
			String s = contents.toString();
			currentDvdItem.setImage(s);
		//	System.out.println("image:   "+s);
			image = false;
		}
		
	}// end endElement

	public void characters(char[] ch, int start, int length)
			throws SAXException {
		contents.write(ch, start, length);
	}

	public Dvd getDvd() {
		return dvd;
	}

	public Vector<Dvd> getOrderItems() {
		return orderItems;
	}

	public String Parse(InputSource url) {
		StringBuffer sb = new StringBuffer(1024);
		System.out.println("AWS-REST:");
		try {
			// create sax2 parser
			XMLReader xr = XMLReaderFactory.createXMLReader(parserClass);

			// set the ContentHandler
			ParseItems aws = new ParseItems();
			xr.setContentHandler(aws);

			 //parse the file
			 //xr.parse(new InputSource( new FileReader(filePath)));
			xr.parse(url);

			Vector<Dvd> myDvds = aws.getOrderItems();
			Enumeration<Dvd> e = myDvds.elements();
			while (e.hasMoreElements()) {
				Dvd thisDvd = e.nextElement();
				thisDvd.insertDvd();
				sb.append(thisDvd.toString());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
}
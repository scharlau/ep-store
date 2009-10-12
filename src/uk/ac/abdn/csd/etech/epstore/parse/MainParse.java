package uk.ac.abdn.csd.etech.epstore.parse;

import org.xml.sax.InputSource;

import java.io.UnsupportedEncodingException;
import java.net.*;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

/**
 * This class gets a URL using Amazon RESTful service and parses the results
 * into java objects which are stored in the db
 * 
 * Amazon details go into SignedRequestsHelper
 * Database details into DbBean
 */
public class MainParse {

	public MainParse() {
	}

	public static void main(String[] args) throws InterruptedException, InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException {
		try {
			 System.setProperty("http.proxyHost", "proxy.abdn.ac.uk");
			 System.setProperty("http.proxyPort", "8080");

			// Comment out the two above lines for use at home

			Authenticator.setDefault(new SimpleAuthenticator("db-username", "db-password"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	String result = "";
	Integer count = new Integer(0);
		for (count=0; count <= 5; count++) {  // For loop to iterate repetitively to
										// keep parsing results into the database
			
			// sleep so that you do not exceed allowed calls to the service, which will get you banned
			Thread.sleep(4000);
			
			// can set different variables for different tasks and loop through them as required
			
			// need to modify this to work with signed requests as on the web page examples, and have
			// it use the SignedRequestAuthenticator
				
			SignedRequestsHelper sgh = new SignedRequestsHelper();
			Map<String, String> myparams = new HashMap<String, String>();
			myparams.put("Service", "AWSECommerceService");
			myparams.put("Operation", "ItemSearch");
			myparams.put("Version", "2009-10-01");
			myparams.put("ContentType","text/xml");
			myparams.put("SearchIndex","DVD");
			myparams.put("Keywords","punk");
			
			myparams.put("ItemPage", count.toString());
			myparams.put("ResponseGroup", "ItemAttributes,Offers,Images");
			//myparams.put("Style", "http://ecs.amazonaws.com/xsl/aws4/item-search.xsl");

			String signedUri = sgh.sign(myparams);

			InputSource is = new InputSource(signedUri);

			if (is != null) {
				ParseItems aws = new ParseItems();
				result = aws.Parse(is);
			}
			System.out.println("result: " + result);
		}
		System.out.println("done");
	}
}
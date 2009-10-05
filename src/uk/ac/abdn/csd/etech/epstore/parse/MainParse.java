package uk.ac.abdn.csd.etech.epstore.parse;

import org.xml.sax.InputSource;
import java.net.*;

/**
 * This class gets a URL using Amazon RESTful service and parses the results
 * into java objects which are stored in the db
 */
public class MainParse {
	static String mySubID = "myamazonidnumber";

	public MainParse() {
	}

	public static void main(String[] args) throws InterruptedException {
		try {
			 System.setProperty("http.proxyHost", "proxy.abdn.ac.uk");
			 System.setProperty("http.proxyPort", "8080");

			// Commented the two above lines for use at home

			Authenticator.setDefault(new SimpleAuthenticator("db-username", "db-password"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	String result = "";
		for (int i = 0; i <= 5; i++) {  // For loop to iterate repetitively to
										// keep parsing results into the database
			
			// sleep so that you do not exceed allowed calls to the service, which will get you banned
			Thread.sleep(4000);
			
			// can set different variables for different tasks and loop through them as required
			
			// String parseREST =
			// "http://ecs.amazonaws.co.uk/onca/xml?Service=AWSECommerceService&Version=2005-03-23&Operation=ItemSearch&ContentType=text%2Fxml&SubscriptionId=" + mySubID + "&SearchIndex=DVD&Keywords=thriller&ResponseGroup=Images,Small"
			// +i;
			// String parseREST =
			// "http://ecs.amazonaws.co.uk/onca/xml?Service=AWSECommerceService&Version=2005-03-23&Operation=ItemSearch&ContentType=text%2Fxml&SubscriptionId=" + mySubID + "&SearchIndex=DVD&ItemPage="
			// +i+"&Keywords=action&ResponseGroup=Images,Small";

			// String parseREST =
			// "http://ecs.amazonaws.co.uk/onca/xml?Service=AWSECommerceService&Version=2005-03-23&Operation=ItemSearch&ContentType=text%2Fxml&SubscriptionId=" + mySubID + "&SearchIndex=DVD&ItemPage="
			// +i+"&Keywords=kids&ResponseGroup=Images,Small";
			String parseREST = "http://ecs.amazonaws.co.uk/onca/xml?Service=AWSECommerceService&Version=2005-03-23&Operation=ItemSearch&ContentType=text%2Fxml&SubscriptionId=" + mySubID + "&SearchIndex=DVD&ItemPage="
					+ i + "&Keywords=punk&ResponseGroup=Images,Small";
			InputSource is = new InputSource(parseREST);

			if (is != null) {
				ParseItems aws = new ParseItems();
				result = aws.Parse(is);
			}
			System.out.println("result: " + result);
		}
		System.out.println("done");
	}
}
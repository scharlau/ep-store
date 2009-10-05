<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" import="org.xml.sax.InputSource,
    javax.xml.transform.*, javax.xml.transform.stream.*, javax.xml.transform.sax.*, 
    uk.ac.abdn.csd.etech.epstore.parse.*, java.util.Map, java.util.HashMap"
    contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>AWS Response with stylesheet</title>
</head>
<body>
<%
SignedRequestsHelper sgh = new SignedRequestsHelper();
Map<String, String> myparams = new HashMap<String, String>();
myparams.put("Service", "AWSECommerceService");
myparams.put("Operation", "ItemSearch");
myparams.put("Version", "2009-10-01");
myparams.put("ContentType","text/xml");
myparams.put("SearchIndex","DVD");
myparams.put("Keywords","punk");
myparams.put("ResponseGroup", "ItemAttributes,Offers,Images");
//myparams.put("Style", "http://ecs.amazonaws.com/xsl/aws4/item-search.xsl");

String signedUri = sgh.sign(myparams);

String xslFile    = "http://localhost:8080/ep-store/sampleStyle.xsl";

TransformerFactory tFactory = TransformerFactory.newInstance();
Transformer transformer = tFactory.newTransformer(new StreamSource(xslFile));
transformer.transform(new SAXSource(new InputSource(signedUri)), new StreamResult(out));
%>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>The EP STORE</title>
</head>
<body>
<h3>The REST page for pulling down stock for the store</h3>
<p>The links below will retrieve material from various sources, which we'll put
into the database as and when we've sorted out the links.</p>
<p>Each link returns an xml file, which needs to be parsed and put into the db.</p>
<p>The amazon links pull more details that need to be worked over for more details. These were generated using
the Amazon Web Service Scratch Pad at <a href="http://www.awszone.com">http://www.awszone.com</a>. Where the UK version
didn't offer a form the US one was used and the url changed to .co.uk</p>
<ul>
<li>Amazon: </li>
<li><a href="http://ecs.amazonaws.co.uk/onca/xml?Service=AWSECommerceService&Version=2005-03-23&Operation=ItemSearch&ContentType=text%2Fxml&SubscriptionId=0525E2PQ81DD7ZTWTK82&SearchIndex=Books&Keywords=punk&ResponseGroup=Small">Punk books</a></li>
<li><a href="http://ecs.amazonaws.co.uk/onca/xml?Service=AWSECommerceService&Version=2005-03-23&Operation=ItemSearch&ContentType=text%2Fxml&SubscriptionId=0525E2PQ81DD7ZTWTK82&SearchIndex=DVD&Keywords=punk&ResponseGroup=Small">Punk DVDs</a></li>

<p>We could also use the details from <a href="http://www.audioscrobbler.net/data/webservices/">Audioscrobbler</a> that is tied to Last.fm to get further details about the 
Punk artists that we're interested in.</p>
<p><a href="books.jsp">The Books so far</p>
</body>
</html>
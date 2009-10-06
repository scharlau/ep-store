<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:fo="http://www.w3.org/1999/XSL/Format" 
xmlns:aws="http://webservices.amazon.com/AWSECommerceService/2009-10-01">


<xsl:template match="aws:ItemSearchResponse">
<!-- Originally taken as the amazon example at http://ecs.amazonaws.com/xsl/aws4/item-search.xsl -->

  <html>
    <head>
      <title>Meston Movies</title>
    
    </head>
    <body bgcolor="#FFFFFF" link="#003399" alink="#FF9933" vlink="#996633" text="#000000">
<h1>Welcome to Meston Movies</h1>
        <xsl:apply-templates/>
</body>
</html>

</xsl:template>


<xsl:template match="aws:Items/aws:Item" >

<xsl:if test="aws:ItemAttributes/aws:Title"> 
<p> 
<img> 
<xsl:attribute name="src"> 
<xsl:value-of select="aws:SmallImage/aws:URL"/> 
</xsl:attribute> 
</img> 
<br/> 
<xsl:value-of select="aws:ItemAttributes/aws:Title"/> 
 by <xsl:value-of select="aws:ItemAttributes/aws:Director" />
<br/> 
List Price: <xsl:value-of select="aws:ItemAttributes/aws:ListPrice/aws:FormattedPrice"/><br/> 
Best New Price: <xsl:value-of select="aws:OfferSummary/aws:LowestNewPrice/aws:FormattedPrice"/> 
</p> 
</xsl:if> 

</xsl:template>

</xsl:stylesheet>


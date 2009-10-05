<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:aws="http://xml.amazon.com/AWSECommerceService/2004-08-01">

<xsl:template match="aws:ItemSearchResponse">

<!-- Originally taken as the amazon example at http://ecs.amazonaws.com/xsl/aws4/item-search.xsl
     This sample stylesheet uses optional parameters (if passed in) for minor display changes

     - CellBgColor (ex: CellBgColor=ffffff ): heading cell color
     - HeadingFontColor (ex: HeadingFontColor=00000 ): heading font color
     - FontFamily (ex: FontFamily=sans-serif ): font used for the entire page
     - ShowDocs: "true" to show documentation about this stylesheet, "false" to hide the documentation.  Default is "true".
-->

  <xsl:variable name="baseURL" select="'http://xml.amazon.com/onca/xml?'" />
  <xsl:variable name="stylesheetPath" select="'http://xml.amazon.com/xsl/aws4/item-search.xsl'" />

  <xsl:variable name="DeveloperToken">
    <xsl:if test="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'DeveloperToken']/@Value">
      <xsl:value-of select="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'DeveloperToken']/@Value" />
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="AssociateTag">
    <xsl:if test="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'AssociateTag']/@Value">
      <xsl:value-of select="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'AssociateTag']/@Value" />
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="CellBgColor">
    <xsl:choose>
      <xsl:when test="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'CellBgColor']/@Value">
        <xsl:value-of select="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'CellBgColor']/@Value" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>F0FFF0</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

   <xsl:variable name="HeadingFontColor">
    <xsl:choose>
      <xsl:when test="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'HeadingFontColor']/@Value">
        <xsl:value-of select="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'HeadingFontColor']/@Value" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>008080</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

   <xsl:variable name="FontFamily">
    <xsl:choose>
      <xsl:when test="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'FontFamily']/@Value">
        <xsl:value-of select="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'FontFamily']/@Value" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>verdana,arial,helvetica,sans-serif</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

   <xsl:variable name="ShowDocs">
    <xsl:choose>
      <xsl:when test="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'ShowDocs']/@Value">
        <xsl:value-of select="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'ShowDocs']/@Value" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>true</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <html>
    <head>
      <title>ItemSearch - Sample XSL Stylesheet</title>
      <style type="text/css">
        <xsl:comment>
          <xsl:text>
            BODY { 
            font-family: </xsl:text>
            <xsl:value-of select="$FontFamily" />
            <xsl:text>; 
            font-size: 12px; }</xsl:text>
          <xsl:text>
            TD, TH {
            font-family: </xsl:text>
            <xsl:value-of select="$FontFamily" />
            <xsl:text>; 
            font-size: 12px; }</xsl:text>
          <xsl:text>
            .h1 { font-family: </xsl:text><xsl:value-of select="$FontFamily" /><xsl:text>; color: #</xsl:text><xsl:value-of select="$HeadingFontColor" /><xsl:text>; font-size: small; }
        </xsl:text>
          <xsl:text>.h3color { font-family: </xsl:text><xsl:value-of select="$FontFamily" /><xsl:text>; color: #</xsl:text><xsl:value-of select="$HeadingFontColor" /><xsl:text>; font-size: x-small; }
        </xsl:text>
        <xsl:text>
          .button{
          font-family: </xsl:text>
          <xsl:value-of select="$FontFamily" /><xsl:text>;
          font-size: 12px;
          width:29px;
          height:23px;
          color:#000000;
          cursor:pointer;
          background-color:#</xsl:text><xsl:value-of select="$CellBgColor" />
          <xsl:text>;
          border: #C0C0C0 outset 1px;
          margin-left:1px;}
        </xsl:text>  
      </xsl:comment>
      </style>
    </head>
    <body bgcolor="#FFFFFF" link="#003399" alink="#FF9933" vlink="#996633" text="#000000">
 
      <xsl:if test="$ShowDocs = 'true'">
        <table align="center" cellpadding="0" cellspacing="0" style="width: 90%;padding:5px">
          <tr><td class="h3color" style="background-color:#{$CellBgColor}"><b>ItemSearch - Sample XSL Stylesheet</b></td></tr>
          <tr>
            <td>
              <p>This sample stylesheet shows how extra parameters in your AWS request may be used to change how your stylesheet behaves.  To see how this works, try adding the following to the end of your request URL:</p> 
              <p style="margin-left: 15px;"><strong>&amp;CellBgColor=FFCC99&amp;HeadingFontColor=CC3399&amp;FontFamily=courier,serif</strong></p>
              <p>Note that adding these parameters changes the background color of the dividers on the page, the color of the header text, and the font of all the text on the page.</p>
              <p>For REST (or XML over HTTP) requests, you can add as many extra parameters to your requests as you would like.  The extra parameters and their values will be echoed back to you in the Arguments element that appears in your response:</p>
              <p style="margin-left: 15px; font-size: xx-small">
	  	  &lt;Arguments><br/>
			<span style="margin-left: 20px">...<br/></span>
			<span style="margin-left: 20px">...<br/></span>
			<span style="margin-left: 20px">&lt;Argument Name="CellBgColor" Value="FFCC99"/><br/></span>
			<span style="margin-left: 20px">&lt;Argument Name="HeadingFontColor" Value="CC3399"/><br/></span>
			<span style="margin-left: 20px">&lt;Argument Name="FontFamily" Value="courier,serif"/><br/></span>
		  &lt;/Arguments>
              </p>
              <p>You can use the echoed parameters in your stylesheet to change how the stylesheet behaves or to change the look and feel of the HTML your stylesheet generates.</p>
              <p>Note: To hide this information, add this to the end of your request URL: <strong>&amp;ShowDocs=false</strong></p>
            </td>
          </tr>
        </table>
        <br />
      </xsl:if>
      
      <br />
      <table align="center" cellpadding="0" cellspacing="0" style="width: 90%;padding:5px">
        <tr><td colspan="2" class="h3color" style="background-color:#{$CellBgColor}"><b>Search</b></td></tr>
        <form method="get" action="{$baseURL}">
          <input type="hidden" name="ResponseGroups" value="Medium,ItemAttributes" />
          <input type="hidden" name="DeveloperToken" value="{$DeveloperToken}" />
          <input type="hidden" name="AssociateTag" value="{$AssociateTag}" />
          <input type="hidden" name="Service" value="AWSProductData" />
          <input type="hidden" name="Operation" value="ItemSearch" />
          <input type="hidden" name="CellBgColor" value="{$CellBgColor}" />
          <input type="hidden" name="HeadingFontColor" value="{$HeadingFontColor}" />
          <input type="hidden" name="FontFamily" value="{$FontFamily}" />
          <input type="hidden" name="Style" value="{$stylesheetPath}" /> 
          <input type="hidden" name="Version" value="2004-08-01" />
          <input type="hidden" name="ContentType" value="text/html" />

          <tr>
            <td align="right" valign="middle" width="90">Keywords:</td>
            <td>
              <input type="text" size="21" name="Keywords" />
            </td>
          </tr>
          <tr>
            <td align="right" valign="middle" width="90">Search Index:</td>
            <td>
              <select name="SearchIndex">
                <option name="Books">Books</option>
                <option name="Music">Music</option>
                <option name="Classical">Classical</option>
                <option name="DVD">DVD</option>
                <option name="Video">Video</option>
                <option name="VHS">VHS</option>
                <option name="Toys">Toys</option>
                <option name="Apparel">Apparel</option>
                <option name="Baby">Baby</option>
                <option name="Videogames">Videogames</option>
                <option name="Electronics">Electronics</option>
                <option name="Photo">Photo</option>
                <option name="Software">Software</option>
                <option name="Tools">Tools</option>
                <option name="OfficeProducts">Office Products</option>
                <option name="Wireless">Wireless Phones</option>
                <option name="HealthPersonalCare">Health &#38; Personal Care</option>
                <option name="Magazines">Magazines</option>
                <option name="SportingGoods">Sporting Goods</option>
                <option name="Kitchen">Kitchen</option>
                <option name="OutdoorLiving">Outdoor Living</option>
                <option name="Jewelry">Jewelry</option>
                <option name="GourmetFood">GourmetFood</option>
                <option name="MusicTracks">Music Tracks</option>
                <option name="DigitalMusic">Digital Music</option>
                <option name="PCHardware">PC Hardware</option>
                <option name="Miscellaneous">Miscellaneous</option>
                <option name="Restaurants">Restaurants</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>&#160;</td>
            <td><input type="submit" value="go" name="go" class="button" /></td>
          </tr>
        </form>
      </table>
      <br />
  <table align="center" cellpadding="0" cellspacing="0" style="width: 90%;padding:5px">
        <tr><td colspan="2" class="h3color" style="background-color:#{$CellBgColor}"><b>Search results display for "<i><xsl:value-of select="aws:OperationRequest/aws:Arguments/aws:Argument[@Name = 'Keywords']/@Value" /></i>"</b></td></tr>

        <xsl:apply-templates select="aws:Items/aws:Item" />

  </table>
</body>
</html>


</xsl:template>

<xsl:template match="aws:Items/aws:Item">
      <tr>
        <td style="border-bottom:#C0C0C0 dotted 1px;padding:10px">
          <table cellpadding="0" cellspacing="0" style="width: 90%;padding:5px">
            <tr>
              <xsl:if test="aws:SmallImage/aws:URL">
                <td valign="top" width="50">
                  <img>
                    <xsl:attribute name="src"><xsl:value-of select="aws:SmallImage/aws:URL" /></xsl:attribute>
                    <xsl:attribute name="border">0</xsl:attribute>
                  </img>
                </td>
              </xsl:if>
              <td valign="top">
                <xsl:value-of select="aws:ItemAttributes/aws:Title" />
                <br />
                <span style="font-size:10px">
                <xsl:if test="aws:ItemAttributes/aws:Author">
                  by <xsl:value-of select="aws:ItemAttributes/aws:Author" />
                </xsl:if>
                <xsl:if test="aws:ItemAttributes/aws:Artist">
                  by <xsl:value-of select="aws:ItemAttributes/aws:Artist" />
                </xsl:if>
                <xsl:if test="aws:ItemAttributes/aws:Director">
                  by <xsl:value-of select="aws:ItemAttributes/aws:Director" />
                </xsl:if>
                <xsl:if test="aws:ItemAttributes/aws:Composer">
                  by <xsl:value-of select="aws:ItemAttributes/aws:Composer" />
                </xsl:if>
                <xsl:if test="aws:ItemAttributes/aws:Manufacturer">
                  from <xsl:value-of select="aws:ItemAttributes/aws:Manufacturer" />
                </xsl:if>
              </span>
              <br /><br />
                <span style="font-size:11px;">List Price: <xsl:value-of select="aws:ItemAttributes/aws:ListPrice/aws:FormattedPrice" /></span>
              </td>
            </tr>
          </table>
        </td>
      </tr>
</xsl:template>

</xsl:stylesheet>


<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
 <xsl:template match="/">
  <html>
   <head>
    <meta charset="UTF-8"></meta>
   </head>
   <body>
       <font color="{library/color}"><xsl:value-of select="library/book"/></font>
   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>

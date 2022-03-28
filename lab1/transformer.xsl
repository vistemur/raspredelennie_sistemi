<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
 <xsl:template match="/">
  <html>
   <head>
    <meta charset="UTF-8"></meta>
   </head>
   <body>
       <p>
       <xsl:for-each select="list/*">
           <xsl:value-of select="@name"/>
           <xsl:choose>
            <xsl:when test="position() = last()">
                <xsl:text>.</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>, </xsl:text>
            </xsl:otherwise>
            </xsl:choose>
       </xsl:for-each>
       </p>
   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>

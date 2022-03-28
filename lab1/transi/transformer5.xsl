<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
 <xsl:template match="/">
  <html>
   <head>
    <meta charset="UTF-8"></meta>
   </head>
   <body>
       <xsl:for-each select="root/*">
           <xsl:call-template name="loop">
           </xsl:call-template>
       </xsl:for-each>
   </body>
  </html>
 </xsl:template>

 <xsl:template name="loop">

    <xsl:if test="name() = 'BBB'">
        <font color="red"><xsl:value-of select="name()"/> id=<xsl:value-of select="@id"/></font>
    </xsl:if>
    <xsl:if test="name() = 'CCC'">
        <font color="blue"><xsl:value-of select="name()"/> id=<xsl:value-of select="@id"/></font>
    </xsl:if>
    <xsl:if test="name() = 'DDD'">
        <font color="green"><xsl:value-of select="name()"/> id=<xsl:value-of select="@id"/></font>
    </xsl:if>

    <xsl:for-each select="./*">
        <xsl:call-template name="loop">
        </xsl:call-template>
    </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>

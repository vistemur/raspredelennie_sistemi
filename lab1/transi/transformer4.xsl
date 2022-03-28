<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
 <xsl:template match="/">
  <html>
   <head>
    <meta charset="UTF-8"></meta>
   </head>
   <body>
        <table border="1" cellpadding="6">
        <tr><th colspan="2">Axis: child</th></tr>
        <tr><th>Element</th><th>Node-set</th></tr>
        <xsl:for-each select="root/*">
            <xsl:call-template name="loop">
            </xsl:call-template>
        </xsl:for-each>
        </table>
   </body>
  </html>
 </xsl:template>

 <xsl:template name="loop">
    <tr><td><xsl:value-of select ="name()"/> id = <xsl:value-of select ="@id"/></td><td> <xsl:value-of select ="../@id"/> </td></tr>
    <xsl:for-each select="./*">
        <xsl:call-template name="loop">
        </xsl:call-template>
    </xsl:for-each>
 </xsl:template>
</xsl:stylesheet>

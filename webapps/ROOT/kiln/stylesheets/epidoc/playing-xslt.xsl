<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html"/>
    
    <xsl:template match="shout">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="message">
        <html>
            <body style="color: blue">
                <h1>
                   <xsl:apply-templates/> 
                </h1>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="poohbear">
        <pooh cozy="very"></pooh>
    </xsl:template>
</xsl:stylesheet>
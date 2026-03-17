<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!-- STARTPUNKT -->
    <xsl:template match="/">
        
        <html>
            <head>
                <title>Schiele Edition</title>
            </head>
            
            <body>
                <h1>Schiele Briefe</h1>
                
                <xsl:apply-templates/>
                
            </body>
        </html>
        
    </xsl:template>
    
    <!-- Absatz -->
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- Personen -->
    <xsl:template match="tei:persName">
        <span style="color:blue;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Orte -->
    <xsl:template match="tei:placeName">
        <span style="color:green;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Organisationen -->
    <xsl:template match="tei:orgName">
        <span style="color:purple;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">

    <!-- STARTPUNKT -->
    <xsl:template match="/">

        <html>
            <head>
                <title>Schiele Edition</title>
                <link rel= "stylesheet" href="../css/style.css"/>
            </head>

            <body>
                <h1>Schiele Edition</h1>
                
                <!-- Für normale Texte -->
                <xsl:apply-templates select="//tei:text"/>
                
                <!-- Für Werksverzeichnis -->
                <xsl:apply-templates select="//tei:listObject"/>
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
        <span class="person">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- Orte -->
    <xsl:template match="tei:placeName">
        <span class="place">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- Organisationen -->
    <xsl:template match="tei:orgName">
        <span class="org">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Werke -->
    <xsl:template match="tei:objectName">
        <span class="work">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:div[@type='address'][@rend='allcaps']">
        <div class="postcard-address-uppercase">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:listObject">
        <div class="works">
            <xsl:apply-templates select="tei:object"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:object">
        <div class="work">
            
            <h2>
                <xsl:value-of select="tei:objectIdentifier/tei:objectName[1]"/>
            </h2>
            
            <xsl:if test="tei:objectIdentifier/tei:objectName[@type='alt']">
                <p>
                    (<xsl:value-of select="tei:objectIdentifier/tei:objectName[@type='alt']"/>)
                </p>
            </xsl:if>
            
            <p class="repo">
                <xsl:apply-templates select="tei:objectIdentifier/tei:repository"/>
            </p>
            
        </div>
    </xsl:template>
    
    <xsl:template match="tei:repository">
        <xsl:choose>
            <xsl:when test="tei:orgName">
                <xsl:value-of select="tei:orgName"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="tei:note"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

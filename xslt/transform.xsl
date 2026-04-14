<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">

<xsl:template match="tei:teiHeader"/>
    <xsl:template match="/">

        <html>
            <head>
                <title>Schiele Edition</title>
                <link rel="stylesheet" href="../css/style.css"/>
            </head>

            <body>
                <h1>Schiele Edition</h1>

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
        <xsl:choose>
            <xsl:when test="@ref">
                <a href="{@ref}" class="person">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <span class="person">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Orte -->
    <xsl:template match="tei:placeName">
        <xsl:choose>
            <xsl:when test="@ref">
                <a href="{@ref}" class="place">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <span class="place">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Organisationen -->
    <xsl:template match="tei:orgName">
        <xsl:choose>
            <xsl:when test="@ref">
                <a href="{@ref}" class="org">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <span class="org">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Werke -->
    <xsl:template match="tei:objectName">
        <xsl:choose>
            <xsl:when test="@ref">
                <a href="{@ref}" class="work">
                    <xsl:apply-templates/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <span class="work">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Nur für Werksverzeichnis -->
    <xsl:template match="tei:objectIdentifier/tei:objectName">
        <span class="work-title">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="tei:div[@type = 'address'][@rend = 'allcaps']">
        <div class="postcard-address-uppercase">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:div">
        <div class="{@type}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:listObject">
        <div class="works">
            <xsl:apply-templates select="tei:object"/>
        </div>
    </xsl:template>

    <xsl:template match="tei:object">
        <div class="work" id="{@xml:id}">

            <h2>
                <xsl:apply-templates select="tei:objectIdentifier/tei:objectName[1]"/>
            </h2>

            <xsl:if test="tei:objectIdentifier/tei:objectName[@type = 'alt']">
                <p> (<xsl:value-of select="tei:objectIdentifier/tei:objectName[@type = 'alt']"/>)
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
    
    <xsl:template match="tei:list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:list[@type='sublist']">
        <div class="sublist">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:note[@type='grouping']">
        <div class="group-note">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Briefe -->
    <xsl:template match="tei:div[@type='letter']">
        <div class="letter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <hr/>
    </xsl:template>
    
    <xsl:template match="tei:opener">
        <div class="opener">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:closer">
        <div class="closer">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:salute">
        <p class="salute">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:signed">
        <p class="signed">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:dateline">
        <p class="dateline">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend='allcaps']">
        <span class="allcaps">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- Brief Roessler -->
    <xsl:template match="tei:add">
        <span class="add">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <hr class="pagebreak"/>
    </xsl:template>
    
    <!-- Brief Reichel -->
    <xsl:template match="tei:note">
        <span class="note">
            (<xsl:apply-templates/>)
        </span>
    </xsl:template>
    
    
    <xsl:template match="tei:div[@type='postscript']">
        <div class="postscript">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Visitenkarte -->
    <xsl:template match="tei:pb">
        <span class="pagebreak">[Seite <xsl:value-of select="@n"/>]</span>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='businesscard']">
        <div class="visitenkarte">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:seg[@type='printed']">
        <span class="printed">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>

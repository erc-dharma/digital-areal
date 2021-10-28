<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- Written by Axelle Janiak for ERC-DHARMA, 2021-10-19 -->
    <xsl:output method="html" indent="yes"/>
    
    <!-- Identity template -->
    <xsl:template match="@* | text() | comment()" mode="copy">
        <xsl:copy/>
    </xsl:template>
    
    <!-- lb-->
    <xsl:template match="tei:lb">
        <xsl:element name="span">
            <xsl:attribute name="class">text-muted lineation</xsl:attribute>
            <xsl:value-of select="@n"/>
        </xsl:element>
    </xsl:template>
    
    <!--  lg ! -->
    <xsl:template match="tei:lg">
        <xsl:element name="div">
            <xsl:attribute name="class">row mt-2</xsl:attribute>
            <xsl:element name="div">
                <xsl:attribute name="class">col text-col</xsl:attribute>
                <xsl:element name="div">
                    <xsl:attribute name="class">
                        <xsl:text>lg</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:element>     
        </xsl:element>
    </xsl:template>
    
    <!-- front -->
   <xsl:template match="tei:front"/>
    
    
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- Written by Axelle Janiak for ERC-DHARMA, 2021-10-19 -->
    <xsl:output method="html" indent="no"/>
    
    <!-- Identity template -->
    <xsl:template match="@* | text() | comment()" mode="copy">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="/tei:TEI">
        <xsl:element name="html">
            <xsl:call-template name="dharma-head"/>
            <xsl:element name="body">
                <xsl:attribute name="class">font-weight-light</xsl:attribute>
                <xsl:element name="div">
                    <xsl:attribute name="class">container</xsl:attribute>
                    <xsl:apply-templates select="./tei:teiHeader"/>
                    <xsl:apply-templates select="./tei:text"/>                    
                </xsl:element>
                <xsl:element name="footer">
                    <xsl:attribute name="class">footer mt-auto py-3</xsl:attribute>
                    <xsl:element name="div">
                        <xsl:value-of select="replace(//tei:fileDesc/tei:publicationStmt//tei:licence/tei:p[2], '\(c\)', '©')"/>
                    </xsl:element>
                </xsl:element>
                <xsl:call-template name="dharma-script"/>
            </xsl:element>  
        </xsl:element>
    </xsl:template>
    
    <!--  add ! -->
    <xsl:template match="tei:add">
        <xsl:element name="a">
            <xsl:attribute name="class">ed-insertion</xsl:attribute>
            <xsl:attribute name="href">javascript:void(0);</xsl:attribute>
            <xsl:attribute name="data-toggle">tooltip</xsl:attribute>
            <xsl:attribute name="data-placement">top</xsl:attribute>
            <xsl:attribute name="title">
                <xsl:element name="span">
                    <xsl:attribute name="class">font-italic</xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="@place='above'">
                            <xsl:text>suprascr.</xsl:text>
                        </xsl:when>
                        <xsl:when test="@place='below'">
                            <xsl:text>subscr.</xsl:text>
                        </xsl:when>
                        <xsl:when test="@place='right' or @place='left'">
                            <xsl:text>in mg.</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>.</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- back -->
    <xsl:template match="tei:back">
        <xsl:element name="h1">Front</xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!--  del ! -->
    <xsl:template match="tei:del">
        <xsl:element name="a">
            <xsl:attribute name="class">ed-deletion</xsl:attribute>
            <xsl:attribute name="href">javascript:void(0);</xsl:attribute>
            <xsl:attribute name="data-toggle">tooltip</xsl:attribute>
            <xsl:attribute name="data-placement">top</xsl:attribute>
            <xsl:attribute name="title">Editorial deletion.</xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">scribe-deletion</xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!--  F ! -->
    <!--  foreign ! -->
    <xsl:template match="tei:foreign">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>translit </xsl:text>
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
            <xsl:attribute name="class">font-italic</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- front -->
    <xsl:template match="tei:front">
        <xsl:element name="h1">Front</xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!--  fw ! -->
    <xsl:template match="tei:fw">
        <xsl:element name="span">
            <xsl:attribute name="class">text-muted form-work</xsl:attribute>
            <xsl:text>fw </xsl:text>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--  H ! -->
    <!--  head ! -->
    <xsl:template match="tei:head">
        <xsl:element name="p">
            <xsl:attribute name="class">font-weight-bold</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!--  hi ! -->
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='superscript'">
                <xsl:element name="sup">
                    <xsl:attribute name="class">ed-siglum</xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@rend='subscript'">
                <xsl:element name="sub">
                    <xsl:attribute name="class">ed-siglum</xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@rend='italic'">
                <xsl:element name="span">
                    <xsl:attribute name="class">font-italic</xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!--  l ! -->
    <xsl:template match="tei:l">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>vers</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
        <br/>
    </xsl:template>
    
    <!-- lb-->
    <xsl:template match="tei:lb">
        <xsl:element name="span">
            <xsl:attribute name="class">text-muted</xsl:attribute>
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
    
    <!--  List -->
    <xsl:template match="tei:list">
        <xsl:element name="ul">
            <xsl:attribute name="class">list-unstyle</xsl:attribute>
            <xsl:for-each select="child::tei:item">
                <xsl:element name="li">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:for-each>
            
        </xsl:element>
    </xsl:template>
    
    <!--  pb ! -->
    <xsl:template match="tei:pb">
        <xsl:element name="span">
            <xsl:attribute name="class">text-muted</xsl:attribute>
            <xsl:text>Folio </xsl:text>
            <xsl:value-of select="@n"/>
        </xsl:element>
    </xsl:template>
    
    <!--  Q ! -->
    <!--  q ! -->
    <xsl:template match="tei:q">
        <xsl:choose>
            <xsl:when test="@rend='block'">
                <xsl:element name="span">
                    <xsl:attribute name="class">block</xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>‘</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>’</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!--  quote ! -->
    <xsl:template match="tei:quote">
        <xsl:choose>
            <xsl:when test="@rend='block'">
                <xsl:element name="span">
                    <xsl:attribute name="class">block</xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>“</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>”</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--  sp ! -->
    <xsl:template match="tei:sp">
        <xsl:element name="div">
            <xsl:attribute name="class">row sp</xsl:attribute>
            <xsl:element name="div">
                <xsl:attribute name="class">col-sm-3</xsl:attribute>
                <xsl:apply-templates mode="bypass" select="tei:speaker"/>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">col-sm-9</xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <!--  speaker ! -->
    <xsl:template match="tei:speaker"/>
    <xsl:template match="tei:speaker" mode="bypass">
        <xsl:element name="span">
            <xsl:attribute name="class">speaker san</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!--  stage ! -->
    <!--  case one: it is not contained within a character’s
       lines ! -->
    <xsl:template match="tei:stage[not(ancestor::tei:sp)]">
        <xsl:element name="div">
            <xsl:attribute name="class">row</xsl:attribute>
            <xsl:element name="div">
                <xsl:attribute name="class">col-sm-12 clearfix</xsl:attribute>
                <xsl:element name="p">
                    <xsl:attribute name="class">
                        <xsl:text>stage san text-center</xsl:text>
                        <xsl:if test="@type = 'division'"> stage-division</xsl:if>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!--  case two: it is contained within a characters’ lines ! -->
    <xsl:template match="tei:sp//tei:stage">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>stage san stage-sp</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!--  teiHeader ! -->
    <xsl:template match="tei:teiHeader">
        <xsl:element name="div">
            <xsl:attribute name="class">row</xsl:attribute>
            <xsl:element name="div">
                <xsl:attribute name="class">col text-center my-5</xsl:attribute>
                <xsl:element name="h1">
                    <xsl:attribute name="class">display-5</xsl:attribute>
                    <xsl:value-of select="./tei:fileDesc/tei:titleStmt/tei:title[@type='main']"/>
                </xsl:element>
                <xsl:element name="h2">
                    <xsl:attribute name="class">display-5</xsl:attribute>
                    <xsl:value-of select="./tei:fileDesc/tei:titleStmt/tei:title[@type='sub']"/>
                </xsl:element>
                <xsl:if test="tei:fileDesc/tei:titleStmt/tei:author">
                    <xsl:element name="p">
                        <xsl:attribute name="class">mb-3</xsl:attribute>
                    </xsl:element>
                    <xsl:element name="h1">
                        <xsl:attribute name="class">display-6</xsl:attribute>
                        <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:author"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="tei:fileDesc/tei:titleStmt/tei:editor">
                    <xsl:element name="h1">
                        <xsl:attribute name="class">display-6</xsl:attribute>
                        <xsl:for-each select="tei:fileDesc/tei:titleStmt/tei:editor">
                            <xsl:choose>
                                <xsl:when test="position()= 1">
                                    <xsl:text>Edited by </xsl:text>
                                </xsl:when>
                                <xsl:when test="position()=last()">
                                    <xsl:text> &amp; </xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>, </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:apply-templates select="normalize-space(.)"/>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="not(tei:fileDesc/tei:titleStmt/tei:editor)">
                    <xsl:element name="h1">
                        <xsl:attribute name="class">display-6</xsl:attribute>
                        <xsl:for-each select="tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName">
                            <xsl:choose>
                                <xsl:when test="position()= 1">
                                    <xsl:text>Edited by </xsl:text>
                                </xsl:when>
                                <xsl:when test="position()=last()">
                                    <xsl:text> &amp; </xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>, </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:apply-templates select="normalize-space(.)"/>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:if>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <!--  text ! -->
    <xsl:template match="tei:text">
        <xsl:element name="div">
            <xsl:attribute name="class">row</xsl:attribute>
            <xsl:element name="div">
                <xsl:attribute name="class">col mx-5</xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- Templates nommés -->
    <!-- DHARMA html prolog -->
    <xsl:template name="dharma-head">
        <xsl:variable name="title">
            <xsl:if test="//tei:titleStmt/tei:title/text()">
                <xsl:if test="//tei:idno[@type='filename']/text()">
                    <xsl:value-of select="//tei:idno[@type='filename']"/>
                    <xsl:text>. </xsl:text>
                </xsl:if>
                <xsl:value-of select="//tei:titleStmt/tei:title"/>
            </xsl:if>
        </xsl:variable>
        <head>
            <title>
                <xsl:value-of select="$title"/>
            </title>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <!-- Bootstrap CSS -->
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"></link>
            </meta>
        </head>
    </xsl:template>

    <!-- scripts  -->
    <xsl:template name="dharma-script">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
    </xsl:template>
    
    <!-- Metadata tab -->
    <xsl:template name="tab-metadata">
        <xsl:element name="div">
            <xsl:attribute name="class">tab-pane fade</xsl:attribute>
            <xsl:attribute name="id">metadata</xsl:attribute>
            <xsl:attribute name="role">tabpanel</xsl:attribute>
            <xsl:attribute name="aria-labelledby">metadata-tab</xsl:attribute> 
            <xsl:element name="h4">Metadata of the Edition</xsl:element>
            <xsl:element name="ul">
                <xsl:element name="li">
                    <xsl:element name="b">
                        <xsl:text>Title</xsl:text>
                    </xsl:element>
                    <xsl:text>: </xsl:text>
                    <xsl:apply-templates select="//tei:title[@type='main']"/>
                    <xsl:text>. </xsl:text>
                    <xsl:apply-templates select="//tei:title[@type='sub']"/>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:element name="b">
                        <xsl:text>Text Identifier</xsl:text>
                    </xsl:element>
                    <xsl:text>: </xsl:text>
                    <xsl:value-of select="//tei:idno[@type='filename']"/>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:choose>
                        <xsl:when test="//tei:titleStmt[1]/tei:editor">
                            <xsl:for-each select="//tei:titleStmt[1]/tei:editor">
                                <xsl:choose>
                                    <xsl:when test="position()= 1">
                                        <xsl:element name="b">
                                            <xsl:text>Edited by </xsl:text>
                                        </xsl:element>                                  
                                    </xsl:when>
                                    <xsl:when test="position()=last()">
                                        <xsl:text> &amp; </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>, </xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates select="normalize-space(.)"/>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="not(//tei:titleStmt[1]/tei:editor)">
                            <xsl:for-each select="//tei:titleStmt[1]/tei:respStmt/tei:persName">
                                <xsl:choose>
                                    <xsl:when test="position()= 1">
                                        <xsl:element name="b">
                                            <xsl:text>Edited by </xsl:text>
                                        </xsl:element>                                  
                                    </xsl:when>
                                    <xsl:when test="position()=last()">
                                        <xsl:text> &amp; </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>, </xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates select="normalize-space(.)"/>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:value-of select="replace(//tei:fileDesc/tei:publicationStmt//tei:licence/tei:p[2], '\(c\)', '©')"/>
                </xsl:element>
            </xsl:element>
            <xsl:if test="//tei:projectDesc/tei:p"> 
                <xsl:apply-templates select="//tei:projectDesc/tei:p"/>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
    
</xsl:stylesheet>
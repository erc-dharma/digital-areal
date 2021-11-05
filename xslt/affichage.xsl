<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- Written by Axelle Janiak for ERC-DHARMA, 2021-11 -->
    <xsl:output method="html" indent="no"/>
    
    <!-- Identity template -->
    <xsl:template match="@* | text() | comment()" mode="copy">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="/tei:TEI">
        <xsl:element name="html">
            <xsl:call-template name="fable-head"/>
            <xsl:element name="body">
                <xsl:attribute name="class">font-weight-light</xsl:attribute>
                <xsl:apply-templates select="./tei:teiHeader"/>
                <xsl:call-template name="table"/>
                <xsl:element name="div">
                    <xsl:attribute name="class">container</xsl:attribute>
                    <xsl:apply-templates select="./tei:text"/>   
                    <xsl:apply-templates select="//tei:note | //tei:choice[child::tei:sic and child::tei:corr] | //tei:choice[child::tei:orig and child::tei:reg] | //tei:choice[child::tei:unclear]" mode="modals"/> 
                </xsl:element>
                <xsl:element name="footer">
                    <xsl:attribute name="class">footer mt-auto py-3</xsl:attribute>
                    <xsl:element name="div">
                        <xsl:value-of select="replace(//tei:fileDesc/tei:publicationStmt//tei:licence/tei:p[2], '\(c\)', '©')"/>
                    </xsl:element>
                </xsl:element>
                <xsl:call-template name="fable-script"/>
            </xsl:element>  
        </xsl:element>
    </xsl:template>
    
    <!--  add ! -->
    <xsl:template match="tei:add">
        <xsl:element name="a">
            <xsl:attribute name="class">ed-insertion</xsl:attribute>
            <xsl:attribute name="data-toggle">tooltip</xsl:attribute>
            <xsl:attribute name="data-placement">top</xsl:attribute>
            <xsl:attribute name="title">
                <xsl:element name="span">
                    <xsl:attribute name="class">font-italic</xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="@place='above'">
                            <xsl:text>Ajout de l'auteur au-dessus de la ligne</xsl:text>
                        </xsl:when>
                        <xsl:when test="@place='below'">
                            <xsl:text>Ajout de l'auteur sous la ligne</xsl:text>
                        </xsl:when>
                        <xsl:when test="@place='right' or @place='left'">
                            <xsl:text>Ajout de l'auteur en marge</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>Ajout de l'auteur</xsl:text>
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
    
    <!-- byline -->
    <xsl:template match="tei:byline">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--  C ! -->
    <!-- c -->
    <xsl:template match="tei:c">
        <xsl:element name="span">
            <xsl:attribute name="class">initial</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--  choice ! -->
    <xsl:template match="tei:choice[child::tei:orig and child::tei:reg]">
        <xsl:variable name="app-num">
            <xsl:value-of select="name()"/>
            <xsl:number level="any" format="0001"/>
        </xsl:variable>
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates select="child::tei:reg"/>
        </xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="class">tooltipApp orig-reg</xsl:attribute>
            <xsl:element name="a">
                <xsl:attribute name="tabindex">0</xsl:attribute>
                <xsl:attribute name="data-toggle">popover</xsl:attribute>
                <xsl:attribute name="data-html">true</xsl:attribute>
                <xsl:attribute name="data-target">
                    <xsl:value-of select="generate-id()"/>
                </xsl:attribute>
                <xsl:attribute name="href"><xsl:text>#to-app-</xsl:text>
                    <xsl:value-of select="$app-num"/></xsl:attribute>
                <xsl:attribute name="title">Note <xsl:number level="any" count="//tei:choice[child::tei:orig and child::tei:reg] | //tei:note | .//tei:choice[child::tei:sic and child::tei:corr] | //tei:choice[child::tei:unclear]"/></xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:text>from-app-</xsl:text>
                    <xsl:value-of select="$app-num"/>
                </xsl:attribute>
                <xsl:element name="sup">
                <xsl:text>(</xsl:text>
                    <xsl:number level="any" count="//tei:choice[child::tei:orig and child::tei:reg] | //tei:note | .//tei:choice[child::tei:sic and child::tei:corr] | //tei:choice[child::tei:unclear]"/>
                <xsl:text>)</xsl:text>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:choice[child::tei:orig and child::tei:reg]" mode="modals">
        <xsl:variable name="apparatus">
            <xsl:element name="span">
                <xsl:element name="span">
                    <xsl:attribute name="class">mb-1 lemma-line</xsl:attribute>
                    <xsl:element name="span">
                        <xsl:attribute name="class">app-orig</xsl:attribute>
                        <xsl:apply-templates select="child::tei:orig"/>
                        <xsl:text> (orig)</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:variable>
        <span class="popover-content d-none" id="{generate-id()}">
            <xsl:copy-of select="$apparatus"/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:choice[child::tei:sic and child::tei:corr]">
        <xsl:param name="location"/>
        <xsl:variable name="app-num">
            <xsl:value-of select="name()"/>
            <xsl:number level="any" format="0001"/>
        </xsl:variable>
        <xsl:element name="span"> 
            <xsl:attribute name="class">corr</xsl:attribute>
            <xsl:apply-templates select="tei:corr"/>
        </xsl:element>
            <xsl:element name="span">
                <xsl:attribute name="class">tooltipApp sic-corr</xsl:attribute>
                <xsl:element name="a">
                    <xsl:attribute name="tabindex">0</xsl:attribute>
                    <xsl:attribute name="data-toggle">popover</xsl:attribute>
                    <xsl:attribute name="data-html">true</xsl:attribute>
                    <xsl:attribute name="data-target">
                        <xsl:value-of select="generate-id()"/>
                    </xsl:attribute>
                    <xsl:attribute name="href"><xsl:text>#to-app-</xsl:text>
                        <xsl:value-of select="$app-num"/></xsl:attribute>
                    <xsl:attribute name="title">Note <xsl:number level="any" count="//tei:choice[child::tei:orig and child::tei:reg] | //tei:note | //tei:choice[child::tei:sic and child::tei:corr] | //tei:choice[child::tei:unclear]"/></xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:text>from-app-</xsl:text>
                        <xsl:value-of select="$app-num"/>
                    </xsl:attribute>
                    <xsl:element name="sup">
                        <xsl:text>(</xsl:text>
                        <xsl:number level="any" count="//tei:choice[child::tei:orig and child::tei:reg] | //tei:note | //tei:choice[child::tei:sic and child::tei:corr] | //tei:choice[child::tei:unclear]"/>
                        <xsl:text>)</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:choice[child::tei:sic and child::tei:corr]" mode="modals">
        <xsl:variable name="apparatus">
            <xsl:element name="span">
                <xsl:element name="span">
                    <xsl:attribute name="class">mb-1 lemma-line</xsl:attribute>
                    <xsl:element name="span">
                        <xsl:attribute name="class">app-sic</xsl:attribute>
                        <xsl:apply-templates select="child::tei:sic"/>
                        <xsl:text> (</xsl:text>
                        <xsl:element name="span">
                            <xsl:attribute name="class">font-italic</xsl:attribute>
                            <xsl:value-of select="child::tei:sic/name()"/>
                        </xsl:element>
                        <xsl:text>)</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:variable>
        <span class="popover-content d-none" id="{generate-id()}">
            <xsl:copy-of select="$apparatus"/>
        </span>
    </xsl:template>
    
    <!-- choice with two unclears -->
    <xsl:template match="tei:choice[child::tei:unclear]">
        <xsl:param name="location"/>
        <xsl:variable name="app-num">
            <xsl:value-of select="name()"/>
            <xsl:number level="any" format="0001"/>
        </xsl:variable>
        <xsl:element name="span"> 
            <xsl:attribute name="class">unclear</xsl:attribute>
            <xsl:apply-templates select="child::tei:unclear[1]"/>
        </xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="class">tooltipApp</xsl:attribute>
            <xsl:element name="a">
                <xsl:attribute name="tabindex">0</xsl:attribute>
                <xsl:attribute name="data-toggle">popover</xsl:attribute>
                <xsl:attribute name="data-html">true</xsl:attribute>
                <xsl:attribute name="data-target">
                    <xsl:value-of select="generate-id()"/>
                </xsl:attribute>
                <xsl:attribute name="href"><xsl:text>#to-app-</xsl:text>
                    <xsl:value-of select="$app-num"/></xsl:attribute>
                <xsl:attribute name="title">Note <xsl:number level="any" count="//tei:choice[child::tei:orig and child::tei:reg] | //tei:note | //tei:choice[child::tei:sic and child::tei:corr] | //tei:choice[child::tei:unclear]"/></xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:text>from-app-</xsl:text>
                    <xsl:value-of select="$app-num"/>
                </xsl:attribute>
                <xsl:element name="sup">
                    <xsl:text>(</xsl:text>
                    <xsl:number level="any" count="//tei:choice[child::tei:orig and child::tei:reg] | //tei:note | //tei:choice[child::tei:sic and child::tei:corr] | //tei:choice[child::tei:unclear]"/>
                    <xsl:text>)</xsl:text>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:choice[child::tei:unclear]" mode="modals">
        <xsl:variable name="apparatus">
            <xsl:element name="span">
                <xsl:element name="span">
                    <xsl:attribute name="class">mb-1 lemma-line</xsl:attribute>
                    <xsl:element name="span">
                        <xsl:attribute name="class">app-unclear</xsl:attribute>
                        <xsl:apply-templates select="child::tei:unclear[2]"/>
                        <xsl:text> (lecture alternative)</xsl:text>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:variable>
        <span class="popover-content d-none" id="{generate-id()}">
            <xsl:copy-of select="$apparatus"/>
        </span>
    </xsl:template>
    
    <!--  del ! -->
    <xsl:template match="tei:del">
        <xsl:element name="a">
            <xsl:attribute name="class">ed-deletion</xsl:attribute>
            <xsl:attribute name="data-toggle">tooltip</xsl:attribute>
            <xsl:attribute name="data-placement">top</xsl:attribute>
            <xsl:attribute name="title">Suppression</xsl:attribute>
            <xsl:element name="span">
                <xsl:attribute name="class">scribe-deletion</xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- div -->
    <xsl:template match="tei:div[@type='fable']">
        <xsl:element name="div">
            <xsl:attribute name="class">row</xsl:attribute>
        <xsl:element name="div">
            <xsl:attribute name="class">col-1</xsl:attribute>
            <xsl:if test="@type">
                <xsl:value-of select="@type"/>
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:if test="@n">
                <xsl:value-of select="@n"/>
            </xsl:if>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="class">col-5 text-center</xsl:attribute>
            <xsl:apply-templates select="node() except tei:pb"/>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="class">col-6</xsl:attribute>
            <xsl:call-template name="facsimiles"/>
        </xsl:element>
        </xsl:element>
        <xsl:if test="./following-sibling::tei:div[@type='fable']">
            <xsl:element name="hr"/>
        </xsl:if>
    </xsl:template>
    
    <!-- docAuthor -->
    <xsl:template match="tei:docAuthor">
        <xsl:element name="span">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- docImprint -->
    <xsl:template match="tei:docImprint">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!--  F ! -->
    <!-- figure -->
    <xsl:template match="tei:figure">
        <xsl:element name="div">
            <xsl:apply-templates select="tei:graphic"/>
            <xsl:if test="child::tei:desc">
                <xsl:element name="p">
                    <xsl:attribute name="class">font-italic</xsl:attribute>
                    <xsl:apply-templates select="child::tei:desc"/>
                </xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
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
        <xsl:element name="div">
            <xsl:attribute name="class">row</xsl:attribute>
            <xsl:element name="div">
                <xsl:attribute name="class">col-1</xsl:attribute>
                <xsl:text>page de titre</xsl:text>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">col-5</xsl:attribute>
                <xsl:apply-templates select="tei:titlePage/child::*"/>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">col-6</xsl:attribute>
                <xsl:if test="tei:titlePage/@facs">
                    <xsl:element name="img">
                        <xsl:attribute name="src">
                            <xsl:value-of select="tei:titlePage/@facs"/>
                        </xsl:attribute>
                        <xsl:attribute name="class">
                            <xsl:text>img-fluid</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:text>Image de la page </xsl:text>
                            <xsl:value-of select="@n"/>
                            <xsl:text> de l'édition de la Fontaine</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:if>
            </xsl:element>
        </xsl:element>
        <xsl:element name="hr"/>
    </xsl:template>
    
    <!--  fw ! -->
    <xsl:template match="tei:fw">
        <xsl:element name="p">
            <xsl:attribute name="class">text-muted form-work
            <xsl:choose>
                <xsl:when test="@place='top-left'">
                    <xsl:text> float-left</xsl:text>
                </xsl:when>
                <xsl:when test="@place='top-center'">
                    <xsl:text> text-center</xsl:text>
                </xsl:when>
                <xsl:when test="@place='top-right'">
                    <xsl:text> float-right</xsl:text>
                </xsl:when>
                <xsl:when test="@place='bot-right'">
                    <xsl:text> text-right</xsl:text>
                </xsl:when>
            </xsl:choose>
                <xsl:if test="@type='head'">
                    <xsl:text> font-weight-bold header</xsl:text>
                </xsl:if>
                <xsl:if test="@type='sig'">
                    <xsl:text> font-italic sig</xsl:text>
                </xsl:if>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--  G !  -->
    <!-- g -->
    <xsl:template match="tei:g">
        <xsl:element name="span">
            <xsl:attribute name="class">symbol</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- gap  -->
    <xsl:template match="tei:gap">
        <xsl:choose>
            <xsl:when test="@reason='omitted'"/>
            <xsl:when test="@reason='lost' and not(@quantity or @unity)"/>
            <xsl:otherwise>
                <xsl:element name="span">
                    <xsl:attribute name="class">gap</xsl:attribute>
                    <xsl:choose> 
                        <xsl:when test="@quantity and @unit">
                            <xsl:if test="@precision='low'">
                                <xsl:text>ca. </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="@quantity"/>
                            <xsl:if test="@unit='character'">
                                <xsl:choose>
                                    <xsl:when test="@reason='lost'">
                                        <xsl:text>+</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@reason='illegible'">
                                        <xsl:text>×</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@reason='undefined'">
                                        <xsl:text>*</xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:if> 
                        </xsl:when>
                        <xsl:when test="@extent">
                            <xsl:text>...</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>...</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>         
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- graphic -->
    <xsl:template match="tei:graphic">
        <xsl:choose>
            <xsl:when test="@url">
                <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:text>img-fluid</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:text>Image de la page </xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:text> de l'édition de la Fontaine</xsl:text>
            </xsl:attribute>
        </xsl:element>
            </xsl:when>
                <xsl:otherwise>
                    <xsl:element name="span">
                    <xsl:text>Emplacement d'une image</xsl:text>
                    </xsl:element>
                </xsl:otherwise>            
        </xsl:choose>
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
    
    <!-- imprimatur -->
    <xsl:template match="tei:imprimatur">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <!--  l ! -->
    <xsl:template match="tei:l">
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>vers</xsl:text>
            </xsl:attribute>
           <!-- <xsl:element name="sup">
                <xsl:attribute name="class">text-muted float-left</xsl:attribute>
                <xsl:value-of select="@n"/>
            </xsl:element>-->
            <xsl:apply-templates/>
        </xsl:element>
        <br/>
    </xsl:template>
    
    <!-- lb-->
   <!--<xsl:template match="tei:lb">
        <xsl:element name="span">
            <xsl:attribute name="class">text-muted lineation</xsl:attribute>
            <xsl:value-of select="@n"/>
        </xsl:element>
    </xsl:template>-->
    
    <!--  lg ! -->
    <xsl:template match="tei:lg">
          <xsl:element name="div">
              <xsl:attribute name="class">lg  text-center</xsl:attribute>
                    <xsl:apply-templates/>
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
    <xsl:template name="facsimiles">
            <xsl:for-each select="//tei:pb">
                <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="@facs"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>img-fluid</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:text>Image de la page </xsl:text>
                    <xsl:value-of select="@n"/>
                    <xsl:text> de l'édition de la Fontaine</xsl:text>
                </xsl:attribute>
            </xsl:element>
            </xsl:for-each>
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
    <!--  R ! -->
    <xsl:template match="tei:ref">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
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
    
    <!-- space ! -->
    <!-- transformation à mettre à jour -->
    <xsl:template match="tei:space">
         <xsl:text>_SPACE_</xsl:text>
    </xsl:template>
    
    <!--  subst ! -->
    <xsl:template match="tei:subst">
        <xsl:element name="span">
            <xsl:attribute name="class">ed-insertion</xsl:attribute>
            <xsl:apply-templates select="child::tei:del"/>
            <xsl:value-of select="child::tei:add"/>
        </xsl:element>
    </xsl:template>
    <!--  supplied ! -->
    <xsl:template match="tei:supplied">
        <xsl:element name="span">
            <xsl:attribute name="class">text-muted supplied</xsl:attribute>
            <xsl:attribute name="href">javascript:void(0);</xsl:attribute>
            <xsl:attribute name="data-toggle">tooltip</xsl:attribute>
            <xsl:attribute name="data-placement">top</xsl:attribute>
            <xsl:attribute name="title">Ajouté par l'éditeur.</xsl:attribute>
            <xsl:choose>
                <xsl:when test="@reason='omitted'">
                    <xsl:element name="span">
                        <xsl:attribute name="class">omitted</xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="@reason='lost' or @reason='illegible'">
                    <xsl:element name="span">
                        <xsl:attribute name="class">lost-illegible</xsl:attribute>
                        <xsl:apply-templates/>
                        <xsl:if test="@cert='low'">
                            <xsl:text>?</xsl:text>
                        </xsl:if>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="@reason='subaudible'">
                    <xsl:element name="span">
                        <xsl:attribute name="class">subaudible</xsl:attribute>
                        <xsl:apply-templates/>
                        <xsl:if test="@cert='low'">
                            <xsl:text>?</xsl:text>
                        </xsl:if>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="@reason='explanation'">
                    <xsl:element name="span">
                        <xsl:attribute name="class">explanation</xsl:attribute>
                        <xsl:apply-templates/>
                        <xsl:if test="@cert='low'">
                            <xsl:text>?</xsl:text>
                        </xsl:if>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    
    <!--  surplus ! -->
    <xsl:template match="tei:surplus">
        <xsl:element name="span">
            <xsl:attribute name="class">surplus</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--  teiHeader ! -->
    <xsl:template match="tei:teiHeader">
        <xsl:element name="div">
            <xsl:attribute name="class">row</xsl:attribute>
            <xsl:element name="div">
                <xsl:attribute name="class">col text-center my-5</xsl:attribute>
                <xsl:choose>
                    <xsl:when test="@*">
                        <xsl:element name="h1">
                            <xsl:attribute name="class">display-5</xsl:attribute>
                            <xsl:value-of select="./tei:fileDesc/tei:titleStmt/tei:title[@type='main']"/>
                        </xsl:element>
                        <xsl:element name="h2">
                            <xsl:attribute name="class">display-5</xsl:attribute>
                            <xsl:value-of select="./tei:fileDesc/tei:titleStmt/tei:title[@type='sub']"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="h1">
                            <xsl:attribute name="class">display-5</xsl:attribute>
                            <xsl:apply-templates select="./tei:fileDesc/tei:titleStmt/tei:title"/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
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
                                    <xsl:text>Édition réalisée par </xsl:text>
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
                                    <xsl:text>Édition réalisée par </xsl:text>
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
    
    <!--  term ! -->
    <xsl:template match="tei:term">
        <xsl:element name="span">
            <xsl:attribute name="class">term font-weight-bold</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--  title ! -->
    <xsl:template match="tei:title">
        <xsl:element name="span">
                    <xsl:attribute name="class">title font-italic</xsl:attribute>
                    <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- titlePart ! -->
   <xsl:template match="tei:titlePart">
            <xsl:element name="p">
                <xsl:apply-templates/>
            </xsl:element>
    </xsl:template>
        
    <!--  U ! -->
    <!--  unclear -->
    <xsl:template match="tei:unclear[not(parent::tei:choice)]">
        <xsl:element name="span">
            <xsl:attribute name="class">unclear</xsl:attribute>
            <xsl:apply-templates/>
            <xsl:if test="@cert='low'">
                <xsl:text>?</xsl:text>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
    <!--  W ! -->
    <xsl:template match="tei:w">
        <xsl:element name="span">
            <xsl:attribute name="class">word</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- Templates nommés -->
    <!-- DHARMA html prolog -->
    <xsl:template name="fable-head">
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
                <link rel="stylesheet" href="../assets/css/fable-style.css"></link>
            </meta>
        </head>
    </xsl:template>

    <!-- scripts  -->
    <xsl:template name="fable-script">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
        <script src="../assets/js/loader.js"></script>
    </xsl:template>
    
    <xsl:template name="tab-metadata">
        <xsl:element name="div">
            <xsl:attribute name="class">tab-pane fade</xsl:attribute>
            <xsl:attribute name="id">metadata</xsl:attribute>
            <xsl:attribute name="role">tabpanel</xsl:attribute>
            <xsl:attribute name="aria-labelledby">metadata-tab</xsl:attribute> 
            <xsl:element name="h4">Métadonnées de l'édition</xsl:element>
            <xsl:element name="ul">
                <xsl:element name="li">
                    <xsl:element name="b">
                        <xsl:text>Title</xsl:text>
                    </xsl:element>
                    <xsl:text>: </xsl:text>
                    <xsl:choose>
                        <xsl:when test="//tei:title/@*">
                        <xsl:apply-templates select="//tei:title[@type='main']"/>
                    <xsl:text>. </xsl:text>
                    <xsl:apply-templates select="//tei:title[@type='sub']"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="//tei:titleStmt/tei:title"/> 
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:element name="b">
                        <xsl:text>Identifiant du texte</xsl:text>
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
                                            <xsl:text>Édition réalisée par </xsl:text>
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
                                            <xsl:text>Édition réalisée par </xsl:text>
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
    
    <xsl:template name="tab-source">
        <xsl:element name="div">
            <xsl:attribute name="class">tab-pane active</xsl:attribute>
            <xsl:attribute name="id">witnesses</xsl:attribute>
            <xsl:attribute name="role">tabpanel</xsl:attribute>
            <xsl:attribute name="aria-labelledby">witnesses-tab</xsl:attribute>
            <xsl:element name="h4">Informations sur la source</xsl:element>
            <xsl:element name="ul">
                <xsl:if test="//tei:sourceDesc/tei:biblStruct//text()">
                    <xsl:element name="li">
                        <xsl:element name="b">
                            <xsl:text>Ouvrage</xsl:text>
                        </xsl:element>
                        <xsl:text>: </xsl:text>
                        <xsl:element name="ul">
                            <xsl:if test="//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title">
                                <xsl:element name="li">
                                    <xsl:element name="b">
                                        <xsl:text>Titre</xsl:text>
                                    </xsl:element>
                                    <xsl:text>: </xsl:text>
                                    <xsl:apply-templates select="//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title"/>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:author">
                                <xsl:element name="li">
                                    <xsl:element name="b">
                                        <xsl:text>Auteur</xsl:text>
                                    </xsl:element>
                                    <xsl:text>: </xsl:text>
                                    <xsl:apply-templates select="//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:author"/>
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint">
                                <xsl:element name="li">
                                    <xsl:element name="b">
                                        <xsl:text>Éditeur</xsl:text>
                                    </xsl:element>
                                    <xsl:text>: </xsl:text>
                                    <xsl:apply-templates select="//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:publisher"/>
                                    <xsl:text>, </xsl:text>
                                    <xsl:apply-templates select="//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:pubPlace"/>
                                    
                                </xsl:element>
                            </xsl:if>
                            <xsl:if test="//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:date">
                                <xsl:element name="li">
                                    <xsl:element name="b">
                                        <xsl:text>Date</xsl:text>
                                    </xsl:element>
                                    <xsl:text>: </xsl:text>
                                    <xsl:apply-templates select="//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:date"/>
                                </xsl:element>
                            </xsl:if>
                        </xsl:element>
                    </xsl:element> 
                </xsl:if>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="table">
        <xsl:element name="div">
            <xsl:attribute name="class">row wrapper</xsl:attribute>
            <xsl:element name="ul">
                <xsl:attribute name="class">nav nav-tabs nav-justified</xsl:attribute>
                <xsl:attribute name="id">tab</xsl:attribute>
                <xsl:attribute name="role">tablist</xsl:attribute>
                <xsl:element name="li">
                    <xsl:attribute name="class">nav-item</xsl:attribute>
                    <xsl:attribute name="role">presentation</xsl:attribute>
                    <xsl:element name="a">
                        <xsl:attribute name="class">nav-link active</xsl:attribute>
                        <xsl:attribute name="id">witnesses-tab</xsl:attribute>
                        <xsl:attribute name="data-toggle">tab</xsl:attribute>
                        <xsl:attribute name="href">#witnesses</xsl:attribute>
                        <xsl:attribute name="role">tab</xsl:attribute>
                        <xsl:attribute name="aria-controls">witnesses</xsl:attribute>
                        <xsl:attribute name="aria-selected">true</xsl:attribute>
                        <xsl:element name="div">
                            <xsl:attribute name="class">panel</xsl:attribute>
                            <xsl:text>Source</xsl:text>
                        </xsl:element>
                    </xsl:element> 
                </xsl:element>
                <xsl:element name="li">
                    <xsl:attribute name="class">nav-item</xsl:attribute>
                    <xsl:attribute name="role">presentation</xsl:attribute>
                    <xsl:element name="a">
                        <xsl:attribute name="class">nav-link</xsl:attribute>
                        <xsl:attribute name="id">metadata-tab</xsl:attribute>
                        <xsl:attribute name="data-toggle">tab</xsl:attribute>
                        <xsl:attribute name="href">#metadata</xsl:attribute>
                        <xsl:attribute name="role">tab</xsl:attribute>
                        <xsl:attribute name="aria-controls">metadata</xsl:attribute>
                        <xsl:attribute name="aria-selected">false</xsl:attribute>
                        <xsl:element name="div">
                            <xsl:attribute name="class">panel</xsl:attribute>
                            <xsl:text>Métadonnées</xsl:text>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>                     
            <xsl:element name="div">
                <xsl:attribute name="class">tab-content</xsl:attribute>
                <xsl:call-template name="tab-source"/>
                <xsl:call-template name="tab-metadata"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
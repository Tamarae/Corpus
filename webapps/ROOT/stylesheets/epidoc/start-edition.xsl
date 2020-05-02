<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Project-specific XSLT for transforming EpiDoc TEI to
       HTML. Customisations here override those in the core
       start-edition.xsl (which should not be changed). -->

  <xsl:import href="../../kiln/stylesheets/epidoc/start-edition.xsl" />
  <xsl:import href="htm-tpl-struct-iospe.xsl"/>



  <!-- <xsl:template match="tei:bibl">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template> -->
  
  <xsl:template match="tei:biblStruct//tei:author//tei:surname">
    <xsl:apply-templates />
    <xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:editor//tei:surname">
    <xsl:apply-templates />
    <xsl:text> (ed.), </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:forename">
    <xsl:apply-templates />
    <xsl:text> </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:title[@level='m']">
    <i>
      <xsl:apply-templates />
    </i>
    <xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:title[@level='j']">
    <i>
      <xsl:apply-templates />
    </i>
    <xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:title[@level='s']"><!-- without italic -->
      (<xsl:apply-templates />)
    <xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:title[@level='u']">
    <i>
      <xsl:apply-templates />
    </i>
    <xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:title[@level='a']"><!-- for articles in journals or book sections -->
    <i>
      <xsl:apply-templates />
    </i>
    <xsl:text>, in</xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:biblScope[@unit='volume']"><!-- for bibliography.xml; but if it indicates a subtitle with volume number, the subtitle too won't be in italic!!! -->
      <xsl:apply-templates />
    <xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:biblScope[@unit='issue']"><!-- for bibliography.xml;  -->
    <xsl:apply-templates />
    <xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:biblScope/@unit"><!-- for xml files -->
    <xsl:apply-templates />
    <xsl:text></xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:pubPlace">
    <xsl:apply-templates />
    <xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:publisher">
    <xsl:apply-templates />
    <xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct[@type='book']//tei:date">
    <xsl:apply-templates />
    <xsl:text/>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct[@type='bookSection']//tei:date">
    <xsl:apply-templates />
    <xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct[@type='journalArticle']//tei:date">
    <xsl:apply-templates />
    <xsl:text>, </xsl:text>
  </xsl:template>
  
  <xsl:template match="tei:biblStruct//tei:citedRange">
    <xsl:apply-templates />
    <xsl:text>.</xsl:text>
  </xsl:template>
  
</xsl:stylesheet>

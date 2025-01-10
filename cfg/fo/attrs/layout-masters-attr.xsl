<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
   <xsl:attribute-set name="region-body.odd">
      <xsl:attribute name="column-count">1</xsl:attribute>
      <xsl:attribute name="column-gap">12pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="region-body.even">
      <xsl:attribute name="column-count">1</xsl:attribute>
      <xsl:attribute name="column-gap">12pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="region-bodyfrontmatter.odd">
      <xsl:attribute name="column-count">1</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="region-bodyfrontmatter.even">
      <xsl:attribute name="column-count">1</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="region-bodyindex.odd">
      <xsl:attribute name="column-count">2</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="region-bodyindex.even">
      <xsl:attribute name="column-count">2</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="region-body__frontmatter.odd" use-attribute-sets="region-body.odd">
      <xsl:attribute name="margin-top">
         <xsl:value-of select="$page-margin-cover-top"/>
      </xsl:attribute>    
   </xsl:attribute-set>
   <xsl:attribute-set name="region-body__frontmatter.even" use-attribute-sets="region-body.even">
      <xsl:attribute name="margin-top">
         <xsl:value-of select="$page-margin-cover-top"/>
      </xsl:attribute>    
   </xsl:attribute-set>
   
   <!-- PA: landscape support -->
   <xsl:attribute-set name="landscape-page-master">
      <xsl:attribute name="page-width">
         <xsl:value-of select="$page-width-landscape"/>
      </xsl:attribute>
      <xsl:attribute name="page-height">
         <xsl:value-of select="$page-height-landscape"/>
      </xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="region-body.landscape">
      <xsl:attribute name="margin-top">
         <xsl:value-of select="$page-margin-top"/>
      </xsl:attribute>
      <xsl:attribute name="margin-bottom">
         <xsl:value-of select="$page-margin-bottom"/>
      </xsl:attribute>
      <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
         <xsl:value-of select="$page-margin-landscape"/>
      </xsl:attribute>
      <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
         <xsl:value-of select="$page-margin-landscape"/>
      </xsl:attribute>
   </xsl:attribute-set>
   <!-- end landscape support -->
   
</xsl:stylesheet>
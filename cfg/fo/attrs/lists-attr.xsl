<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
   xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf"
   xmlns:fo="http://www.w3.org/1999/XSL/Format"
   xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
   xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
   exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
   <xsl:attribute-set name="ol">
      <xsl:attribute name="provisional-distance-between-starts">
         <xsl:call-template name="e:list-label-length"/>
         <xsl:text>em * 0.7</xsl:text>
      </xsl:attribute>
   </xsl:attribute-set>
   
   <!-- exception attribute sets for unnested lists not in a table -->
   <xsl:attribute-set name="ol-first" use-attribute-sets="ol common.block">
      <xsl:attribute name="margin-left">15pt</xsl:attribute>
   </xsl:attribute-set>

   <!-- exception attribute sets for unnested lists not in a table -->
   <xsl:attribute-set name="ul-first" use-attribute-sets="ul common.block">
      <xsl:attribute name="margin-left">15pt</xsl:attribute>
   </xsl:attribute-set>

   <xsl:template name="e:list-label-length">
      <xsl:variable name="labels" as="xs:integer*">
         <xsl:variable name="depth"
            select="count(ancestor-or-self::*[contains(@class, ' topic/ol ')])"/>
         <xsl:variable name="format" as="xs:string">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="concat('Ordered List Format ', $depth)"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:for-each select="*[contains(@class, ' topic/li ')]">
            <xsl:variable name="s">
               <xsl:call-template name="getVariable">
                  <xsl:with-param name="id" select="concat('Ordered List Number ', $depth)"/>
                  <xsl:with-param name="params" as="element()*">
                     <number>
                        <xsl:number format="{$format}"/>
                     </number>
                  </xsl:with-param>
               </xsl:call-template>
            </xsl:variable>
            <xsl:sequence select="string-length(normalize-space($s))"/>
         </xsl:for-each>
      </xsl:variable>
      <xsl:sequence select="max($labels)"/>
   </xsl:template>
   

   

</xsl:stylesheet>

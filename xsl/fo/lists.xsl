<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
   <!--list-->
  
<!-- HPE customization for custom list bullets -->
   <xsl:template match="*[contains(@class, ' topic/ul ')]/*[contains(@class, ' topic/li ')]">
      <xsl:variable name="depth" select="count(ancestor::*[contains(@class, ' topic/ul ')])"/>
      <fo:list-item xsl:use-attribute-sets="ul.li">
         <fo:list-item-label xsl:use-attribute-sets="ul.li__label">
            <fo:block xsl:use-attribute-sets="ul.li__label__content">
               <fo:inline>
                  <xsl:call-template name="commonattributes"/>
               </fo:inline>
               <xsl:call-template name="getVariable">
                  <xsl:with-param name="id" select="concat('Unordered List bullet ', $depth)"/>
               </xsl:call-template>
            </fo:block>
         </fo:list-item-label>
         <fo:list-item-body xsl:use-attribute-sets="ul.li__body">
            <fo:block xsl:use-attribute-sets="ul.li__content">
               <xsl:apply-templates/>
            </fo:block>
         </fo:list-item-body>
      </fo:list-item>
   </xsl:template>
   <xsl:template match="*[contains(@class, ' topic/ol ')]/*[contains(@class, ' topic/li ')]">
      <xsl:variable name="depth" select="count(ancestor::*[contains(@class, ' topic/ol ')])"/>
      <xsl:variable name="format">
         <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="concat('Ordered List Format ', $depth)"/>
         </xsl:call-template>
      </xsl:variable>
      <fo:list-item xsl:use-attribute-sets="ol.li">
         <fo:list-item-label xsl:use-attribute-sets="ol.li__label">
            <fo:block xsl:use-attribute-sets="ol.li__label__content">
               <fo:inline>
                  <xsl:call-template name="commonattributes"/>
               </fo:inline>
               <xsl:call-template name="getVariable">
                  <xsl:with-param name="id" select="concat('Ordered List Number ', $depth)"/>
                  <xsl:with-param name="params" as="element()*">
                     <number>
                        <xsl:number format="{$format}"/>
                     </number>
                  </xsl:with-param>
               </xsl:call-template>
            </fo:block>
         </fo:list-item-label>
         <fo:list-item-body xsl:use-attribute-sets="ol.li__body">
            <fo:block xsl:use-attribute-sets="ol.li__content">
               <xsl:apply-templates/>
            </fo:block>
         </fo:list-item-body>
      </fo:list-item>
   </xsl:template> 
<!-- end of HPE customization -->
   
<!-- HPE customization to add list (ordered and bulleted) indentation when in the body -->
   <xsl:template match="*[contains(@class, ' topic/ul ')]">
      <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-startprop ')]" mode="outofline"/>
      <xsl:choose>
         <!-- keep indentation unchanged if this is a nested list -->
         <xsl:when test="ancestor::*[contains(@class, ' topic/ul ')]">
            <fo:list-block xsl:use-attribute-sets="ul">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:list-block>
         </xsl:when>
         <!-- keep indentation unchanged if this is a nested list -->
         <xsl:when test="ancestor::*[contains(@class, ' topic/ol ')]">
            <fo:list-block xsl:use-attribute-sets="ol">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:list-block>
         </xsl:when>
         <!-- keep indentation unchanged if this list is a table -->
         <xsl:when test="ancestor::*[contains(@class, ' topic/table ')]">
            <fo:list-block xsl:use-attribute-sets="ul">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:list-block>
         </xsl:when>         
         <!-- increase indentation if this a first-level list -->
         <xsl:otherwise>
            <fo:list-block xsl:use-attribute-sets="ul-first">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:list-block>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-endprop ')]" mode="outofline"/>
   </xsl:template>
   
   <xsl:template match="*[contains(@class, ' topic/ul ')][empty(*[contains(@class, ' topic/li ')])]" priority="10"/>
   
   <xsl:template match="*[contains(@class, ' topic/ol ')]">
      <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-startprop ')]" mode="outofline"/>
      <xsl:choose>
         <!-- keep indentation unchanged if this is a nested list -->
         <xsl:when test="ancestor::*[contains(@class, ' topic/ol ')]">
            <fo:list-block xsl:use-attribute-sets="ol">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:list-block>
         </xsl:when>
         <!-- keep indentation unchanged if this is a nested list -->
         <xsl:when test="ancestor::*[contains(@class, ' topic/ul ')]">
            <fo:list-block xsl:use-attribute-sets="ol">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:list-block>
         </xsl:when>         
         <!-- keep indentation unchanged if this list is a table -->
         <xsl:when test="ancestor::*[contains(@class, ' topic/table ')]">
            <fo:list-block xsl:use-attribute-sets="ol">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:list-block>
         </xsl:when>         
         <!-- increase indentation if this a first-level list -->
         <xsl:otherwise>
            <fo:list-block xsl:use-attribute-sets="ol-first">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:list-block>            
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-endprop ')]" mode="outofline"/>
   </xsl:template>
<!-- end of HPE customization -->
   
</xsl:stylesheet>
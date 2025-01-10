<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
   
   <!-- XML Exchange Table Model Document Type Definition default is all -->
   <xsl:variable name="table.frame-default" select="'none'"/>
   <!-- XML Exchange Table Model Document Type Definition default is 1 -->
   <xsl:variable name="table.rowsep-default" select="'1'"/>
   <!-- XML Exchange Table Model Document Type Definition default is 1 -->
   <xsl:variable name="table.colsep-default" select="'0'"/>
   
<!-- HPE customization but this template is stock generated code -->
   <xsl:template match="*[contains(@class, ' topic/table ')]/*[contains(@class, ' topic/title ')]" mode="table.title-number">
      <xsl:value-of select="count(key('enumerableByClass', 'topic/table')[. &lt;&lt; current()])"/>
   </xsl:template>
   <xsl:template match="*[contains(@class, ' topic/tbody ')]" name="topic.tbody">
      <fo:table-footer xsl:use-attribute-sets="tgroup.tfoot">
         <fo:table-row>
            <fo:table-cell number-columns-spanned="{../@cols}">
               <fo:block/>
            </fo:table-cell>
         </fo:table-row>
      </fo:table-footer>
      <fo:table-body xsl:use-attribute-sets="tgroup.tbody">
         <xsl:call-template name="commonattributes"/>
         <xsl:apply-templates/>
      </fo:table-body>
   </xsl:template>
<!-- end of HPE customization -->
   
<!-- HPE: enable custom column widths for definition lists -->
   <xsl:template match="*[contains(@class, ' topic/dl ')]">
      <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-startprop ')]" mode="outofline"/>
      <fo:table xsl:use-attribute-sets="dl">
      <!-- Add support for deflist column width specifications -->
         <xsl:call-template name="commonattributes"/>
         <fo:table-column xsl:use-attribute-sets="__dl__dt__column"/>
         <fo:table-column column-number="2" xsl:use-attribute-sets="__dl__dd__column"/>
      <!-- end of customization -->
         <xsl:apply-templates select="*[contains(@class, ' topic/dlhead ')]"/>
         <fo:table-body xsl:use-attribute-sets="dl__body">
            <xsl:choose>
               <xsl:when test="contains(@otherprops,'sortable')">
                  <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]">
                     <xsl:sort select="opentopic-func:getSortString(normalize-space( opentopic-func:fetchValueableText(*[contains(@class, ' topic/dt ')]) ))" lang="{$locale}"/>
                  </xsl:apply-templates>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]"/>
               </xsl:otherwise>
            </xsl:choose>
         </fo:table-body>
      </fo:table>
      <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-endprop ')]" mode="outofline"/>
   </xsl:template>
<!-- end of HPE customization -->
   
</xsl:stylesheet>
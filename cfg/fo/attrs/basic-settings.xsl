<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
   <xsl:param name="pdfFormatter" select="'fop'"/>
   <xsl:param name="tocMaximumLevel" select="5"/>
   <xsl:variable name="page-width">210mm</xsl:variable>
   <xsl:variable name="page-height">297mm</xsl:variable>
   <!-- PA: landscape support -->
    <xsl:variable name="page-height-landscape">210mm</xsl:variable>
    <xsl:variable name="page-width-landscape">297mm</xsl:variable>
    <xsl:variable name="page-margin-landscape">0.5in</xsl:variable>      
   <!-- end landscape support -->
   <xsl:variable name="mirror-page-margins" select="false()"/>
   <xsl:variable name="page-margin-top">1in</xsl:variable>
   <xsl:variable name="page-margin-cover-top">0.5in</xsl:variable>
   <xsl:variable name="page-margin-outside">0.5in</xsl:variable>
   <xsl:variable name="page-margin-bottom">1.0in</xsl:variable>
   <xsl:variable name="page-margin-inside">0.5in</xsl:variable>
   <xsl:variable name="default-font-size">10pt</xsl:variable>
   <xsl:variable name="default-line-height">12pt</xsl:variable>
   <xsl:variable name="side-col-width">0pt</xsl:variable>
</xsl:stylesheet>
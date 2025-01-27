<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
   <xsl:attribute-set name="codeblock">
      <xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
      <xsl:attribute name="border-after-color">black</xsl:attribute>
      <xsl:attribute name="border-after-style">none</xsl:attribute>
      <xsl:attribute name="border-after-width">1pt</xsl:attribute>
      <xsl:attribute name="border-before-color">black</xsl:attribute>
      <xsl:attribute name="border-before-style">none</xsl:attribute>
      <xsl:attribute name="border-before-width">1pt</xsl:attribute>
      <xsl:attribute name="border-end-color">black</xsl:attribute>
      <xsl:attribute name="border-end-style">none</xsl:attribute>
      <xsl:attribute name="border-end-width">1pt</xsl:attribute>
      <xsl:attribute name="border-start-color">black</xsl:attribute>
      <xsl:attribute name="border-start-style">none</xsl:attribute>
      <xsl:attribute name="border-start-width">1pt</xsl:attribute>
      <xsl:attribute name="color">black</xsl:attribute>
      <xsl:attribute name="font-family">Courier New</xsl:attribute>
      <xsl:attribute name="font-size">9pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
      <xsl:attribute name="line-height">11pt</xsl:attribute>
      <xsl:attribute name="margin-bottom">6pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">3pt</xsl:attribute>
      <xsl:attribute name="padding-left">3pt</xsl:attribute>
      <xsl:attribute name="padding-right">3pt</xsl:attribute>
      <xsl:attribute name="padding-top">3pt</xsl:attribute>
      <xsl:attribute name="space-after">6pt</xsl:attribute>
      <xsl:attribute name="space-before">3pt</xsl:attribute>
      <xsl:attribute name="start-indent">3pt + from-parent(start-indent)</xsl:attribute>
      <xsl:attribute name="end-indent">3pt + from-parent(end-indent)</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="codeph">
      <xsl:attribute name="font-family">Courier New</xsl:attribute>
      <xsl:attribute name="font-size">9pt</xsl:attribute>
   </xsl:attribute-set>

</xsl:stylesheet>
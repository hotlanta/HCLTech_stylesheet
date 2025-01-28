<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
   <xsl:attribute-set name="e:dl">
      <xsl:attribute name="background-color">transparent</xsl:attribute>
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
      <xsl:attribute name="end-indent">0pt</xsl:attribute>
      <xsl:attribute name="font-family">Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">6pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="e:dlentry.dt__content">
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="keep-with-next">always</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="e:dlentry.dd__content"/>
   <xsl:attribute-set name="table.tgroup">
      <xsl:attribute name="background-color">transparent</xsl:attribute>
      <xsl:attribute name="border-after-color">black</xsl:attribute>
      <xsl:attribute name="border-after-style">solid</xsl:attribute>
      <xsl:attribute name="border-after-width">1pt</xsl:attribute>
      <xsl:attribute name="border-before-color">black</xsl:attribute>
      <xsl:attribute name="border-before-style">solid</xsl:attribute>
      <xsl:attribute name="border-before-width">1pt</xsl:attribute>
      <xsl:attribute name="border-end-color">black</xsl:attribute>
      <xsl:attribute name="border-end-style">none</xsl:attribute>
      <xsl:attribute name="border-end-width">1pt</xsl:attribute>
      <xsl:attribute name="border-start-color">black</xsl:attribute>
      <xsl:attribute name="border-start-style">none</xsl:attribute>
      <xsl:attribute name="border-start-width">1pt</xsl:attribute>
      <xsl:attribute name="color">black</xsl:attribute>
      <xsl:attribute name="end-indent">0pt</xsl:attribute>
      <xsl:attribute name="font-family">Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">6pt</xsl:attribute>
      <xsl:attribute name="space-before">6pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   
   
   <!-- removed space-after conditionality for better aligned and more compact tables. -->
   <xsl:attribute-set name="common.table.body.entry">
      <xsl:attribute name="space-before">3pt</xsl:attribute>
      <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
      <xsl:attribute name="space-after">3pt</xsl:attribute>
      <xsl:attribute name="space-after.conditionality">discard</xsl:attribute>
      <xsl:attribute name="start-indent">3pt</xsl:attribute>
      <xsl:attribute name="end-indent">3pt</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="thead.row.entry">
      <xsl:attribute name="background-color">transparent</xsl:attribute>
   </xsl:attribute-set>

   <xsl:attribute-set name="__dl__dt__column">
      <xsl:attribute name="column-number">1</xsl:attribute>
      <xsl:attribute name="column-width">25%</xsl:attribute>
      <xsl:attribute name="text-align">left</xsl:attribute>
   </xsl:attribute-set>

   <xsl:attribute-set name="__dl__dd__column">
      <xsl:attribute name="column-number">2</xsl:attribute>
      <xsl:attribute name="column-width">75%</xsl:attribute>
      <xsl:attribute name="text-align">left</xsl:attribute>
   </xsl:attribute-set>
   
   
   <xsl:attribute-set name="table__tableframe__top" use-attribute-sets="common.border__top">
      <xsl:attribute name="border-before-style">solid</xsl:attribute>
   </xsl:attribute-set>

   <xsl:attribute-set name="table__tableframe__left" use-attribute-sets="common.border__left">
      <xsl:attribute name="border-start-style">solid</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="table__tableframe__right" use-attribute-sets="common.border__right">
      <xsl:attribute name="border-end-style">solid</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="table__tableframe__bottom" use-attribute-sets="common.border__bottom">
      <xsl:attribute name="border-after-style">solid</xsl:attribute>
   </xsl:attribute-set>
   
<!-- custom HPE table layout -->
   
   <xsl:attribute-set name="tgroup.thead">
      <xsl:attribute name="border-after-color">#0F5FDC</xsl:attribute>
      <xsl:attribute name="border-after-style">solid</xsl:attribute>
      <xsl:attribute name="border-after-width">3pt</xsl:attribute>
   </xsl:attribute-set>
   
<!-- table spacing for HPE markdown -->
   <xsl:attribute-set name="table" use-attribute-sets="base-font">
      <!--It is a table container -->
      <xsl:attribute name="space-before">10pt</xsl:attribute>
      <xsl:attribute name="space-after">10pt</xsl:attribute>
      <!-- added bottom margin if someone stupidly put the table in a list item -->
      <xsl:attribute name="margin-bottom">10pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
   </xsl:attribute-set>
   
</xsl:stylesheet>
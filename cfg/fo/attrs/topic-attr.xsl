<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
   <xsl:attribute-set name="topic.title">
      <xsl:attribute name="background-color">transparent</xsl:attribute>
      <xsl:attribute name="border-after-color">#0F5FDC</xsl:attribute>
      <xsl:attribute name="border-after-style">solid</xsl:attribute>
      <xsl:attribute name="border-after-width">2pt</xsl:attribute>
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
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">24pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">1.2</xsl:attribute>
      <xsl:attribute name="padding-bottom">4pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">10pt</xsl:attribute>
      <xsl:attribute name="space-before">0pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
      
   </xsl:attribute-set>
   <xsl:attribute-set name="topic.topic.title">
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
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">16pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">120%</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">4pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="topic.topic.topic.title">
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
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">14pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">120%</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">4pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="topic.topic.topic.topic.title">
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
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">12pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">120%</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">4pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="topic.topic.topic.topic.topic.title">
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
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">120%</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">4pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.title">
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
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">120%</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">4pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="topic__shortdesc" use-attribute-sets="body">
   </xsl:attribute-set>
   <xsl:attribute-set name="section.title">
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
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">4pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="example">
      <xsl:attribute name="background-color">transparent</xsl:attribute>
      <xsl:attribute name="border-after-color">#0F5FDC</xsl:attribute>
      <xsl:attribute name="border-after-style">solid</xsl:attribute>
      <xsl:attribute name="border-after-width">1pt</xsl:attribute>
      <xsl:attribute name="border-before-color">#0F5FDC</xsl:attribute>
      <xsl:attribute name="border-before-style">solid</xsl:attribute>
      <xsl:attribute name="border-before-width">1pt</xsl:attribute>
      <xsl:attribute name="border-end-color">#0F5FDC</xsl:attribute>
      <xsl:attribute name="border-end-style">solid</xsl:attribute>
      <xsl:attribute name="border-end-width">1pt</xsl:attribute>
      <xsl:attribute name="border-start-color">#0F5FDC</xsl:attribute>
      <xsl:attribute name="border-start-style">solid</xsl:attribute>
      <xsl:attribute name="border-start-width">1pt</xsl:attribute>
      <xsl:attribute name="color">black</xsl:attribute>
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">5pt</xsl:attribute>
      <xsl:attribute name="padding-left">10pt</xsl:attribute>
      <xsl:attribute name="padding-right">10pt</xsl:attribute>
      <xsl:attribute name="padding-top">5pt</xsl:attribute>
      <xsl:attribute name="space-after">4pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="start-indent">10pt</xsl:attribute>
      <xsl:attribute name="end-indent">10pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="example.title">
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
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">5pt</xsl:attribute>
      <xsl:attribute name="space-before">10pt</xsl:attribute>
      <xsl:attribute name="start-indent">10pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="tm">
      <xsl:attribute name="background-color">transparent</xsl:attribute>
      <xsl:attribute name="color">black</xsl:attribute>
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="p__inlist__firstpara" use-attribute-sets="common.block">
      <xsl:attribute name="space-after">3pt</xsl:attribute>
      <xsl:attribute name="text-indent">0em</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="p__inlist__lastpara" use-attribute-sets="common.block">
      <xsl:attribute name="margin-bottom">3pt</xsl:attribute>
      <xsl:attribute name="text-indent">0em</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="image__block">
      <!-- auto resize large images -->
      <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
      <xsl:attribute name="content-height">100%</xsl:attribute>
      <xsl:attribute name="width">100%</xsl:attribute>
      <xsl:attribute name="scaling">uniform</xsl:attribute>
   </xsl:attribute-set>

   <xsl:attribute-set name="note__table">
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
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">12pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="margin-left">0pt</xsl:attribute>
      <xsl:attribute name="margin-right">0pt</xsl:attribute>
      <xsl:attribute name="margin-bottom">12pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
      
      
   </xsl:attribute-set>
   <xsl:attribute-set name="note__label">
      <xsl:attribute name="border-start-width">0pt</xsl:attribute>
      <xsl:attribute name="border-end-width">0pt</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
   </xsl:attribute-set> 
   <xsl:attribute-set name="note__image">
      <xsl:attribute name="vertical-align">middle</xsl:attribute>
      <xsl:attribute name="baseline-shift">baseline</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="note__image__entry">
      <xsl:attribute name="padding-end">3pt</xsl:attribute>
      <xsl:attribute name="padding-start">3pt</xsl:attribute>
      <xsl:attribute name="padding-top">3pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">3pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="note__image__entry__noimage">
      <xsl:attribute name="padding-end">0pt</xsl:attribute>
      <xsl:attribute name="padding-start">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="note__image__column">
      <xsl:attribute name="column-number">1</xsl:attribute>
      <xsl:attribute name="column-width">29pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="note__image__column__wider">
      <xsl:attribute name="column-number">1</xsl:attribute>
      <xsl:attribute name="column-width">35pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="note__image__column__noimage">
      <xsl:attribute name="column-number">1</xsl:attribute>
      <xsl:attribute name="column-width">6pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="note__text__column">
      <xsl:attribute name="column-number">2</xsl:attribute>      
      <xsl:attribute name="column-width">proportional-column-width(1)</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="note__text__column__wider">
      <xsl:attribute name="column-number">2</xsl:attribute>
      <xsl:attribute name="column-width">proportional-column-width(1)</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="note__text__column__noimage">
      <xsl:attribute name="column-number">2</xsl:attribute>
      <xsl:attribute name="column-width">proportional-column-width(1)</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="note__text__entry">
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">3pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">3pt</xsl:attribute>
      <xsl:attribute name="border-after-color">#0F5FDC</xsl:attribute>
      <xsl:attribute name="border-after-style">solid</xsl:attribute>
      <xsl:attribute name="border-after-width">1pt</xsl:attribute>
      <xsl:attribute name="border-before-color">#0F5FDC</xsl:attribute>
      <xsl:attribute name="border-before-style">solid</xsl:attribute>
      <xsl:attribute name="border-before-width">1pt</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="note__text__entry__noimage">
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">3pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">3pt</xsl:attribute>
      <xsl:attribute name="border-after-style">none</xsl:attribute>
      <xsl:attribute name="border-before-style">none</xsl:attribute>
   </xsl:attribute-set>
   
   
   <xsl:attribute-set name="pre">
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
      <xsl:attribute name="end-indent">0pt</xsl:attribute>
      <xsl:attribute name="font-family">Courier New</xsl:attribute>
      <xsl:attribute name="font-size">9pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">4pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="fig">
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
      <xsl:attribute name="font-family">GothamHCL-FOP, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">4pt</xsl:attribute>
      <xsl:attribute name="space-before">12pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="draft-comment" use-attribute-sets="common.border">
      <xsl:attribute name="background-color">#FFFFFF</xsl:attribute>
      <xsl:attribute name="color">#7630EA</xsl:attribute>
      <xsl:attribute name="border-top-color">#7630EA</xsl:attribute>
      <xsl:attribute name="border-bottom-color">#7630EA</xsl:attribute>
      <xsl:attribute name="border-left-color">#7630EA</xsl:attribute>
      <xsl:attribute name="border-right-color">#7630EA</xsl:attribute>
      <xsl:attribute name="space-before">4pt</xsl:attribute>
      <xsl:attribute name="space-after">4pt</xsl:attribute>      
   </xsl:attribute-set>
   
   <xsl:attribute-set name="draft-comment__label">
      <xsl:attribute name="font-weight">bold</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="required-cleanup">
      <xsl:attribute name="background">#32DAC8</xsl:attribute>
      <xsl:attribute name="color">#000000</xsl:attribute>
      <xsl:attribute name="space-before">4pt</xsl:attribute>
      <xsl:attribute name="space-before">4pt</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="required-cleanup__label">
      <xsl:attribute name="font-weight">bold</xsl:attribute>
   </xsl:attribute-set>
   
</xsl:stylesheet>
   
   
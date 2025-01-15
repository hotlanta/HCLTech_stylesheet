<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">

   <xsl:variable name="toc.text-indent" select="'15pt'"/>
   <xsl:variable name="toc.toc-indent" select="'30pt'"/>

   <xsl:attribute-set name="__toc__indent">
      <xsl:attribute name="start-indent">
         <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
         <xsl:choose>
            <xsl:when test="$level eq 1">
               <xsl:value-of select="concat('0pt + ', $toc.text-indent)"/>
            </xsl:when>
            <xsl:when test="$level eq 2">
               <xsl:value-of select="concat('15pt + ', $toc.text-indent)"/>
            </xsl:when>
            <xsl:when test="$level eq 3">
               <xsl:value-of select="concat('30pt + ', $toc.text-indent)"/>
            </xsl:when>
            <xsl:when test="$level eq 4">
               <xsl:value-of select="concat('55pt + ', $toc.text-indent)"/>
            </xsl:when>
            <xsl:when test="true()">
               <xsl:value-of select="concat($side-col-width, ' + (', string($level - 1), ' * ', $toc.toc-indent, ') + ', $toc.text-indent)"/>
            </xsl:when>
         </xsl:choose>
      </xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__indent__booklist">
      <xsl:attribute name="start-indent">
         <xsl:value-of select="concat('0pt + ', $toc.text-indent)"/>
      </xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__topic__content">
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
      <xsl:attribute name="end-indent">20pt</xsl:attribute>
      <xsl:attribute name="font-family">Helvetica, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">0pt</xsl:attribute>
      <xsl:attribute name="space-before">10pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__topic__content_2" use-attribute-sets="__toc__topic__content">
      <xsl:attribute name="space-before">2pt</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__topic__content_3" use-attribute-sets="__toc__topic__content">
      <xsl:attribute name="space-before">2pt</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__topic__content_4" use-attribute-sets="__toc__topic__content">
      <xsl:attribute name="space-before">2pt</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__chapter__content">
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
      <xsl:attribute name="end-indent">20pt</xsl:attribute>
      <xsl:attribute name="font-family">Helvetica, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">0pt</xsl:attribute>
      <xsl:attribute name="space-before">5pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__appendix__content">
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
      <xsl:attribute name="end-indent">20pt</xsl:attribute>
      <xsl:attribute name="font-family">Helvetica, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">0pt</xsl:attribute>
      <xsl:attribute name="space-before">5pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__part__content">
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
      <xsl:attribute name="end-indent">20pt</xsl:attribute>
      <xsl:attribute name="font-family">Helvetica, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">0pt</xsl:attribute>
      <xsl:attribute name="space-before">5pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__preface__content">
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
      <xsl:attribute name="end-indent">20pt</xsl:attribute>
      <xsl:attribute name="font-family">Helvetica, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">0pt</xsl:attribute>
      <xsl:attribute name="space-before">5pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__notices__content">
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
      <xsl:attribute name="end-indent">20pt</xsl:attribute>
      <xsl:attribute name="font-family">Helvetica, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">0pt</xsl:attribute>
      <xsl:attribute name="space-before">5pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__toc__topic__content__booklist">
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
      <xsl:attribute name="end-indent">20pt</xsl:attribute>
      <xsl:attribute name="font-family">Helvetica, Arial</xsl:attribute>
      <xsl:attribute name="font-size">10pt</xsl:attribute>
      <xsl:attribute name="font-style">normal</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="line-height">12pt</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="padding-left">0pt</xsl:attribute>
      <xsl:attribute name="padding-right">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">0pt</xsl:attribute>
      <xsl:attribute name="space-after">0pt</xsl:attribute>
      <xsl:attribute name="space-before">5pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
   </xsl:attribute-set>
</xsl:stylesheet>
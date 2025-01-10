<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
 
<!-- generic header styling -->
   <xsl:attribute-set name="__header">
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
      <xsl:attribute name="line-height">1.2</xsl:attribute>
      <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
      <xsl:attribute name="margin-left">0.5in</xsl:attribute>
      <xsl:attribute name="margin-right">0.5in</xsl:attribute>
      <xsl:attribute name="padding-top">0.3in</xsl:attribute>
      <xsl:attribute name="space-after">6pt</xsl:attribute>
      <xsl:attribute name="space-before">6pt</xsl:attribute>
      <xsl:attribute name="start-indent">0pt</xsl:attribute>
      <xsl:attribute name="text-align">start</xsl:attribute>
      <xsl:attribute name="text-decoration">none</xsl:attribute>
      <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
   </xsl:attribute-set>
   
<!-- header redirects and exceptions -->  
   <xsl:attribute-set name="__even__header" use-attribute-sets="__header"/>
   <xsl:attribute-set name="__odd__header" use-attribute-sets="__header"/>
   <xsl:attribute-set name="__first__header" use-attribute-sets="__header"/>
   <xsl:attribute-set name="__last__header" use-attribute-sets="__header"/>
   
   <xsl:attribute-set name="__body__even__header" use-attribute-sets="__even__header"/>
   <xsl:attribute-set name="__body__odd__header" use-attribute-sets="__odd__header"/>
   <xsl:attribute-set name="__body__first__header" use-attribute-sets="__first__header"/>
   <xsl:attribute-set name="__body__last__header" use-attribute-sets="__last__header"/>
   
   <xsl:attribute-set name="__preface__even__header" use-attribute-sets="__even__header"/>
   <xsl:attribute-set name="__preface__odd__header" use-attribute-sets="__odd__header"/>
   <xsl:attribute-set name="__preface__first__header" use-attribute-sets="__first__header"/>
   <xsl:attribute-set name="__preface__last__header" use-attribute-sets="__last__header"/>

   <xsl:attribute-set name="__toc__even__header" use-attribute-sets="__even__header"/>
   <xsl:attribute-set name="__toc__odd__header" use-attribute-sets="__odd__header"/>
   <xsl:attribute-set name="__toc__first__header" use-attribute-sets="__first__header"/>
   <xsl:attribute-set name="__toc__last__header" use-attribute-sets="__last__header"/>
   
   <xsl:attribute-set name="__index__even__header" use-attribute-sets="__even__header"/>
   <xsl:attribute-set name="__index__odd__header" use-attribute-sets="__odd__header"/>
   
   <xsl:attribute-set name="__glossary__even__header" use-attribute-sets="__even__header"/>
   <xsl:attribute-set name="__glossary__odd__header" use-attribute-sets="__odd__header"/>
   
<!-- header page number and doc / chapter title definitions -->
   <xsl:attribute-set name="__header__pagenum">
      <xsl:attribute name="text-align">right</xsl:attribute>
      <xsl:attribute name="margin-top">-12pt</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__header__pagenum__body">
      <xsl:attribute name="text-align">right</xsl:attribute>
      <xsl:attribute name="margin-top">-24pt</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
   </xsl:attribute-set>
   <xsl:attribute-set name="__header__title">
      <xsl:attribute name="text-align">left</xsl:attribute>
      <xsl:attribute name="font-weight">normal</xsl:attribute>
   </xsl:attribute-set>   
   <xsl:attribute-set name="__header__title__chapter">
      <xsl:attribute name="text-align">left</xsl:attribute>
      <xsl:attribute name="space-before">0pt</xsl:attribute>  
      <xsl:attribute name="font-weight">normal</xsl:attribute>
   </xsl:attribute-set>
   <!-- -->
   
<!-- generic footer styling -->
   <xsl:attribute-set name="__footer__table">
      <xsl:attribute name="text-align">end</xsl:attribute>
      <xsl:attribute name="margin-left">0.3in</xsl:attribute>
      <xsl:attribute name="margin-right">0.5in</xsl:attribute>
      <xsl:attribute name="end-indent">0pt</xsl:attribute>
      <xsl:attribute name="space-after">0pt</xsl:attribute>
      <xsl:attribute name="table-layout">fixed</xsl:attribute>
      <xsl:attribute name="width">185mm</xsl:attribute>
      
   </xsl:attribute-set>
   
   <xsl:attribute-set name="__footer__logo">
      <xsl:attribute name="text-align">end</xsl:attribute> -->
<!--      <xsl:attribute name="text-align">left</xsl:attribute> -->
      <xsl:attribute name="margin-left">0pt</xsl:attribute>
<!--      <xsl:attribute name="margin-left">auto</xsl:attribute> -->
      <xsl:attribute name="margin-right">0pt</xsl:attribute>
<!--      <xsl:attribute name="margin-top">20pt</xsl:attribute> 
      <xsl:attribute name="margin-bottom">10pt</xsl:attribute> -->     
   </xsl:attribute-set>
     
   <xsl:attribute-set name="__footer__text">
      <xsl:attribute name="margin-left">0pt</xsl:attribute>
      <xsl:attribute name="margin-right">0pt</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="__footer__confidentiality">
      <xsl:attribute name="text-align">left</xsl:attribute>
      <xsl:attribute name="margin-top">14pt</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
   </xsl:attribute-set>
     
<!-- footer redirects and exceptions -->
   <xsl:attribute-set name="__odd__footer" use-attribute-sets="__footer__table"/>
   <xsl:attribute-set name="__even__footer" use-attribute-sets="__footer__table"/>
   <xsl:attribute-set name="__first__footer" use-attribute-sets="__footer__table"/>
   <xsl:attribute-set name="__last__footer" use-attribute-sets="__footer__table"/> 

   <xsl:attribute-set name="__body__even__footer" use-attribute-sets="__even__footer"/>
   <xsl:attribute-set name="__body__odd__footer" use-attribute-sets="__odd__footer"/>
   <xsl:attribute-set name="__body__first__footer" use-attribute-sets="__first__footer"/>
   <xsl:attribute-set name="__body__last__footer" use-attribute-sets="__last__footer"/>
      
   <xsl:attribute-set name="__preface__even__footer" use-attribute-sets="__even__footer"/>
   <xsl:attribute-set name="__preface__odd__footer" use-attribute-sets="__odd__footer"/>
   <xsl:attribute-set name="__preface__first__footer" use-attribute-sets="__first__footer"/>
   <xsl:attribute-set name="__preface__last__footer" use-attribute-sets="__last__footer"/>

   <xsl:attribute-set name="__toc__even__footer" use-attribute-sets="__even__footer"/>
   <xsl:attribute-set name="__toc__odd__footer" use-attribute-sets="__odd__footer"/>
   <xsl:attribute-set name="__toc__first__footer" use-attribute-sets="__first__footer"/>
   <xsl:attribute-set name="__toc__last__footer" use-attribute-sets="__last__footer"/>
   
   <xsl:attribute-set name="__index__even__footer" use-attribute-sets="__even__footer"/>
   <xsl:attribute-set name="__index__odd__footer" use-attribute-sets="__odd__footer"/>
   
   <xsl:attribute-set name="__glossary__even__footer" use-attribute-sets="__even__footer"/>
   <xsl:attribute-set name="__glossary__odd__footer" use-attribute-sets="__odd__footer"/>
   

   
<!-- chapter boilerplate -->  
   <xsl:attribute-set name="__chapter__frontmatter__name__container">
      <xsl:attribute name="font-size">24pt</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="border-before-style">solid</xsl:attribute>
      <xsl:attribute name="border-before-color">#01A982</xsl:attribute>
      <xsl:attribute name="border-after-style">none</xsl:attribute>
      <xsl:attribute name="border-before-width">2pt</xsl:attribute>
      <xsl:attribute name="border-after-width">0pt</xsl:attribute>
      <xsl:attribute name="padding-top">10pt</xsl:attribute>
   </xsl:attribute-set>
   
   <xsl:attribute-set name="__chapter__frontmatter__number__container">
      <xsl:attribute name="font-size">24pt</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
   </xsl:attribute-set>
   
</xsl:stylesheet>
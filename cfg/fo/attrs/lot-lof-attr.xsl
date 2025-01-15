<?xml version='1.0'?>

<!--
This file is part of the DITA Open Toolkit project.

Copyright 2011 Reuven Weiser

See the accompanying LICENSE file for applicable license.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:rx="http://www.renderx.com/XSL/Extensions"
    version="2.0">

  <xsl:attribute-set name="__lotf__title" use-attribute-sets="__lotf__content">
    <xsl:attribute name="font-family">Helvetica, Arial</xsl:attribute>
  </xsl:attribute-set>
  
  <xsl:attribute-set name ="__lotf__content" use-attribute-sets="base-font __toc__topic__content__booklist">
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="font-size">10pt</xsl:attribute>
    <xsl:attribute name="space-before">0pt</xsl:attribute>
    <xsl:attribute name="space-after">0pt</xsl:attribute>
    <xsl:attribute name="line-height">12pt</xsl:attribute>
  </xsl:attribute-set>
  
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
    
    
    <xsl:template match="/" mode="create-page-sequences">
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'toc-sequence'"/>
            <xsl:with-param name="master-reference" select="'toc'"/>
        </xsl:call-template>
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'body-sequence'"/>
            <xsl:with-param name="master-reference" select="'body'"/>
        </xsl:call-template>
        <!-- HPE customization for landscape pages -->
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'landscape-sequence'"/>
            <xsl:with-param name="master-reference" select="'landscape'"/>
        </xsl:call-template>
        <!-- end HPE cusotomization -->
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'ditamap-body-sequence'"/>
            <xsl:with-param name="master-reference" select="'body'"/>
            <xsl:with-param name="first" select="false()"/>
            <xsl:with-param name="last" select="false()"/>
        </xsl:call-template>
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'index-sequence'"/>
            <xsl:with-param name="master-reference" select="'index'"/>
            <xsl:with-param name="last" select="false()"/>
        </xsl:call-template>
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'front-matter'"/>
            <xsl:with-param name="master-reference" select="'front-matter'"/>
        </xsl:call-template>
        <xsl:if test="$generate-back-cover">
            <xsl:call-template name="generate-page-sequence-master">
                <xsl:with-param name="master-name" select="'back-cover'"/>
                <xsl:with-param name="master-reference" select="'back-cover'"/>
                <xsl:with-param name="first" select="false()"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:call-template name="generate-page-sequence-master">
            <xsl:with-param name="master-name" select="'glossary-sequence'"/>
            <xsl:with-param name="master-reference" select="'glossary'"/>
            <xsl:with-param name="last" select="false()"/>
        </xsl:call-template>
    </xsl:template>
    
    
    <xsl:template match="/" mode="create-page-masters">
        <!-- Frontmatter simple masters -->
        <fo:simple-page-master master-name="front-matter-first" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.odd"/>
        </fo:simple-page-master>
        
        <fo:simple-page-master master-name="front-matter-last" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.even"/>
            <fo:region-before  region-name="last-frontmatter-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="last-frontmatter-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <xsl:if test="$mirror-page-margins">
            <fo:simple-page-master master-name="front-matter-even" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.even"/>
                <fo:region-before region-name="even-frontmatter-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="even-frontmatter-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
        </xsl:if>
        
        <fo:simple-page-master master-name="front-matter-odd" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body__frontmatter.odd"/>
            <fo:region-before region-name="odd-frontmatter-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-frontmatter-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <!-- Backcover simple masters -->
        <xsl:if test="$generate-back-cover">
            <!--fo:simple-page-master master-name="back-cover-first" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__backcover.odd"/>
              </fo:simple-page-master-->
            
            <xsl:if test="$mirror-page-margins">
                <fo:simple-page-master master-name="back-cover-even" xsl:use-attribute-sets="simple-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body__backcover.even"/>
                    <fo:region-before region-name="even-back-cover-header" xsl:use-attribute-sets="region-before"/>
                    <fo:region-after region-name="even-back-cover-footer" xsl:use-attribute-sets="region-after"/>
                </fo:simple-page-master>
            </xsl:if>
            
            <fo:simple-page-master master-name="back-cover-odd" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__backcover.odd"/>
                <fo:region-before region-name="odd-back-cover-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="odd-back-cover-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
            
            <fo:simple-page-master master-name="back-cover-last" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__backcover.even"/>
                <fo:region-before region-name="last-back-cover-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="last-back-cover-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
        </xsl:if>
        
        <!--TOC simple masters-->
        <xsl:if test="$mirror-page-margins">
            <fo:simple-page-master master-name="toc-even" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.even"/>
                <fo:region-before region-name="even-toc-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="even-toc-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
        </xsl:if>
        
        <fo:simple-page-master master-name="toc-odd" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="odd-toc-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-toc-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <fo:simple-page-master master-name="toc-last" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.even"/>
            <fo:region-before region-name="last-toc-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="last-toc-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <fo:simple-page-master master-name="toc-first" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="first-toc-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="first-toc-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <!--BODY simple masters-->
        <fo:simple-page-master master-name="body-first" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="first-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="first-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <xsl:if test="$mirror-page-margins">
            <fo:simple-page-master master-name="body-even" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.even"/>
                <fo:region-before region-name="even-body-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="even-body-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
        </xsl:if>
        
        <fo:simple-page-master master-name="body-odd" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="odd-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <fo:simple-page-master master-name="body-last" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.even"/>
            <fo:region-before region-name="last-body-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="last-body-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <!-- PA: Landscape support -->
            <fo:simple-page-master master-name="landscape-first" xsl:use-attribute-sets="landscape-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.landscape"/>
                <fo:region-before region-name="first-body-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="first-body-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
            
            <xsl:if test="$mirror-page-margins">
                <fo:simple-page-master master-name="landscape-even" xsl:use-attribute-sets="landscape-page-master">
                    <fo:region-body xsl:use-attribute-sets="region-body.landscape"/>
                    <fo:region-before region-name="even-body-header" xsl:use-attribute-sets="region-before"/>
                    <fo:region-after region-name="even-body-footer" xsl:use-attribute-sets="region-after"/>
                </fo:simple-page-master>
            </xsl:if>
            
            <fo:simple-page-master master-name="landscape-odd" xsl:use-attribute-sets="landscape-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.landscape"/>
                <fo:region-before region-name="odd-body-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="odd-body-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
            
            <fo:simple-page-master master-name="landscape-last" xsl:use-attribute-sets="landscape-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.landscape"/>
                <fo:region-before region-name="last-body-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="last-body-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
        <!-- end landscape -->
        
        
        <!--INDEX simple masters-->
        <fo:simple-page-master master-name="index-first" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body__index.odd"/>
            <fo:region-before region-name="odd-index-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-index-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <xsl:if test="$mirror-page-margins">
            <fo:simple-page-master master-name="index-even" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body__index.even"/>
                <fo:region-before region-name="even-index-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="even-index-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
        </xsl:if>
        
        <fo:simple-page-master master-name="index-odd" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body__index.odd"/>
            <fo:region-before region-name="odd-index-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-index-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <!--GLOSSARY simple masters-->
        <fo:simple-page-master master-name="glossary-first" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="odd-glossary-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-glossary-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
        
        <xsl:if test="$mirror-page-margins">
            <fo:simple-page-master master-name="glossary-even" xsl:use-attribute-sets="simple-page-master">
                <fo:region-body xsl:use-attribute-sets="region-body.even"/>
                <fo:region-before region-name="even-glossary-header" xsl:use-attribute-sets="region-before"/>
                <fo:region-after region-name="even-glossary-footer" xsl:use-attribute-sets="region-after"/>
            </fo:simple-page-master>
        </xsl:if>
        
        <fo:simple-page-master master-name="glossary-odd" xsl:use-attribute-sets="simple-page-master">
            <fo:region-body xsl:use-attribute-sets="region-body.odd"/>
            <fo:region-before region-name="odd-glossary-header" xsl:use-attribute-sets="region-before"/>
            <fo:region-after region-name="odd-glossary-footer" xsl:use-attribute-sets="region-after"/>
        </fo:simple-page-master>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
   
<!-- HPE customization for legacy force-break support -->    
    <xsl:template match="*[contains(@class,' pr-d/codeph ')]">
        <fo:inline xsl:use-attribute-sets="codeph">
            <xsl:call-template name="commonattributes"/>
            <!-- start auto break customization - strips internal elements! -->
            <xsl:choose>
                <xsl:when test="@outputclass='force-break'">
                    <xsl:call-template name="intersperse-with-zero-spaces">
                        <xsl:with-param name="str" select="."/>
                    </xsl:call-template>   
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- end auto break customization -->
        </fo:inline>
    </xsl:template>
<!-- end of HPE customization -->
    
    
<!-- HPE customization for legacy force-break support -->
    <xsl:template match="*[contains(@class,' pr-d/apiname ')]">
        <!-- auto break customization is applied but called in the template called below.  -->     
        <xsl:apply-templates select="." mode="inlineTextOptionalKeyref">
            <xsl:with-param name="copyAttributes" as="element()"><wrapper xsl:use-attribute-sets="apiname"/></xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
<!-- end of HPE customization -->
    
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
 
<!-- HPE: dynamic background image on cover - currently unused -->
   <xsl:variable name="backImage">
      <xsl:variable name="mapBrand" select="(/*/opentopic:map//*[contains(@class, ' topic/brand ')])[1]" as="element()?"/>
            <xsl:value-of select="$mapBrand"/>
    </xsl:variable>
   <!-- end customization -->


   <xsl:template name="createFrontCoverContents">
      
<!-- HCLTech customization - put company logo on front cover -->
      <fo:block xsl:use-attribute-sets="__frontmatter__logo">
         <fo:external-graphic src="url(Customization/OpenTopic/common/artwork/HCLTechLogo_supercharge2.svg)" content-width="3in" content-height="1.5in" scaling="uniform"/>
      </fo:block>
<!-- end of HCLTech customization -->
      
   <!-- HPE customization - put document title on front cover -->
      <fo:block xsl:use-attribute-sets="__frontmatter__title">
         <xsl:choose>
            <xsl:when test="$map/*[contains(@class,' topic/title ')][1]">
               <xsl:apply-templates select="$map/*[contains(@class,' topic/title ')][1]"/>
            </xsl:when>
            <xsl:when test="$map//*[contains(@class,' bookmap/mainbooktitle ')][1]">
               <xsl:apply-templates select="$map//*[contains(@class,' bookmap/mainbooktitle ')][1]"/>
            </xsl:when>
            <xsl:when test="//*[contains(@class, ' map/map ')]/@title">
               <xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="/descendant::*[contains(@class, ' topic/topic ')][1]/*[contains(@class, ' topic/title ')]"/>
            </xsl:otherwise>
         </xsl:choose>
      </fo:block>
<!-- end of HPE customization -->
      
<!-- HPE customization - put document subtitle on front cover -->
      <xsl:if test="$map//*[contains(@class,' bookmap/booktitlealt ')][1]">
         <fo:block xsl:use-attribute-sets="__frontmatter__subtitle">
            <xsl:apply-templates select="$map//*[contains(@class,' bookmap/booktitlealt ')]"/>         
         </fo:block>         
      </xsl:if>
<!-- end of HPE customization -->
      
<!-- HPE customization - put release information on front cover -->
      <xsl:if test="$map//*[contains(@class,' topic/vrm ')]">
         <fo:block xsl:use-attribute-sets="__frontmatter__version">
            <xsl:apply-templates select="($map//*[contains(@class,' topic/vrm ')])[1]">
               <xsl:with-param name="rel_txt">
                  <xsl:call-template name="getVariable">
                     <xsl:with-param name="id" select="'Product Version'"/>
                  </xsl:call-template>
               </xsl:with-param>
            </xsl:apply-templates>
         </fo:block>       
      </xsl:if>
<!-- end of HPE customization -->

<!-- HPE customization - put edition text on front cover -->
      <xsl:if test="$map//*[contains(@class,' topic/vrm ')]">
         <fo:block xsl:use-attribute-sets="__frontmatter__version">
            <xsl:apply-templates select="($map//*[contains(@class,' bookmap/edition ')])[1]">
               <xsl:with-param name="ed_txt">
                  <xsl:call-template name="getVariable">
                     <xsl:with-param name="id" select="'Document Edition'"/>
                  </xsl:call-template>
               </xsl:with-param>
            </xsl:apply-templates>
         </fo:block>       
      </xsl:if>
<!-- end of HPE customization -->

<!-- HPE customization - put document part number on front cover -->
      <xsl:if test="$map//*[contains(@class,' topic/vrm ')]">
         <fo:block xsl:use-attribute-sets="__frontmatter__version">
            <xsl:apply-templates select="($map//*[contains(@class,' bookmap/bookpartno ')])[1]">
               <xsl:with-param name="partno_txt">
                  <xsl:call-template name="getVariable">
                     <xsl:with-param name="id" select="'Document Partnumber'"/>
                  </xsl:call-template>
               </xsl:with-param>
            </xsl:apply-templates>
         </fo:block>       
      </xsl:if> 
<!-- end of HPE customization -->

<!-- HPE customization - put green HPE dash on front cover -->
<!--       <fo:block-container width="0.7in">
         <fo:block border-before-width="4pt" border-before-style="solid" border-color="#0F5FDC">
         </fo:block>
      </fo:block-container> -->    
<!-- end of HPE customization -->
      
<!-- HPE customization - put confidentiality statement on front cover -->
      <fo:block-container absolute-position="absolute" height="0.5in" width="7.27in" top="10.7in" left="0in">
         <fo:block xsl:use-attribute-sets="__cover__confidentiality">
            <xsl:apply-templates select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
         </fo:block>         
      </fo:block-container>
<!-- end of HPE customization -->
      
<!-- HPE customization - put photo on front cover -->
      <fo:block xsl:use-attribute-sets="image__block">
         <xsl:call-template name="e:cover-image"/>
      </fo:block>      
     
   </xsl:template>
<!-- end of HPE customization -->
   
<!-- HPE: get release metadata from DITAMAP customization -->
   <xsl:template match="*[contains(@class,' topic/vrm ')]">
      <xsl:param name="rel_txt"/>
      <xsl:choose>
         <xsl:when test="@version!=''">
            <xsl:choose>
               <xsl:when test="@release!=''">
                  <fo:inline>
                     <xsl:value-of select="concat($rel_txt,@version,'.',@release)"/>
                  </fo:inline>
               </xsl:when>
               <xsl:otherwise>
                  <fo:inline>
                     <xsl:value-of select="concat($rel_txt,@version)"/>
                  </fo:inline>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="@release">
            <fo:inline>
               <xsl:value-of select="concat($rel_txt,@release)"/>
            </fo:inline>
         </xsl:when>
         <xsl:otherwise />
      </xsl:choose>
   </xsl:template> 
<!-- end of HPE customization -->

<!-- HPE: get edition information from DITAMAP customization -->
   <xsl:template match="*[contains(@class,' bookmap/edition ')]">
      <xsl:param name="ed_txt"/>   
        <fo:inline>
           <xsl:value-of select="concat($map//*[contains(@class,' bookmap/edition ')][1],$ed_txt)"/>
        </fo:inline>
    </xsl:template>
<!-- end of HPE customization -->
    
<!-- HPE: get part number from DITAMAP customization -->
    <xsl:template match="*[contains(@class,' bookmap/bookpartno ')]">
        <xsl:param name="partno_txt"/>
        <fo:inline>
           <xsl:value-of select="concat($partno_txt,$map//*[contains(@class,' bookmap/bookpartno ')][1])"/>
        </fo:inline>
    </xsl:template>  
<!-- end of HPE customization -->
  

<!-- HPE: call cover photo - currently hard coded in the stylesheet sources -->
   <xsl:template name="e:cover-image">
      <!--
      <xsl:choose>
         <xsl:when test="($map//*[contains(@class, ' topic/brand ')])">
            <fo:block-container absolute-position="absolute"
               background-image="{$input.dir.url}/hello.jpg"
               background-repeat="no-repeat" background-position="0,0"
               height="3.5in" width="7.27in" top="7.2in" left="0in">
               <fo:block/>
            </fo:block-container> 
         </xsl:when>
         <xsl:otherwise>
          -->
          <fo:block-container absolute-position="absolute"
               background-image="Customization/OpenTopic/common/artwork/background_{$backImage}.jpg"
               background-repeat="no-repeat" background-position="0,0"
               height="6in" width="7.27in" top="5in" left="0in">
               <fo:block/>
            </fo:block-container>         
        <!--
        </xsl:otherwise>
      </xsl:choose>
     -->
   </xsl:template>
<!-- end of HPE customization -->
   
</xsl:stylesheet>
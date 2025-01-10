<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function" xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">
<!-- HPE Adds the chapter number prefix with delimiter. Currently only called by bookmarks.xsl -->
   <xsl:template name="getChapterPrefix">
      <xsl:variable as="element()*" name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)"/>
      <xsl:variable as="element()*" name="chapter" select="$topicref/ancestor-or-self::*[contains(@class, ' map/topicref ')]                                                                                     [parent::opentopic:map or                                                                                      parent::*[contains(@class, ' bookmap/part ')] or                                                                                      parent::*[contains(@class, ' bookmap/appendices ')]][1]"/>
      <xsl:variable name="number" as="node()*">
         <xsl:apply-templates select="$chapter[1]" mode="topicTitleNumber"/>
      </xsl:variable>
      <xsl:if test="exists($number)">
         <xsl:copy-of select="$number"/>
         <xsl:text>. </xsl:text>
      </xsl:if>
   </xsl:template>
<!-- end HPE customization -->   
   
<!-- HPE customization for landscape page support -->
   <!--  Bookmap Chapter processing  -->
   <xsl:template name="processTopicChapter">
      <xsl:variable name="expectedChapterContext" as="xs:boolean">
         <xsl:choose>
            <xsl:when test="empty(parent::*[contains(@class,' topic/topic ')])"><xsl:sequence select="true()"/></xsl:when>
            <xsl:when test="count(ancestor::*[contains(@class,' topic/topic ')]) = 1 and 
               contains((key('map-id',parent::*/@id)[1])/@class,' bookmap/part ')"><xsl:sequence select="true()"/></xsl:when>
            <xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="$expectedChapterContext">
            <!-- HPE: added if statement in reference attrib in next line. It picks up the value from the topic, not the topicref. -->
            <fo:page-sequence master-reference="{if (@outputclass = 'landscape') then 'landscape-sequence' else 'body-sequence'}" xsl:use-attribute-sets="page-sequence.body">
               <xsl:call-template name="startPageNumbering"/>
               <xsl:call-template name="insertBodyStaticContents"/>
               <fo:flow flow-name="xsl-region-body">
                  <xsl:apply-templates select="." mode="processTopicChapterInsideFlow"/>
               </fo:flow>
            </fo:page-sequence>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="." mode="processTopicChapterInsideFlow"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="*" mode="processTopicChapterInsideFlow">
      <fo:block xsl:use-attribute-sets="topic">
         <xsl:call-template name="commonattributes"/>
         <xsl:variable name="level" as="xs:integer">
            <xsl:apply-templates select="." mode="get-topic-level"/>
         </xsl:variable>
         <xsl:if test="$level eq 1">
            <fo:marker marker-class-name="current-topic-number">
               <xsl:variable name="topicref" 
                  select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)[1]" 
                  as="element()?"/>
               <xsl:for-each select="$topicref">
                  <xsl:apply-templates select="." mode="topicTitleNumber"/>
               </xsl:for-each>
            </fo:marker>
            <xsl:apply-templates select="." mode="insertTopicHeaderMarker"/>
         </xsl:if>
         <xsl:apply-templates select="." mode="customTopicMarker"/>
         
         <xsl:apply-templates select="*[contains(@class,' topic/prolog ')]"/>
         
         <xsl:apply-templates select="." mode="insertChapterFirstpageStaticContent">
            <xsl:with-param name="type" select="'chapter'"/>
         </xsl:apply-templates>
         
         <fo:block xsl:use-attribute-sets="topic.title">
            <xsl:apply-templates select="." mode="customTopicAnchor"/>
            <xsl:call-template name="pullPrologIndexTerms"/>
            <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-startprop ')]"/>
            <xsl:for-each select="*[contains(@class,' topic/title ')]">
               <xsl:apply-templates select="." mode="getTitle"/>
            </xsl:for-each>
         </fo:block>
         
         <xsl:choose>
            <xsl:when test="$chapterLayout='BASIC'">
               <xsl:apply-templates select="* except(*[contains(@class, ' topic/title ') or contains(@class,' ditaot-d/ditaval-startprop ') or
                  contains(@class, ' topic/prolog ') or contains(@class, ' topic/topic ')])"/>
               <!--xsl:apply-templates select="." mode="buildRelationships"/-->
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="." mode="createMiniToc"/>
            </xsl:otherwise>
         </xsl:choose>
         
         <xsl:apply-templates select="*[contains(@class,' topic/topic ')]"/>
         <xsl:call-template name="pullPrologIndexTerms.end-range"/>
      </fo:block>
   </xsl:template>
   
   
<!-- end HPE customization -->
   
   
<!-- HPE template to retrieve confidentiality statements according to view attribute on the permissions element set on the DITAMAP -->
   <xsl:template match="*[contains(@class,' topic/permissions ')]">
      <xsl:choose>
         <xsl:when test="@view='internal'">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Confidential-internal'"/>
            </xsl:call-template>     
         </xsl:when>
         <xsl:when test="@view='classified'">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Confidential-training'"/>
            </xsl:call-template>     
         </xsl:when>
         <xsl:when test="@view='entitled'">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Confidential-partner'"/>
            </xsl:call-template>     
         </xsl:when>
         <!-- if unset or set to all no confidentiality notice -->
         <xsl:when test="@view='all'"/>         
         <xsl:otherwise />
      </xsl:choose>
   </xsl:template> 
<!-- end of HPE customization -->
   
   <!-- HPE: content force-break in table cells customization for backwards-compatibility -->
   <xsl:template name="intersperse-with-zero-spaces">
      <xsl:param name="str"/>
      <xsl:variable name="spacechars">
         &#x9;&#xA;
         &#x2000;&#x2001;&#x2002;&#x2003;&#x2004;&#x2005;
         &#x2006;&#x2007;&#x2008;&#x2009;&#x200A;&#x200B;
      </xsl:variable>
      
      <xsl:if test="string-length($str) &gt; 0">
         <xsl:variable name="c1" select="substring($str, 1, 1)"/>
         <xsl:variable name="c2" select="substring($str, 2, 1)"/>
         <xsl:value-of select="$c1"/>
         <xsl:if test="$c2 != '' and
            not(contains($spacechars, $c1) or
            contains($spacechars, $c2))">
            <xsl:text>&#x200B;</xsl:text>
         </xsl:if>
         <xsl:call-template name="intersperse-with-zero-spaces">
            <xsl:with-param name="str" select="substring($str, 2)"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template> 
<!-- end of HPE customization -->
   
   <xsl:template name="insertChapterFirstpageStaticContent">
      <xsl:param name="type" as="xs:string"/>
      <xsl:apply-templates select="." mode="insertChapterFirstpageStaticContent">
         <xsl:with-param name="type" select="$type" as="xs:string"/>
      </xsl:apply-templates>
   </xsl:template>
   
<!-- HPE customization - ignore calling preface and notices labels to avoid a double title -->
   <xsl:template match="*" mode="insertChapterFirstpageStaticContent">
      <xsl:param name="type" as="xs:string"/>
      <fo:block>
         <xsl:attribute name="id">
            <xsl:call-template name="generate-toc-id"/>
         </xsl:attribute>
         
         <xsl:choose>
            <xsl:when test="$type = 'chapter'">           
               <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                  <xsl:call-template name="getVariable">
                     <xsl:with-param name="id" select="'Chapter with number'"/>
                     <xsl:with-param name="params" as="element()*">
                        <number>
                           <fo:inline xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                              <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                           </fo:inline>
                        </number>
                     </xsl:with-param>
                  </xsl:call-template>
               </fo:block>
           </xsl:when>
            <xsl:when test="$type = 'appendix'">
               <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                  <xsl:call-template name="getVariable">
                     <xsl:with-param name="id" select="'Appendix with number'"/>
                     <xsl:with-param name="params" as="element()*">
                        <number>
                           <fo:inline xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                              <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                           </fo:inline>
                        </number>
                     </xsl:with-param>
                  </xsl:call-template>
               </fo:block>
            </xsl:when>
            <xsl:when test="$type = 'appendices'">
               <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                  <xsl:call-template name="getVariable">
                     <xsl:with-param name="id" select="'Appendix with number'"/>
                     <xsl:with-param name="params" as="element()*">
                        <number>
                           <fo:inline xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                              <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                           </fo:inline>
                        </number>
                     </xsl:with-param>
                  </xsl:call-template>
               </fo:block>
            </xsl:when>
            <xsl:when test="$type = 'part'">
               <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                  <xsl:call-template name="getVariable">
                     <xsl:with-param name="id" select="'Part with number'"/>
                     <xsl:with-param name="params" as="element()*">
                        <number>
                           <fo:inline xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                              <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                           </fo:inline>
                        </number>
                     </xsl:with-param>
                  </xsl:call-template>
               </fo:block>
            </xsl:when>
            <xsl:when test="$type = 'preface'">
               <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
<!-- HPE: avoid calling the Preface title for a double heading 
                  <xsl:call-template name="getVariable">
                     <xsl:with-param name="id" select="'Preface title'"/>
                  </xsl:call-template>
-->
               </fo:block>
            </xsl:when>
            <xsl:when test="$type = 'notices'">
               <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
<!-- HPE: avoid calling notices auto-generated label as it is in conflict with HPE DITAMAP practices
                  <xsl:call-template name="getVariable">
                     <xsl:with-param name="id" select="'Notices title'"/>
                  </xsl:call-template>
-->
               </fo:block>
            </xsl:when>
         </xsl:choose>         
      </fo:block>
   </xsl:template>
</xsl:stylesheet>
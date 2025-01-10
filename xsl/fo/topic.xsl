<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
   xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf"
   xmlns:fo="http://www.w3.org/1999/XSL/Format"
   xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
   xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
   exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">

   <!-- HPE customization for section numbering -->
   <xsl:variable name="e:number-levels" select="(false(), true(), true(), true(), true())"/>
   <xsl:template match="*[contains(@class, ' topic/topic ')]/*[contains(@class, ' topic/title ')]"
      mode="getTitle">
      <xsl:variable name="topic" select="ancestor-or-self::*[contains(@class, ' topic/topic ')][1]"/>
      <xsl:variable name="id" select="$topic/@id"/>
      <xsl:variable name="mapTopics" select="key('map-id', $id)"/>
      <fo:inline>
         <xsl:for-each select="$mapTopics[1]">
            <xsl:variable name="depth"
               select="count(ancestor-or-self::*[contains(@class, ' map/topicref')])"/>
            <xsl:choose>
               <xsl:when test="parent::opentopic:map and contains(@class, ' bookmap/bookmap ')"/>
               <xsl:when
                  test="ancestor-or-self::*[contains(@class, ' bookmap/frontmatter ') or contains(@class, ' bookmap/backmatter ')]"/>
               <xsl:when
                  test="ancestor-or-self::*[contains(@class, ' bookmap/appendix ')] and $e:number-levels[$depth]">
                  <xsl:number
                     count="*[contains(@class, ' map/topicref ')][ancestor-or-self::*[contains(@class, ' bookmap/appendix ')]]"
                     level="multiple" format="A.1.1"/>
               </xsl:when>
               <xsl:when test="$e:number-levels[$depth]">
                  <xsl:number
                     count="*[contains(@class, ' map/topicref ')][not(ancestor-or-self::*[contains(@class, ' bookmap/frontmatter ')])]"
                     level="multiple" format="1.1"/>
               </xsl:when>
            </xsl:choose>
            <xsl:choose>
               <!-- HPE: ignore adding a whitespace when we are in the preface as there is no topic number in this case -->
               <xsl:when test="ancestor-or-self::*[contains(@class, ' bookmap/frontmatter ')]"/>
               <!-- HPE: add whitespace after topic number otherwise -->
               <xsl:otherwise>
                  <xsl:value-of select="' '"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
      </fo:inline>
      <xsl:apply-templates/>
   </xsl:template>
<!-- end of HPE customization -->

<!-- HPE customization to relay topic numbering to the TOC -->
   <xsl:template name="getNavTitle">
      <xsl:variable name="topicref" select="key('map-id', @id)[1]"/>
      <xsl:choose>
         <xsl:when
            test="$topicref/@locktitle = 'yes' and $topicref/*[contains(@class, ' map/topicmeta ')]/*[contains(@class, ' topic/navtitle ')]">
            <xsl:apply-templates
               select="$topicref/*[contains(@class, ' map/topicmeta ')]/*[contains(@class, ' topic/navtitle ')]/node()"
            />
         </xsl:when>
         <xsl:when test="$topicref/@locktitle = 'yes' and $topicref/@navtitle">
            <xsl:value-of select="$topicref/@navtitle"/>
         </xsl:when>
         <xsl:otherwise>
            <!-- setting mode="getTitle" in the next line ensures numbering ends also up in TOC -->
            <xsl:apply-templates select="*[contains(@class, ' topic/title ')]" mode="getTitle"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
<!-- end of HPE customization -->

<!-- HPE: I believe this is stock code in this template -->
   <xsl:template match="*[contains(@class, ' topic/fig ')]/*[contains(@class, ' topic/title ')]"
      mode="fig.title-number">
      <xsl:value-of select="count(key('enumerableByClass', 'topic/fig')[. &lt;&lt; current()])"/>
   </xsl:template>
<!-- end of HPE customization -->

<!-- HPE: customize image placement to set scalefit if no attributes specified (e.g. markdown) -->
   <xsl:template match="*" mode="placeImage">
      <xsl:param name="imageAlign"/>
      <xsl:param name="href"/>
      <xsl:param name="height" as="xs:string?"/>
      <xsl:param name="width" as="xs:string?"/>
      <xsl:param name="scale" as="xs:string?">
         <xsl:choose>
            <xsl:when test="@scale">
               <xsl:value-of select="@scale"/>
            </xsl:when>
            <xsl:when test="ancestor::*[@scale]">
               <xsl:value-of select="ancestor::*[@scale][1]/@scale"/>
            </xsl:when>
         </xsl:choose>
      </xsl:param>
      <!--Using align attribute set according to image @align attribute-->
      <xsl:call-template name="processAttrSetReflection">
         <xsl:with-param name="attrSet" select="concat('__align__', $imageAlign)"/>
         <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
      </xsl:call-template>
      <xsl:choose>
         <xsl:when test="@placement ='break'">
            <fo:external-graphic src="url('{$href}')" xsl:use-attribute-sets="image__block">
               <!--Setting image height if defined-->
               <xsl:if test="$height">
                  <xsl:attribute name="content-height">
                     <!--The following test was commented out because most people found the behavior
                 surprising.  It used to force images with a number specified for the dimensions
                 *but no units* to act as a measure of pixels, *if* you were printing at 72 DPI.
                 Uncomment if you really want it. -->
                     <xsl:choose>
                        <!--xsl:when test="not(string(number($height)) = 'NaN')">
                        <xsl:value-of select="concat($height div 72,'in')"/>
                      </xsl:when-->
                        <xsl:when test="not(string(number($height)) = 'NaN')">
                           <xsl:value-of select="concat($height, 'px')"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="$height"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:attribute>
               </xsl:if>
               <!--Setting image width if defined-->
               <xsl:if test="$width">
                  <xsl:attribute name="content-width">
                     <xsl:choose>
                        <!--xsl:when test="not(string(number($width)) = 'NaN')">
                        <xsl:value-of select="concat($width div 72,'in')"/>
                      </xsl:when-->
                        <xsl:when test="not(string(number($width)) = 'NaN')">
                           <xsl:value-of select="concat($width, 'px')"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="$width"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:attribute>
               </xsl:if>
               <xsl:if test="not($width) and not($height) and $scale">
                  <xsl:attribute name="content-width">
                     <xsl:value-of select="concat($scale, '%')"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:if test="@scalefit = 'yes' and not($width) and not($height) and not($scale)">
                  <xsl:attribute name="width">100%</xsl:attribute>
                  <xsl:attribute name="height">100%</xsl:attribute>
                  <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
                  <xsl:attribute name="content-height">scale-to-fit</xsl:attribute>
                  <xsl:attribute name="scaling">uniform</xsl:attribute>
               </xsl:if>
               <xsl:choose>
                  <xsl:when test="*[contains(@class, ' topic/alt ')]">
                     <xsl:apply-templates select="*[contains(@class, ' topic/alt ')]"
                        mode="graphicAlternateText"/>
                  </xsl:when>
                  <xsl:when test="@alt">
                     <xsl:apply-templates select="@alt" mode="graphicAlternateText"/>
                  </xsl:when>
               </xsl:choose>
               
               <xsl:apply-templates select="
                  node() except (text(),
                  *[contains(@class, ' topic/alt ') or
                  contains(@class, ' topic/longdescref ')])"/>
            </fo:external-graphic>
            
         </xsl:when>
         <xsl:otherwise>
            <fo:external-graphic src="url('{$href}')" xsl:use-attribute-sets="image">
               <!--Setting image height if defined-->
               <xsl:if test="$height">
                  <xsl:attribute name="content-height">
                     <!--The following test was commented out because most people found the behavior
                 surprising.  It used to force images with a number specified for the dimensions
                 *but no units* to act as a measure of pixels, *if* you were printing at 72 DPI.
                 Uncomment if you really want it. -->
                     <xsl:choose>
                        <!--xsl:when test="not(string(number($height)) = 'NaN')">
                        <xsl:value-of select="concat($height div 72,'in')"/>
                      </xsl:when-->
                        <xsl:when test="not(string(number($height)) = 'NaN')">
                           <xsl:value-of select="concat($height, 'px')"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="$height"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:attribute>
               </xsl:if>
               <!--Setting image width if defined-->
               <xsl:if test="$width">
                  <xsl:attribute name="content-width">
                     <xsl:choose>
                        <!--xsl:when test="not(string(number($width)) = 'NaN')">
                        <xsl:value-of select="concat($width div 72,'in')"/>
                      </xsl:when-->
                        <xsl:when test="not(string(number($width)) = 'NaN')">
                           <xsl:value-of select="concat($width, 'px')"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="$width"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:attribute>
               </xsl:if>
               <xsl:if test="not($width) and not($height) and $scale">
                  <xsl:attribute name="content-width">
                     <xsl:value-of select="concat($scale, '%')"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:if test="@scalefit = 'yes' and not($width) and not($height) and not($scale)">
                  <xsl:attribute name="width">100%</xsl:attribute>
                  <xsl:attribute name="height">100%</xsl:attribute>
                  <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
                  <xsl:attribute name="content-height">scale-to-fit</xsl:attribute>
                  <xsl:attribute name="scaling">uniform</xsl:attribute>
               </xsl:if>
               <xsl:choose>
                  <xsl:when test="*[contains(@class, ' topic/alt ')]">
                     <xsl:apply-templates select="*[contains(@class, ' topic/alt ')]"
                        mode="graphicAlternateText"/>
                  </xsl:when>
                  <xsl:when test="@alt">
                     <xsl:apply-templates select="@alt" mode="graphicAlternateText"/>
                  </xsl:when>
               </xsl:choose>
               
               <xsl:apply-templates select="
                  node() except (text(),
                  *[contains(@class, ' topic/alt ') or
                  contains(@class, ' topic/longdescref ')])"/>
            </fo:external-graphic>
            
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
<!-- end of HPE customization -->

<!-- HPE if a paragraph is followed by another paragraph in a list, decrease space-after so it sticks to the preceding list bullet -->
   <xsl:template match="*[contains(@class, ' topic/p ')]">
      <xsl:choose>
         <xsl:when
            test="parent::*[contains(@class, ' topic/li ')] and following-sibling::*[contains(@class, ' topic/p ')]">
            <fo:block xsl:use-attribute-sets="p__inlist__firstpara">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:block>
         </xsl:when>
         <xsl:when
            test="parent::*[contains(@class, ' topic/li ')] and preceding-sibling::*[contains(@class, ' topic/p ')] and not(following-sibling::*)">
            <fo:block xsl:use-attribute-sets="p__inlist__lastpara">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:block>
         </xsl:when>
         <xsl:otherwise>
            <fo:block xsl:use-attribute-sets="p">
               <xsl:call-template name="commonattributes"/>
               <xsl:apply-templates/>
            </fo:block>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
<!-- end of HPE customization -->

<!-- HPE: custom note placement for wider widths in case of danger, caution and warning as well as information and notice. 
      Also added noimage option for notes. -->
   <xsl:template match="*[contains(@class, ' topic/note ')]">
      <xsl:variable name="noteImagePath">
         <xsl:apply-templates select="." mode="setNoteImagePath"/>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="not($noteImagePath = '')">
            <fo:table xsl:use-attribute-sets="note__table">
               <xsl:choose>
                  <xsl:when test="@type = 'important'">
                     <fo:table-column xsl:use-attribute-sets="note__image__column__wider"/>
                     <fo:table-column xsl:use-attribute-sets="note__text__column__wider"/>
                  </xsl:when>   
                  <xsl:when test="@type = 'notice'">
                     <fo:table-column xsl:use-attribute-sets="note__image__column__wider"/>
                     <fo:table-column xsl:use-attribute-sets="note__text__column__wider"/>
                  </xsl:when>                   
                  <xsl:when test="@type = 'warning'">
                     <fo:table-column xsl:use-attribute-sets="note__image__column__wider"/>
                     <fo:table-column xsl:use-attribute-sets="note__text__column__wider"/>
                  </xsl:when>
                  <xsl:when test="@type = 'danger'">
                     <fo:table-column xsl:use-attribute-sets="note__image__column__wider"/>
                     <fo:table-column xsl:use-attribute-sets="note__text__column__wider"/>
                  </xsl:when>
                  <xsl:when test="@type = 'caution'">
                     <fo:table-column xsl:use-attribute-sets="note__image__column__wider"/>
                     <fo:table-column xsl:use-attribute-sets="note__text__column__wider"/>
                  </xsl:when>
                  <!-- add an exception to suppress note image for space-constrained locations -->
                  <xsl:when test="@outputclass = 'noimage'">
                     <fo:table-column xsl:use-attribute-sets="note__image__column__noimage"/>
                     <fo:table-column xsl:use-attribute-sets="note__text__column__noimage"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <fo:table-column xsl:use-attribute-sets="note__image__column"/>
                     <fo:table-column xsl:use-attribute-sets="note__text__column"/>
                  </xsl:otherwise>
               </xsl:choose>
               <fo:table-body>
                  <fo:table-row>
                     <xsl:choose>
                        <xsl:when test="@outputclass = 'noimage'">
                           <fo:table-cell xsl:use-attribute-sets="note__image__entry__noimage">
                              <fo:block/>
                           </fo:table-cell>
                           <fo:table-cell xsl:use-attribute-sets="note__text__entry__noimage">
                              <xsl:apply-templates select="." mode="placeNoteContent"/>
                           </fo:table-cell>

                        </xsl:when>
                        <xsl:otherwise>
                           <fo:table-cell xsl:use-attribute-sets="note__image__entry">
                              <fo:block>
                                 <fo:external-graphic
                                    src="url('{concat($artworkPrefix, $noteImagePath)}')"
                                    xsl:use-attribute-sets="note__image"/>
                              </fo:block>
                           </fo:table-cell>
                           <fo:table-cell xsl:use-attribute-sets="note__text__entry">
                              <xsl:apply-templates select="." mode="placeNoteContent"/>
                           </fo:table-cell>
                        </xsl:otherwise>
                     </xsl:choose>
                  </fo:table-row>
               </fo:table-body>
            </fo:table>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="." mode="placeNoteContent"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
<!-- end of HPE customization -->

<!-- HPE: this template is called by several inline elements and had to be customized for the legacy force-break override -->
   <xsl:template match="*" mode="inlineTextOptionalKeyref">
      <xsl:param name="copyAttributes" as="element()?"/>
      <xsl:param name="keys" select="@keyref" as="attribute()?"/>
      <xsl:param name="contents" as="node()*">
         <!-- Current node can be preprocessed and may not be part of source document, check for root() to ensure key() is resolvable -->
         <xsl:variable name="target" select="
               if (exists(root()) and @href) then
                  key('id', substring(@href, 2))[1]
               else
                  ()" as="element()?"/>
         <xsl:choose>
            <xsl:when
               test="not(normalize-space(.)) and $keys and $target/self::*[contains(@class, ' topic/topic ')]">
               <xsl:apply-templates select="$target/*[contains(@class, ' topic/title ')]/node()"/>
            </xsl:when>
            <!-- HPE: exception for force-break this is the only change added to this template -->
            <xsl:when test="@outputclass = 'force-break'">
               <xsl:call-template name="intersperse-with-zero-spaces">
                  <xsl:with-param name="str" select="."/>
               </xsl:call-template>
            </xsl:when>
            <!-- end of HPE exception. no changes elsewhere. -->
            <xsl:otherwise>
               <xsl:apply-templates/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:param>
      <xsl:variable name="topicref" select="key('map-id', substring(@href, 2))[1]" as="element()?"/>
      <xsl:choose>
         <xsl:when
            test="$keys and @href and not($topicref/ancestor-or-self::*[@linking][1]/@linking = ('none', 'sourceonly'))">
            <fo:basic-link xsl:use-attribute-sets="xref">
               <xsl:sequence select="$copyAttributes/@*"/>
               <xsl:call-template name="commonattributes"/>
               <xsl:call-template name="buildBasicLinkDestination"/>
               <xsl:copy-of select="$contents"/>
            </fo:basic-link>
         </xsl:when>
         <xsl:otherwise>
            <fo:inline>
               <xsl:sequence select="$copyAttributes/@*"/>
               <xsl:call-template name="commonattributes"/>
               <xsl:copy-of select="$contents"/>
            </fo:inline>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
<!-- end of HPE customization -->
   
<!-- HPE customization - draft comment label -->
   <xsl:template match="*[contains(@class,' topic/draft-comment ')]">
      <xsl:if test="$publishRequiredCleanup = 'yes' or $DRAFT='yes'">
         <fo:block xsl:use-attribute-sets="draft-comment">
            <xsl:call-template name="commonattributes"/>
            <fo:block xsl:use-attribute-sets="draft-comment__label">
               <xsl:text>Tech writer comment</xsl:text>
               <xsl:if test="@status">
                  <xsl:text> / </xsl:text>
                  <xsl:text>Status: </xsl:text>
                  <xsl:value-of select="@status"/>                  
               </xsl:if>
            </fo:block>
            <xsl:apply-templates/>
         </fo:block>
      </xsl:if>
   </xsl:template>
<!-- end of HPE customization -->
   
   
<!-- HPE customization for common attributes adding highlight color for deleted elements -->
   <xsl:template name="commonattributes">
      <xsl:apply-templates select="." mode="commonattributes"/>
   </xsl:template>
   <xsl:template match="@* | node()" mode="commonattributes">
      <xsl:apply-templates select="@id"/>
      <!-- start of custom code. Unfortunately styling is hard-coded this way -->
      <xsl:choose>
         <xsl:when test="$DRAFT='yes'">
            <xsl:if test="not(ancestor-or-self::*[contains(@class,' topic/draft-comment ')])">
               <xsl:if test="ancestor-or-self::*[@status = 'new']">
                  <xsl:attribute name="background-color">
                     <xsl:text>#2ad2c9</xsl:text>
                  </xsl:attribute>
               </xsl:if>
               <xsl:if test="ancestor-or-self::*[@status = 'deleted']">
                  <xsl:attribute name="text-decoration">
                     <xsl:text>line-through</xsl:text>
                  </xsl:attribute>
               </xsl:if>
            </xsl:if>
         </xsl:when>
      </xsl:choose>
      <!-- end of custom code -->
      <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-startprop ')] |
         *[contains(@class,' ditaot-d/ditaval-endprop ')]" mode="flag-attributes"/>
      <xsl:apply-templates select="@outputclass"/>
   </xsl:template>
<!-- end of HPE customization -->   
   
</xsl:stylesheet>

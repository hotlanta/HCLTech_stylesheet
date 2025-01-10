<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
   xmlns:ditaarch="http://dita.oasis-open.org/architecture/2005/" xmlns:e="com.hcltech.ctgpdf"
   xmlns:fo="http://www.w3.org/1999/XSL/Format"
   xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
   xmlns:opentopic="http://www.idiominc.com/opentopic" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
   exclude-result-prefixes="xs e dita-ot ditaarch opentopic opentopic-func">


   <!-- HPE customization: footers and headers. Will not comment through each template as they follow the same rules:
      Header is formatted with fo:blocks and dynamically calls document title, chapter title and page number. 
      Footer is formatted with an fo:table and dynamically calls the confidentiality statement and outputs a static HPE logo. 
      Attribute sets correspond to the flow name, but actually reuse the same attribute set throughout the documentation -->

   <xsl:template name="insertBodyOddHeader">
      <fo:static-content flow-name="odd-body-header">
         <fo:block xsl:use-attribute-sets="__body__odd__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Body odd header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <chapter>
                     <fo:block xsl:use-attribute-sets="__header__title__chapter">
                        <fo:retrieve-marker retrieve-class-name="current-header"/>
                     </fo:block>
                  </chapter>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum__body">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertBodyEvenHeader">
      <fo:static-content flow-name="even-body-header">
         <fo:block xsl:use-attribute-sets="__body__even__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Body even header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <chapter>
                     <fo:block xsl:use-attribute-sets="__header__title__chapter">
                        <fo:retrieve-marker retrieve-class-name="current-header"/>
                     </fo:block>
                  </chapter>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum__body">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertBodyFirstHeader">
      <fo:static-content flow-name="first-body-header">
         <fo:block xsl:use-attribute-sets="__body__first__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Body first header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <chapter>
                     <fo:block xsl:use-attribute-sets="__header__title__chapter">
                        <fo:retrieve-marker retrieve-class-name="current-header"/>
                     </fo:block>
                  </chapter>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum__body">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertBodyLastHeader">
      <fo:static-content flow-name="last-body-header">
         <fo:block xsl:use-attribute-sets="__body__last__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Body last header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <chapter>
                     <fo:block xsl:use-attribute-sets="__header__title__chapter">
                        <fo:retrieve-marker retrieve-class-name="current-header"/>
                     </fo:block>
                  </chapter>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum__body">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertBodyOddFooter">
      <fo:static-content flow-name="odd-body-footer">
         <fo:table xsl:use-attribute-sets="__body__odd__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertBodyEvenFooter">
      <fo:static-content flow-name="even-body-footer">
         <fo:table xsl:use-attribute-sets="__body__even__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertBodyFirstFooter">
      <fo:static-content flow-name="first-body-footer">
         <fo:table xsl:use-attribute-sets="__body__first__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
      </fo:static-content>
   </xsl:template>


   <xsl:template name="insertBodyLastFooter">
      <fo:static-content flow-name="last-body-footer">
         <fo:table xsl:use-attribute-sets="__body__last__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertTocOddHeader">
      <fo:static-content flow-name="odd-toc-header">
         <fo:block xsl:use-attribute-sets="__toc__odd__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Toc odd header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>

               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertTocEvenHeader">
      <fo:static-content flow-name="even-toc-header">
         <fo:block xsl:use-attribute-sets="__toc__even__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Toc even header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>

               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertTocFirstHeader">
      <fo:static-content flow-name="first-toc-header">
         <fo:block xsl:use-attribute-sets="__toc__first__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Toc first header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>

               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertTocLastHeader">
      <fo:static-content flow-name="last-toc-header">
         <fo:block xsl:use-attribute-sets="__toc__last__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Toc last header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>

               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertTocOddFooter">
      <fo:static-content flow-name="odd-toc-footer">
         <fo:table xsl:use-attribute-sets="__toc__odd__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertTocEvenFooter">
      <fo:static-content flow-name="even-toc-footer">
         <fo:table xsl:use-attribute-sets="__toc__even__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertTocFirstFooter">
      <fo:static-content flow-name="first-toc-footer">
         <fo:table xsl:use-attribute-sets="__toc__first__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertTocLastFooter">
      <fo:static-content flow-name="last-toc-footer">
         <fo:table xsl:use-attribute-sets="__toc__last__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertPrefaceOddHeader">
      <fo:static-content flow-name="odd-body-header">
         <fo:block xsl:use-attribute-sets="__preface__odd__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Preface odd header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertPrefaceEvenHeader">
      <fo:static-content flow-name="even-body-header">
         <fo:block xsl:use-attribute-sets="__preface__even__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Preface even header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertPrefaceFirstHeader">
      <fo:static-content flow-name="first-body-header">
         <fo:block xsl:use-attribute-sets="__preface__first__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Preface first header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertPrefaceLastHeader">
      <fo:static-content flow-name="last-body-header">
         <fo:block xsl:use-attribute-sets="__preface__last__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Preface last header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertPrefaceOddFooter">
      <fo:static-content flow-name="odd-body-footer">
         <fo:table xsl:use-attribute-sets="__body__first__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertPrefaceEvenFooter">
      <fo:static-content flow-name="even-body-footer">
         <fo:table xsl:use-attribute-sets="__body__even__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>


   <xsl:template name="insertPrefaceFirstFooter">
      <fo:static-content flow-name="first-body-footer">
         <fo:table xsl:use-attribute-sets="__body__first__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertPrefaceLastFooter">
      <fo:static-content flow-name="last-body-footer">
         <fo:table xsl:use-attribute-sets="__body__first__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>

      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertFrontMatterOddHeader">
      <fo:static-content flow-name="odd-frontmatter-header">
         <fo:block xsl:use-attribute-sets="__preface__odd__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Preface odd header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertFrontMatterEvenHeader">
      <fo:static-content flow-name="even-frontmatter-header">
         <fo:block xsl:use-attribute-sets="__preface__even__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Preface even header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertFrontMatterLastHeader">
      <fo:static-content flow-name="last-frontmatter-header">
         <fo:block xsl:use-attribute-sets="__preface__last__header">
            <xsl:call-template name="getVariable">
               <xsl:with-param name="id" select="'Preface last header'"/>
               <xsl:with-param name="params">
                  <title>
                     <fo:block xsl:use-attribute-sets="__header__title">
                        <xsl:apply-templates select="/" mode="dita-ot:title-metadata"/>
                     </fo:block>
                  </title>
                  <folio>
                     <fo:block xsl:use-attribute-sets="__header__pagenum">
                        <xsl:call-template name="getVariable">
                           <xsl:with-param name="id" select="'Page'"/>
                        </xsl:call-template>
                        <fo:page-number/>
                     </fo:block>
                  </folio>
               </xsl:with-param>
            </xsl:call-template>
         </fo:block>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertFrontMatterOddFooter">
      <fo:static-content flow-name="odd-frontmatter-footer">
         <fo:table xsl:use-attribute-sets="__preface__odd__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
      </fo:static-content>
   </xsl:template>

   <xsl:template name="insertFrontMatterEvenFooter">
      <fo:static-content flow-name="even-frontmatter-footer">
         <fo:table xsl:use-attribute-sets="__preface__even__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
      </fo:static-content>
   </xsl:template>


   <xsl:template name="insertFrontMatterLastFooter">
      <fo:static-content flow-name="last-frontmatter-footer">
         <fo:table xsl:use-attribute-sets="__preface__last__footer">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
               <fo:table-row>
                  <fo:table-cell xsl:use-attribute-sets="__footer__text">
                     <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Body first footer'"/>
                        <xsl:with-param name="params">
                           <confidentiality>
                              <fo:block xsl:use-attribute-sets="__footer__confidentiality">
                                 <xsl:apply-templates
                                    select="($map//*[contains(@class, ' topic/permissions ')])[1]"/>
                              </fo:block>
                           </confidentiality>
                        </xsl:with-param>
                     </xsl:call-template>
                  </fo:table-cell>
                  <fo:table-cell xsl:use-attribute-sets="__footer__logo">
                     <fo:block>
                        <fo:external-graphic
                           src="url(Customization/OpenTopic/common/artwork/HCLTechLogo.svg)"/>
                     </fo:block>
                  </fo:table-cell>
               </fo:table-row>
            </fo:table-body>
         </fo:table>
      </fo:static-content>
   </xsl:template>
   <!-- end of HPE customization -->

   <!-- HPE customization to call first / last templates not present in stock DITA-OT code -->

   <xsl:template name="insertTocStaticContents">
      <xsl:call-template name="insertTocOddFooter"/>
      <xsl:if test="$mirror-page-margins">
         <xsl:call-template name="insertTocEvenFooter"/>
      </xsl:if>
      <xsl:call-template name="insertTocOddHeader"/>
      <xsl:if test="$mirror-page-margins">
         <xsl:call-template name="insertTocEvenHeader"/>
      </xsl:if>
      <xsl:call-template name="insertTocFirstHeader"/>
      <xsl:call-template name="insertTocFirstFooter"/>
      <xsl:call-template name="insertTocLastHeader"/>
      <xsl:call-template name="insertTocLastFooter"/>
   </xsl:template>

   <xsl:template name="insertPrefaceStaticContents">
      <xsl:call-template name="insertPrefaceFootnoteSeparator"/>
      <xsl:call-template name="insertPrefaceOddFooter"/>
      <xsl:if test="$mirror-page-margins">
         <xsl:call-template name="insertPrefaceEvenFooter"/>
      </xsl:if>
      <xsl:call-template name="insertPrefaceOddHeader"/>
      <xsl:if test="$mirror-page-margins">
         <xsl:call-template name="insertPrefaceEvenHeader"/>
      </xsl:if>
      <xsl:call-template name="insertPrefaceFirstHeader"/>
      <xsl:call-template name="insertPrefaceFirstFooter"/>
      <xsl:call-template name="insertPrefaceLastHeader"/>
      <xsl:call-template name="insertPrefaceLastFooter"/>
   </xsl:template>
   <!-- end of HPE customization -->

</xsl:stylesheet>

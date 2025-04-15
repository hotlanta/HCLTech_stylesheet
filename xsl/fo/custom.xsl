<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="2.0">
    
    <!-- Disable back cover generation -->
    <xsl:param name="generate-back-cover" select="false()"/>
    
    <!-- Override the createBackCover template to do nothing -->
    <xsl:template name="createBackCover">
        <!-- Empty implementation -->
    </xsl:template>
    
</xsl:stylesheet>
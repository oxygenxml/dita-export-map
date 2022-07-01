<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
  xmlns:oxy="abc">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:variable name="content" select="."/>
        <xsl:for-each select="distinct-values(//file/@path)">
          <xsl:value-of select="oxy:computePath($content, .)"/>
            <xsl:text>
</xsl:text>
        </xsl:for-each>
    </xsl:template>
  
  <!-- There may be cases when profiling and key scopes change the names of files for example
  <file
      src="file:/Users/../tasks/pruning.dita"
      uri="tasks/AAApruning.dita" path="tasks/AAApruning.dita"
      result="../AAApruning.dita"
      format="dita" target="true"/>
  In this case we'll try to take the folder path from the @path attribute and use the file name from the @src attribute.
  -->
  <xsl:function name="oxy:computePath">
    <xsl:param name="context" as="node()"/>
    <xsl:param name="path" as="xs:string"/>
    <xsl:variable name="correspondingFile" select="($context//file[@path = $path])[1]"/>
    <xsl:choose>
      <xsl:when test="$correspondingFile">
        <xsl:variable name="pathNormalized" select="replace($path, '\\', '/')"/>
        <xsl:variable name="srcNormalized" select="replace($correspondingFile/@src, '\\', '/')"/>
        <xsl:variable name="srcFileName" select="tokenize($srcNormalized, '/')[last()]"/>
        <xsl:variable name="pathFileName" select="tokenize($pathNormalized, '/')[last()]"/>
        <xsl:value-of select="concat(substring-before($pathNormalized, $pathFileName), $srcFileName)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$path"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>
</xsl:stylesheet>
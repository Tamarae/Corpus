<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                xmlns:kiln="http://www.kcl.ac.uk/artshums/depts/ddh/kiln/ns/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="response" mode="text-index">
    <table class="tablesorter">
      <thead>
        <tr>
          <!-- Let us assume that all texts have a filename, ID, and
               title. -->

          <th>
            <i18n:text i18n:key="filename">Filename/ID</i18n:text>
          </th>
           
         <!--  <th>ID</th>

            <th>
              <i18n:text i18n:key="language">Language</i18n:text>
            </th>
          --> 
          <th>
            <i18n:text i18n:key="file_title">Title</i18n:text>
          </th>
         
          <xsl:if test="result/doc/arr[@name='editor']/str">
            <th>
              <i18n:text i18n:key="editor">Editor</i18n:text>
            </th>
          </xsl:if>

        </tr>
        
      </thead>
      
      <tbody>
        <xsl:apply-templates mode="text-index" select="result" />
      </tbody>
    </table>
  </xsl:template>


  <xsl:template match="result/doc" mode="text-index">
    <tr>
      <xsl:apply-templates mode="text-index" select="str[@name='file_path']" />
     <!--  <xsl:apply-templates mode="text-index" select="str[@name='document_id']" />
      <xsl:apply-templates mode="text-index" select="arr[@name='language_code']"/>-->
      <xsl:apply-templates mode="text-index" select="arr[@name='document_title']" /> 
      <xsl:apply-templates mode="text-index" select="arr[@name='editor']" />
      
     
    </tr>
  </xsl:template>

  <xsl:template match="str[@name='file_path']" mode="text-index">
    <xsl:variable name="filename" select="substring-after(., '/')" />
    <td>
      <a href="{kiln:url-for-match($match_id, ($language, $filename), 0)}">
        <xsl:value-of select="$filename" />
      </a>
    </td>
  </xsl:template>

<!-- <xsl:template match="str[@name='language_code']" mode="text-index">
  <td>
    <xsl:value-of select="string()"/>
  </td>
</xsl:template>
 -->
 <!--  <xsl:template match="str[@name='document_id']" mode="text-index">
    <td>
      <xsl:value-of select="." />
    </td>
  </xsl:template>
   -->
  
  <xsl:template match="arr[@name='document_title']" mode="text-index">
    <td>
      <xsl:value-of select="string-join(str, '; ')" />
    </td>
  </xsl:template>

  <xsl:template match="arr[@name='editor']" mode="text-index">
    <td>
      <xsl:value-of select="string-join(str, '; ')" />
    </td>
  </xsl:template>
  
 
</xsl:stylesheet>

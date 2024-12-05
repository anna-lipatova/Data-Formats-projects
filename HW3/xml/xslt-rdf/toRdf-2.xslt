<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />
    <xsl:variable name="prefix">http://example.org/</xsl:variable>

    <xsl:template match="Addresses">
        @prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
        @prefix tro: &lt;https://w3id.org/TRO#&gt; .
        @prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
        @prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
        @prefix ex: &lt;http://purl.org/net/ns/ex#&gt; .
        @prefix sealit: &lt;http://www.sealitproject.eu/ontology/&gt; .
        @prefix schema: &lt;http://schema.org/&gt; .
        @prefix cpmeta: &lt;http://meta.icos-cp.eu/ontologies/cpmeta/&gt; .
        @prefix juso: &lt;http://rdfs.co/juso/&gt; .
        @prefix dpv: &lt;https://w3id.org/dpv#&gt; .
        @prefix mads: &lt;http://www.loc.gov/mads/rdf/v1#&gt; .
        @prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .


        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="Address">
        &lt;<xsl:value-of select="concat($prefix, 'address/', City)"/>&gt; a juso:Address;
        schema:addressLocality &quot;<xsl:value-of select="City"/>&quot;@<xsl:value-of select="City/@xml:lang"/>;
        schema:streetAddress &quot;<xsl:value-of select="Street"/>&quot;@<xsl:value-of select="Street/@xml:lang"/>;
        juso:postal_code &quot;<xsl:value-of select="Zip_code"/>&quot;.
    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>
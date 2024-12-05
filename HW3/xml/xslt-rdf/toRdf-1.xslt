<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:variable name="prefix">http://example.org/</xsl:variable>

    <xsl:template match="/">
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


        <xsl:apply-templates select="StoreBranches"/>
        <xsl:apply-templates select="StoreBranches/StoreBranch/CashRegisters"/>
    </xsl:template>


    <xsl:template match="StoreBranch">
        &lt;<xsl:value-of select="@StoreBranchId"/>&gt; a ex:StoreBranch;
        juso:name &quot;<xsl:value-of select="Name"/>&quot;@<xsl:value-of select="Name/@xml:lang"/>;
        ex:has_warehouse <xsl:value-of select="has_warehouse"/>;
        cpmeta:locatedAt &lt;$prefix/<xsl:value-of select="Address/City"/>&gt; .
    </xsl:template>

    <xsl:template match="CashRegister">
        &lt;<xsl:value-of select="@CashRegisterId"/>&gt; a ex:CashRegister;
        schema:identifier <xsl:value-of select="Number"/>;
        ex:isSelfCheckout <xsl:value-of select="Is_self_checkout"/>;
        cpmeta:locatedAt &lt;<xsl:value-of select="ancestor::StoreBranch[1]/@StoreBranchId"/>&gt; ;
        ex:operated_by &lt;<xsl:value-of select="Employee/@EmployeeId"/>&gt; .
    </xsl:template>


    <xsl:template match="text()"/>

</xsl:stylesheet>

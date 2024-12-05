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


        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="Customers/Customer">
        &lt;<xsl:value-of select="@CustomerId"/>&gt; a dpv:Customer;
        foaf:givenName &quot;<xsl:value-of select="Given_name"/>&quot;@<xsl:value-of select="Given_name/@xml:lang"/>;
        foaf:familyName &quot;<xsl:value-of select="Family_name"/>&quot;@<xsl:value-of select="Family_name/@xml:lang"/>;
        mads:birthDate &quot;<xsl:value-of select="Birth_date"/>&quot;^^xsd:date;
        foaf:phone &lt;<xsl:value-of select="Phone_number"/>&gt;;
        ex:shopsAt &lt;<xsl:value-of select="StoreBranch/@StoreBranchId"/>&gt;;
        ex:hasLoyaltyCard &lt;<xsl:value-of select="LoyaltyCard/@ProgramMembershipId"/>&gt;.

        &lt;<xsl:value-of select="LoyaltyCard/@ProgramMembershipId"/>&gt; a schema:ProgramMembership;
        schema:membershipPointsEarned <xsl:value-of select="LoyaltyCard/MembershipPointsEarned"/>;
        schema:identifier <xsl:value-of select="LoyaltyCard/Identifier"/> .
    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>

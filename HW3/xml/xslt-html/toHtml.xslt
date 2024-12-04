<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    <xsl:template match="/">
        <html>
            <head>
                <title>Filtered Store Branches</title>
                <style>
                    th, td { border: 1px solid black; padding: 5px; }
                </style>
            </head>
            <body>
                <h1>Filtered Store Branches</h1>
                <table>
                    <tr>
                        <th>Store Name</th>
                        <th>Customer Names</th>
                        <th>Count of Self-Checkout Registers</th>
                    </tr>
                    <xsl:apply-templates select="StoreBranches/StoreBranch[count(Customers/Customer) >= 1]"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="StoreBranch">
        <tr>
            <td>
                <xsl:value-of select="Name"/>
            </td>
            <td>
                <xsl:apply-templates select="Customers/Customer"/>
            </td>
            <td>
                <xsl:value-of select="count(CashRegisters/CashRegister[Is_self_checkout = 'true'])"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="Customer">
        <xsl:value-of select="concat(Given_name, ' ', Family_name)"/>
        <xsl:if test="position() != last()">,</xsl:if>
    </xsl:template>
</xsl:stylesheet>
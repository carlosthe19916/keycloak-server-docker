<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="urn:jboss:domain:datasources:4.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="//ds:subsystem/ds:datasources">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <ds:datasource jndi-name="java:jboss/datasources/OpenfactDS" pool-name="OpenfactDS" enabled="true"
                           use-java-context="true" use-ccm="true">
                <ds:connection-url>jdbc:h2:${jboss.server.data.dir}/openfact;AUTO_SERVER=TRUE</ds:connection-url>
                <ds:driver>h2</ds:driver>
                <ds:security>
                    <ds:user-name>sa</ds:user-name>
                    <ds:password>sa</ds:password>
                </ds:security>
            </ds:datasource>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
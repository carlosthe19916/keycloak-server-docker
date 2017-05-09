<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:kc="urn:jboss:domain:keycloak:1.1">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="//kc:subsystem">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <kc:secure-deployment name="openfact.war">
                <kc:realm>openfact</kc:realm>
                <kc:bearer-only>true</kc:bearer-only>
                <kc:auth-server-url>http://${env.KEYCLOAK_PORT_8080_TCP_ADDR}:${env.KEYCLOAK_PORT_8080_TCP_PORT:8080}/auth</kc:auth-server-url>
                <kc:ssl-required>external</kc:ssl-required>
                <kc:resource>openfact</kc:resource>
                <kc:use-resource-role-mappings>true</kc:use-resource-role-mappings>
                <kc:enable-cors>true</kc:enable-cors>
            </kc:secure-deployment>
        </xsl:copy>
    </xsl:template>

    <!-- Copy everything else. -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
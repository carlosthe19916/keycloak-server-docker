<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:kc="urn:jboss:domain:keycloak:1.1">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="//kc:subsystem">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <kc:secure-deployment name="openfact.war">
                <kc:realm>${env.KEYCLOAK_REALM:openfact}</kc:realm>
                <kc:bearer-only>${env.KEYCLOAK_BEARER_ONLY:true}</kc:bearer-only>
                <kc:auth-server-url>${env.KEYCLOAK_AUTH_SERVER_URL:http://openfact.org/auth}</kc:auth-server-url>
                <kc:ssl-required>${env.KEYCLOAK_SSL_REQUIRED:external}</kc:ssl-required>
                <kc:resource>${env.KEYCLOAK_RESOURCE:openfact}</kc:resource>
                <kc:use-resource-role-mappings>${env.KEYCLOAK_USE_RESOURCE_ROLE_MAPPINGS:true}</kc:use-resource-role-mappings>
                <kc:enable-cors>${env.KEYCLOAK_ENABLE_CORS:true}</kc:enable-cors>
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
<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="urn:jboss:domain:datasources:4.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="//ds:subsystem[@xmlns='urn:jboss:domain:keycloak:1.1']/ds:secure-deployment[@name='openfact.war']">
        <ds:secure-deployment name="openfact.war">
            <ds:realm>${env.OPENFACT_KC_REALM}</ds:realm>
            <ds:bearer-only>${env.OPENFACT_KC_BEARER_ONLY}</ds:bearer-only>
            <ds:auth-server-url>${env.OPENFACT_KC_AUTH_SERVER_URL}</ds:auth-server-url>
            <ds:ssl-required>${env.OPENFACT_KC_SSL_REQUIRED}</ds:ssl-required>
            <ds:resource>${env.OPENFACT_KC_RESOURCE}</ds:resource>
            <ds:use-resource-role-mappings>${env.OPENFACT_KC_USE_RESOURCE_ROLE_MAPPINGS}</ds:use-resource-role-mappings>
            <ds:enable-cors>${env.OPENFACT_KC_ENABLE_CORS}</ds:enable-cors>
        </ds:secure-deployment>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
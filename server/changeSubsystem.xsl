<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:kc="urn:jboss:domain:keycloak:1.1">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="//kc:subsystem/kc:secure-deployment[@name='openfact.war']">
        <kc:secure-deployment name="openfact.war">
            <kc:realm>${env.OPENFACT_KC_REALM.openfact}</kc:realm>
            <kc:bearer-only>${env.OPENFACT_KC_BEARER_ONLY.true}</kc:bearer-only>
            <kc:auth-server-url>${env.OPENFACT_KC_AUTH_SERVER_URL.http://openfact.org/auth}</kc:auth-server-url>
            <kc:ssl-required>${env.OPENFACT_KC_SSL_REQUIRED.external}</kc:ssl-required>
            <kc:resource>${env.OPENFACT_KC_RESOURCE.openfact}</kc:resource>
            <kc:use-resource-role-mappings>${env.OPENFACT_KC_USE_RESOURCE_ROLE_MAPPINGS.true}</kc:use-resource-role-mappings>
            <kc:enable-cors>${env.OPENFACT_KC_ENABLE_CORS.true}</kc:enable-cors>
        </kc:secure-deployment>
    </xsl:template>

    <!-- Copy everything else. -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
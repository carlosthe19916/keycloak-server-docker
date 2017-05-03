<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="urn:jboss:domain:datasources:2.0"
                xmlns:kc="urn:jboss:domain:keycloak:1.1">

    <xsl:output method="xml" indent="yes"/>

    <!-- Replace the old datasource with the new. -->
    <xsl:template match="//ds:subsystem/ds:datasources/ds:datasource[@jndi-name='java:jboss/datasources/ExampleDS']">
        <ds:datasource jndi-name="java:jboss/datasources/OpenfactDS" pool-name="OpenfactDS" enabled="true" jta="true" use-java-context="true">
            <ds:connection-url>jdbc:h2:mem:openfact;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE</ds:connection-url>
            <ds:driver>h2</ds:driver>
            <ds:security>
                <ds:user-name>sa</ds:user-name>
                <ds:password>sa</ds:password>
            </ds:security>
        </ds:datasource>
    </xsl:template>

    <xsl:template match="//kc:subsystem">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <kc:secure-deployment name="openfact.war">
                <kc:realm>${env.OPENFACT_KC_REALM.openfact}</kc:realm>
                <kc:bearer-only>${env.OPENFACT_KC_BEARER_ONLY.true}</kc:bearer-only>
                <kc:auth-server-url>${env.OPENFACT_KC_AUTH_SERVER_URL.http://openfact.org/auth}</kc:auth-server-url>
                <kc:ssl-required>${env.OPENFACT_KC_SSL_REQUIRED.external}</kc:ssl-required>
                <kc:resource>${env.OPENFACT_KC_RESOURCE.openfact}</kc:resource>
                <kc:use-resource-role-mappings>${env.OPENFACT_KC_USE_RESOURCE_ROLE_MAPPINGS.true}</kc:use-resource-role-mappings>
                <kc:enable-cors>${env.OPENFACT_KC_ENABLE_CORS.true}</kc:enable-cors>
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
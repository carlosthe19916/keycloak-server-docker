<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="urn:jboss:domain:datasources:4.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="//ds:subsystem/ds:datasources/ds:datasource[@jndi-name='java:jboss/datasources/KeycloakDS']">
        <ds:datasource jndi-name="java:jboss/datasources/KeycloakDS" pool-name="KeycloakDS" enabled="true" use-java-context="true" use-ccm="true">            
            <ds:connection-url>jdbc:mysql://${env.DB_ADDR:mysql}:${env.DB_PORT:3306}/${env.MYSQL_DATABASE:keycloak}</ds:connection-url>
            <ds:driver>mysql</ds:driver>
            <ds:security>
                <ds:user-name>${env.DB_USERNAME:keycloak}</ds:user-name>
                <ds:password>${env.DB_PASSWORD:password}</ds:password>
            </ds:security>
            <xsl:if test="${env.DB_MIN_POOL_SIZE} && ${env.DB_MAX_POOL_SIZE}">
                <ds:pool>
                    <ds:min-pool-size>${env.DB_MIN_POOL_SIZE}</ds:min-pool-size>
                    <ds:max-pool-size>${env.DB_MAX_POOL_SIZE}</ds:max-pool-size>
                </ds:pool>
            </xsl:if>
            <xsl:if test="${env.DB_TX_ISOLATION}">
                <ds:transaction-isolation>${env.DB_TX_ISOLATION}</ds:transaction-isolation>
            </xsl:if>
            <ds:validation>
                <ds:check-valid-connection-sql>SELECT 1</ds:check-valid-connection-sql>
                <ds:background-validation>true</ds:background-validation>
                <ds:background-validation-millis>60000</ds:background-validation-millis>
            </ds:validation>
            <ds:pool>
                <ds:flush-strategy>IdleConnections</ds:flush-strategy>
            </ds:pool>
        </ds:datasource>
    </xsl:template>

    <xsl:template match="//ds:subsystem/ds:datasources/ds:drivers">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <ds:driver name="mysql" module="com.mysql.jdbc">
                <ds:xa-datasource-class>com.mysql.jdbc.jdbc2.optional.MysqlXADataSource</ds:xa-datasource-class>
            </ds:driver>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>


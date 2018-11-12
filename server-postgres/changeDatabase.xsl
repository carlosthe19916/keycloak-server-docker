<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="urn:jboss:domain:datasources:5.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="//ds:subsystem/ds:datasources/ds:datasource[@jndi-name='java:jboss/datasources/OpenfactDS']">
        <ds:datasource jndi-name="java:jboss/datasources/OpenfactDS" enabled="true" use-java-context="true" pool-name="OpenfactDS" use-ccm="true">
            <ds:connection-url>jdbc:postgresql://${env.DB_ADDR:postgres}:${env.DB_PORT:5432}/${env.DB_DATABASE:openfact}</ds:connection-url>
            <ds:driver>postgresql</ds:driver>
            <ds:security>
                <ds:user-name>${env.DB_USERNAME:openfact}</ds:user-name>
                <ds:password>${env.DB_PASSWORD:password}</ds:password>
            </ds:security>
            <ds:pool>
                <ds:min-pool-size>${env.DS_MIN_POOL_SIZE:0}</ds:min-pool-size>
                <ds:max-pool-size>${env.DS_MAX_POOL_SIZE:20}</ds:max-pool-size>
                <ds:flush-strategy>${env.DS_POOL_FLUSH_STRATEGY:FailingConnectionOnly}</ds:flush-strategy>
            </ds:pool>
            <ds:transaction-isolation>${env.DS_TX_ISOLATION:TRANSACTION_READ_COMMITTED}</ds:transaction-isolation>
            <ds:validation>
                <ds:check-valid-connection-sql>SELECT 1</ds:check-valid-connection-sql>
                <ds:background-validation>true</ds:background-validation>
                <ds:background-validation-millis>60000</ds:background-validation-millis>
            </ds:validation>            
        </ds:datasource>
    </xsl:template>

    <xsl:template match="//ds:subsystem/ds:datasources/ds:drivers">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
            <ds:driver name="postgresql" module="org.postgresql.jdbc">
                <ds:xa-datasource-class>org.postgresql.xa.PGXADataSource</ds:xa-datasource-class>
            </ds:driver>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>

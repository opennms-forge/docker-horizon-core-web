<?xml version="1.0" encoding="UTF-8"?>

<!-- DO NOT CHANGE THIS FILE! GENERATED FROM confd -->

<datasource-configuration xmlns:this="http://xmlns.opennms.org/xsd/config-datasources"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.opennms.org/xsd/config-datasources
  http://www.opennms.org/xsd/config-datasources.xsd ">
  
  <!--
    Available implementations:

      org.opennms.core.db.AtomikosDataSourceFactory
        - Uses Atomikos TransactionEssentials (http://www.atomikos.com/Main/TransactionsEssentials)
          This data source is XA-capable so that it works properly with Hibernate 4.

      org.opennms.core.db.C3P0ConnectionFactory
        - Uses C3P0 (http://sourceforge.net/projects/c3p0/).
          This data source is not XA-capable but is available because it was the default
          datasource on OpenNMS 1.12. It is well tested as a reliable database pool.

      org.opennms.core.db.HikariCPConnectionFactory
        - Uses HikariCP (http://brettwooldridge.github.io/HikariCP/), a lightweight and extremely fast connection pool
   -->
  {{$db := "/database" -}}
  {{$pg := "/postgres" -}}
  <connection-pool factory="{{getv (print $db "/connection-pool/factory") "org.opennms.core.db.C3P0ConnectionFactory"}}"
    idleTimeout="{{getv (print $db "/connection-pool/idle-timeout") "600"}}"
    loginTimeout="{{getv (print $db "/connection-pool/login-timeout") "3"}}"
    minPool="{{getv (print $db "/connection-pool/min-pool") "50"}}"
    maxPool="{{getv (print $db "/connection-pool/max-pool") "50"}}"
    maxSize="{{getv (print $db "/connection-pool/max-size") "50"}}" />

  <jdbc-data-source name="opennms"
                    database-name="{{getv (print $db "/name") "opennms"}}"
                    class-name="org.postgresql.Driver"
                    url="jdbc:postgresql://{{getv (print $pg "/host") "127.0.0.1"}}:{{getv (print $pg "/port") "5432"}}/{{getv (print $db "/name") "opennms"}}"
                    user-name="{{getv (print $db "/user") "opennms"}}"
                    password="{{getv (print $db "/password") "opennms"}}" />

  <jdbc-data-source name="opennms-admin"
                    database-name="template1"
                    class-name="org.postgresql.Driver"
                    url="jdbc:postgresql://{{getv (print $pg "/host") "127.0.0.1"}}:{{getv (print $pg "/port") "5432"}}/template1"
                    user-name="{{getv (print $pg "/user") "postgres"}}"
                    password="{{getv (print $pg "/password") "postgres"}}" />
</datasource-configuration>

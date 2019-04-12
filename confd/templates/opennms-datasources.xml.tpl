<?xml version="1.0" encoding="UTF-8"?>
<datasource-configuration xmlns:this="http://xmlns.opennms.org/xsd/config/opennms-datasources"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.opennms.org/xsd/config/opennms-datasources
  http://www.opennms.org/xsd/config/opennms-datasources.xsd ">

  <!-- DO NOT CHANGE THIS FILE! GENERATED FROM confd -->
  
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
  <connection-pool factory="{{getv "/opennms/database/connection-pool/factory" "org.opennms.core.db.C3P0ConnectionFactory"}}"
    idleTimeout="{{getv "/opennms/database/connection-pool/idletimeout" "600"}}"
    loginTimeout="{{getv "/opennms/database/connection-pool/logintimeout" "3"}}"
    minPool="{{getv "/opennms/database/connection-pool/minpool" "50"}}"
    maxPool="{{getv "/opennms/database/connection-pool/maxpool" "50"}}"
    maxSize="{{getv "/opennms/database/connection-pool/maxsize" "50"}}" />

  <jdbc-data-source name="opennms"
                    database-name="{{getv "/opennms/database/name"}}"
                    class-name="org.postgresql.Driver"
                    url="jdbc:postgresql://{{getv "/postgres/host"}}:{{getv "/postgres/port" "5432"}}/{{getv "/opennms/database/name"}}"
                    user-name="{{getv "/opennms/database/user"}}"
                    password="{{getv "/opennms/database/password"}}" />

  <jdbc-data-source name="opennms-admin"
                    database-name="template1"
                    class-name="org.postgresql.Driver"
                    url="jdbc:postgresql://{{getv "/postgres/host"}}:{{getv "/postgres/port" "5432"}}/template1"
                    user-name="{{getv "/postgres/user"}}"
                    password="{{getv "/postgres/password"}}" />
</datasource-configuration>

<!--
    Licensed to the Apache Software Foundation (ASF) under one or more
    contributor license agreements.  See the NOTICE file distributed with
    this work for additional information regarding copyright ownership.
    The ASF licenses this file to You under the Apache License, Version 2.0
    (the "License"); you may not use this file except in compliance with
    the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-->

<!-- DO NOT CHANGE THIS FILE! GENERATED FROM confd -->

<beans
  xmlns="http://www.springframework.org/schema/beans"
  xmlns:amq="http://activemq.apache.org/schema/core"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
  http://activemq.apache.org/schema/core http://activemq.apache.org/schema/core/activemq-core.xsd">

    <!-- Allows us to use system properties as variables in this configuration file -->
    <bean class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
        <property name="systemPropertiesModeName" value="SYSTEM_PROPERTIES_MODE_OVERRIDE" />
        <!-- By default, use the data/tmp/activemq directory for on-disk storage -->
        <property name="properties">
             <value>
                 activemq.data=${opennms.home}/data/tmp/activemq
             </value>
        </property>
    </bean>

    <!--
        The <broker> element is used to configure the ActiveMQ broker.
    -->
    <broker xmlns="http://activemq.apache.org/schema/core" brokerName="localhost" dataDirectory="${activemq.data}" deleteAllMessagesOnStartup="{{getv "/activemq/broker/delete-all-messages-on-startup" "false"}}">
        <plugins>
          <bean id="openNMSJaasBrokerPlugin" class="org.opennms.netmgt.activemq.auth.OpenNMSJaasBrokerPlugin" xmlns="http://www.springframework.org/schema/beans" />

          <authorizationPlugin>
            <map>
              <authorizationMap>
                <authorizationEntries>
                  {{$auth := "/activemq/authorization-entry" -}}
                  <!-- Users in the admin role can read/write/create any queue/topic -->
                  <authorizationEntry queue=">" read="{{getv (print $auth "/queue/read") "admin"}}" write="{{getv (print $auth "/queue/write") "admin"}}" admin="{{getv (print $auth "/queue/admin") "admin"}}" />
                  <authorizationEntry topic=">" read="{{getv (print $auth "/topic/read") "admin"}}" write="{{getv (print $auth "/topic/write") "admin"}}" admin="{{getv (print $auth "/topic/admin") "admin"}}" />
                  <!-- Users in the minion role can write/create queues that are not keyed by location -->
                  <authorizationEntry queue="{{getv (print $auth "/queue/prefix") "OpenNMS"}}.*.*" write="{{getv (print $auth "/queue/write") "minion"}}" admin="{{getv (print $auth "/queue/admin") "minion"}}" />
                  <!-- Users in the minion role can read/create from queues that are keyed by location -->
                  <authorizationEntry queue="{{getv (print $auth "/queue/prefix") "OpenNMS"}}.*.*.*" read="{{getv (print $auth "/queue/read") "minion"}}" admin="{{getv (print $auth "/queue/admin") "minion"}}" />
                  <!-- Users in the minion role can read/write/create advisory topics -->
                  <authorizationEntry topic="ActiveMQ.Advisory.>" read="{{getv (print $auth "/topic/activemq/advisory/read") "minion"}}" write="{{getv (print $auth "/topic/activemq-advisory/write") "minion"}}" admin="{{getv (print $auth "/topic/activemq-advisory/admin") "minion"}}" />
                </authorizationEntries>
                <!-- Allow all users to read/write/create temporary destinations (by omitting a <tempDestinationAuthorizationEntry>) -->
              </authorizationMap>
            </map>
          </authorizationPlugin>
        </plugins>

        <!--
            For better performances use VM cursor and small memory limit.
            For more information, see:

            http://activemq.apache.org/message-cursors.html

            Also, if your producer is "hanging", it is probably due to producer flow control.
            For more information, see:
            http://activemq.apache.org/producer-flow-control.html
        -->

        <destinationPolicy>
            <policyMap>
              <policyEntries>
                <policyEntry topic=">" producerFlowControl="true">
                    <!-- The constantPendingMessageLimitStrategy is used to prevent
                         slow topic consumers to block producers and affect other consumers
                         by limiting the number of messages that are retained
                         For more information, see:

                         http://activemq.apache.org/slow-consumer-handling.html

                    -->
                  <pendingMessageLimitStrategy>
                    <constantPendingMessageLimitStrategy limit="1000"/>
                  </pendingMessageLimitStrategy>
                </policyEntry>
                <policyEntry queue=">" producerFlowControl="true" memoryLimit="1mb">
                  <!-- Use VM cursor for better latency
                       For more information, see:

                       http://activemq.apache.org/message-cursors.html

                  <pendingQueuePolicy>
                    <vmQueueCursor/>
                  </pendingQueuePolicy>
                  -->
                  <!--
                    Change the dead-letter strategy to discard messages instead
                    of storing them in the DLQ. You can comment out this policyEntry
                    to reenable the DLQ for troubleshooting.
                  -->
                  <deadLetterStrategy>
                    <discarding/>
                  </deadLetterStrategy>
                </policyEntry>
              </policyEntries>
            </policyMap>
        </destinationPolicy>


        <!--
            The managementContext is used to configure how ActiveMQ is exposed in
            JMX. By default, ActiveMQ uses the MBean server that is started by
            the JVM. For more information, see:

            http://activemq.apache.org/jmx.html
        -->
        <managementContext>
            <managementContext createConnector="false"/>
        </managementContext>

        <!--
            Configure message persistence for the broker. The default persistence
            mechanism is the KahaDB store (identified by the kahaDB tag).
            For more information, see:

            http://activemq.apache.org/persistence.html
        -->
        <persistenceAdapter>
            <kahaDB directory="${activemq.data}/kahadb"/>
        </persistenceAdapter>


          <!--
            The systemUsage controls the maximum amount of space the broker will
            use before slowing down producers. For more information, see:
            http://activemq.apache.org/producer-flow-control.html
            If using ActiveMQ embedded - the following limits could safely be used:
        -->
        <systemUsage>
            <systemUsage>
                {{$usage := "/activemq/system-usage" -}}
                <memoryUsage>
                    <memoryUsage limit="{{getv (print $usage "/memory") "128 mb"}}"/>
                </memoryUsage>
                <storeUsage>
                    <storeUsage limit="{{getv (print $usage "/storage") "1 gb"}}"/>
                </storeUsage>
                <tempUsage>
                    <tempUsage limit="{{getv (print $usage "/temp") "1 gb"}}"/>
                </tempUsage>
            </systemUsage>
        </systemUsage>

        <!--
            The transport connectors expose ActiveMQ over a given protocol to
            clients and other brokers. For more information, see:

            http://activemq.apache.org/configuring-transports.html
        -->
        <transportConnectors>
            <transportConnector name="vm" uri="vm://localhost"/>
            <!-- Uncomment this line to allow external TCP connections -->
            <!--
              WARNING: Access to port 61616 should be firewalled to prevent unauthorized injection
              of data into OpenNMS when this port is open.
            -->
            {{if or (and (exists "/activemq/broker/disable") (ne (getv "/activemq/broker/disable" "") ("true")))}}
            <transportConnector name="openwire" uri="tcp://0.0.0.0:61616?useJmx=false&amp;maximumConnections=1000&amp;wireformat.maxFrameSize=104857600"/>
            {{end}}

            <!-- Uncomment this line to allow localhost TCP connections (for testing purposes) -->
            <!-- <transportConnector name="openwire" uri="tcp://127.0.0.1:61616?useJmx=false&amp;maximumConnections=1000&amp;wireformat.maxFrameSize=104857600"/> -->
        </transportConnectors>

        <!-- destroy the spring context on shutdown to stop jetty -->
        <shutdownHooks>
            <bean xmlns="http://www.springframework.org/schema/beans" class="org.apache.activemq.hooks.SpringContextHook" />
        </shutdownHooks>

    </broker>

    <!--
        Enable web consoles, REST and Ajax APIs and demos

        Take a look at ${ACTIVEMQ_HOME}/conf/jetty.xml for more details
    -->
    <!--<import resource="jetty.xml"/> -->

</beans>

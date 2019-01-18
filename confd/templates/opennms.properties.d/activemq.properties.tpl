#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/jms/timeout"}}
org.opennms.jms.timeout={{getv "/jms/timeout"}}
{{end}}
{{if exists "/activemq/broker/disable"}}
org.opennms.activemq.broker.disable={{getv "/activemq/broker/disable"}}
{{end}}
{{if exists "/activemq/broker/url"}}
org.opennms.activemq.broker.url={{getv "/activemq/broker/url"}}
{{end}}
{{if exists "/activemq/broker/username"}}
org.opennms.activemq.broker.username={{getv "/activemq/broker/username"}}
{{end}}
{{if exists "/activemq/broker/password"}}
org.opennms.activemq.broker.password={{getv "/activemq/broker/password"}}
{{end}}
{{if exists "/activemq/client/max-connections"}}
org.opennms.activemq.client.max-connections={{getv "/activemq/client/max-connections"}}
{{end}}
{{if exists "/activemq/client/concurrent-consumers"}}
org.opennms.activemq.client.concurrent-consumers={{getv "/activemq/client/concurrent-consumers"}}
{{end}}

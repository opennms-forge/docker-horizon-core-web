#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
org.opennms.netmgt.jetty.port={{getv "/jetty/port" "8980"}}
{{if exists "/jetty/ajpport"}}
org.opennms.netmgt.jetty.ajp-port={{getv "/jetty/ajpport"}}
{{end}}
{{if exists "/jetty/host"}}
org.opennms.netmgt.jetty.host={{getv "/jetty/host"}}
{{end}}
{{if exists "/jetty/enable/request/logging"}}
org.opennms.netmgt.jetty.enableRequestLogging={{getv "/jetty/enable/request/logging"}}
{{end}}
{{if exists "/jetty/server/request/max/form/content/size"}}
org.eclipse.jetty.server.Request.maxFormContentSize={{getv "/jetty/server/request/max/form/content/size"}}
{{end}}
{{if exists "/jetty/request/header/size"}}
org.opennms.netmgt.jetty.requestHeaderSize={{getv "/jetty/request/header/size"}}
{{end}}
org.eclipse.jetty.server.Request.maxFormKeys={{getv "/jetty/server/request/max/form/keys" "2000"}}
{{if exists "/jetty/https/port"}}
org.opennms.netmgt.jetty.https-port={{getv "/jetty/https/port"}}
{{end}}
{{if exists "/jetty/https/host"}}
org.opennms.netmgt.jetty.https-host={{getv "/jetty/https/host"}}
{{end}}
{{if exists "/jetty/https/keystore"}}
org.opennms.netmgt.jetty.https-keystore={{getv "/jetty/https/keystore"}}
{{end}}
{{if exists "/jetty/https/keystore/password"}}
org.opennms.netmgt.jetty.https-keystorepassword={{getv "/jetty/https/keystore/password"}}
{{end}}
{{if exists "/jetty/https/keypassword"}}
org.opennms.netmgt.jetty.https-keypassword={{getv "/jetty/https/keypassword"}}
{{end}}
{{if exists "/web/baseurl"}}
opennms.web.base-url={{getv "/web/baseurl"}}
{{end}}

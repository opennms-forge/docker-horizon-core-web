#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
org.opennms.netmgt.jetty.port={{getv "/jetty/port" "8980"}}
{{if exists "/jetty/ajp-port"}}
org.opennms.netmgt.jetty.ajp-port={{getv "/jetty/ajp-port"}}
{{end}}
{{if exists "/jetty/host"}}
org.opennms.netmgt.jetty.host={{getv "/jetty/host"}}
{{end}}
{{if exists "/jetty/enablerequestlogging"}}
org.opennms.netmgt.jetty.enableRequestLogging={{getv "/jetty/enablerequestlogging"}}
{{end}}
{{if exists "/jetty/server/request/maxformcontentsize"}}
org.eclipse.jetty.server.Request.maxFormContentSize={{getv "/jetty/server/request/maxformcontentsize"}}
{{end}}
{{if exists "/jetty/requestheadersize"}}
org.opennms.netmgt.jetty.requestHeaderSize={{getv "/jetty/requestheadersize"}}
{{end}}
org.eclipse.jetty.server.Request.maxFormKeys={{getv "/jetty/server/request/maxformkeys" "2000"}}
{{if exists "/jetty/https-port"}}
org.opennms.netmgt.jetty.https-port={{getv "/jetty/https-port"}}
{{end}}
{{if exists "/jetty/https-host"}}
org.opennms.netmgt.jetty.https-host={{getv "/jetty/https-host"}}
{{end}}
{{if exists "/jetty/https-keystore"}}
org.opennms.netmgt.jetty.https-keystore={{getv "/jetty/https-keystore"}}
{{end}}
{{if exists "/jetty/https-keystorepassword"}}
org.opennms.netmgt.jetty.https-keystorepassword={{getv "/jetty/https-keystorepassword"}}
{{end}}
{{if exists "/jetty/https-keypassword"}}
org.opennms.netmgt.jetty.https-keypassword={{getv "/jetty/https-keypassword"}}
{{end}}
{{if exists "/opennms/web/base-url"}}
opennms.web.base-url={{getv "/opennms/web/base-url"}}
{{end}}

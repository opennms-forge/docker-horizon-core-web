#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/grafanabox/show" -}}
org.opennms.grafanaBox.show={{getv "/grafanabox/show"}}
{{end -}}
{{if exists "/grafanabox/hostname" -}}
org.opennms.grafanaBox.hostname={{getv "/grafanabox/hostname"}}
{{end -}}
{{if exists "/grafanabox/port" -}}
org.opennms.grafanaBox.port={{getv "/grafanabox/port"}}
{{end -}}
{{if exists "/grafanabox/basepath" -}}
org.opennms.grafanaBox.basePath={{getv "/grafanabox/basepath"}}
{{end -}}
{{if exists "/grafanabox/apikey" -}}
org.opennms.grafanaBox.apiKey={{getv "/grafanabox/apikey"}}
{{end -}}
{{if exists "/grafanabox/tag" -}}
org.opennms.grafanaBox.tag={{getv "/grafanabox/tag"}}
{{end -}}
{{if exists "/grafanabox/protocol" -}}
org.opennms.grafanaBox.protocol={{getv "/grafanabox/protocol"}}
{{end -}}
{{if exists "/grafanabox/connection/timeout" -}}
org.opennms.grafanaBox.connectionTimeout={{getv "/grafanabox/connection/timeout"}}
{{end -}}
{{if exists "/grafanabox/socket/timeout" -}}
org.opennms.grafanaBox.soTimeout={{getv "/grafanabox/socket/timeout"}}
{{end -}}
{{if exists "/grafanabox/dashboard/limit" -}}
org.opennms.grafanaBox.dashboardLimit={{getv "/grafanabox/dashboardl/imit"}}
{{end -}}

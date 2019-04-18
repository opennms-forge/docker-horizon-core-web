#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/poller/backend/minimum/configuration/reload/interval" -}} 
opennms.pollerBackend.minimumConfigurationReloadInterval={{getv "/poller/backend/minimum/configuration/reload/interval"}}
{{end -}}
{{if exists "/poller/backend/disconnected/timeout" -}}
opennms.pollerBackend.disconnectedTimeout={{getv "/pollerbackend/disconnected/timeout"}}
{{end -}}
{{if exists "/poller/server/server/port" -}}
opennms.poller.server.serverPort={{getv "/poller/server/server/port"}}
{{end -}}
{{if exists "/poller/server/registry/port" -}}
opennms.poller.server.registryPort={{getv "/poller/server/registry/port"}}
{{end -}}

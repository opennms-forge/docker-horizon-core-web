#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/remote-poller" -}}
{{if exists (print $base "/backend/minimumConfigurationReloadInterval") -}} 
opennms.pollerBackend.minimumConfigurationReloadInterval={{getv (print $base "/backend/minimumConfigurationReloadInterval")}}
{{end -}}
{{if exists (print $base "/backend/disconnectedTimeout") -}}
opennms.pollerBackend.disconnectedTimeout={{getv (print $base "/backend/disconnectedTimeout")}}
{{end -}}
{{if exists (print $base "/server/serverPort") -}}
opennms.poller.server.serverPort={{getv (print $base "/server/serverPort")}}
{{end -}}
{{if exists (print $base "/server/registryPort") -}}
opennms.poller.server.registryPort={{getv (print $base "/server/registryPort")}}
{{end -}}
{{if exists (print $base "/excludeServiceMonitorsFromRemotePoller") -}}
excludeServiceMonitorsFromRemotePoller={{getv (print $base "/excludeServiceMonitorsFromRemotePoller")}}
{{end -}}

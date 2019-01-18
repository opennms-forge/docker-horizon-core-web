#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/pollerbackend/minimumconfigurationreloadinterval"}} 
opennms.pollerBackend.minimumConfigurationReloadInterval={{getv "/pollerBackend/minimumconfigurationreloadinterval"}}
{{end}}
{{if exists "/pollerbackend/disconnectedtimeout"}}
opennms.pollerBackend.disconnectedTimeout={{getv "/pollerbackend/disconnectedtimeout"}}
{{end}}
{{if exists "/poller/server/serverport"}}
opennms.poller.server.serverPort={{getv "/poller/server/serverport"}}
{{end}}
{{if exists "/poller/server/registryport"}}
opennms.poller.server.registryPort={{getv "/poller/server/registryport"}}
{{end}}

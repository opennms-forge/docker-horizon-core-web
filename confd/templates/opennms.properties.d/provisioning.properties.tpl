#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#

{{if exists "/provisiond/enable/discovery"}}
org.opennms.provisiond.enableDiscovery={{getv "/provisiond/enable/discovery"}}
{{end}}
{{if exists "/provisiond/schedule/rescan/for/existing/nodes"}}
org.opennms.provisiond.scheduleRescanForExistingNodes={{getv "/provisiond/schedule/rescan/for/existing/nodes"}}
{{end}}
{{if exists "/provisiond/schedule/rescan/for/updated/nodes"}}
org.opennms.provisiond.scheduleRescanForUpdatedNodes={{getv "/provisiond/schedule/rescan/for/updated/nodes"}}
{{end}}
{{if exists "/provisiond/repository/implementation"}}
org.opennms.provisiond.repositoryImplementation={{getv "/provisiond/repository/implementation"}}
{{end}}
{{if exists "/provisiond/resolve/missing/coordinates/from/address/string"}}
org.opennms.provisiond.resolveMissingCoordinatesFromAddressString={{getv "/provisiond/resolve/missing/coordinates/from/address/string"}}
{{end}}
{{if exists "/requisition/dir"}}
importer.requisition.dir={{getv "/requisition/dir"}}
{{end}}
{{if exists "/importer/foreignsource/dir"}}
importer.foreign-source.dir={{getv "/importer/foreignsource/dir"}}
{{end}}
{{if exists "/minion/provisioning"}}
opennms.minion.provisioning={{getv "/minion/provisioning"}}
{{end}}
{{if exists "/minion/provisioning/foreignsource/pattern"}}
opennms.minion.provisioning.foreignSourcePattern={{getv "/minion/provisioning/foreignsource/pattern"}}
{{end}}
{{if exists "/provision/max/concurrent/connections"}}
org.opennms.netmgt.provision.maxConcurrentConnections={{getv "/provision/max/concurrent/connections"}}
{{end}}
importer.adapter.dns.server={{getv "/importer/adapter/dns/server" "127.0.0.1"}}
{{if exists "/importer/adapter/dns/level"}}
importer.adapter.dns.level={{getv "/importer/adapter/dns/level"}}
{{end}}
{{if exists "/importer/adapter/dns/reverse/level"}}
importer.adapter.dns.reverse.leveli={{getv "/importer/adapter/dns/reverse/level"}}
{{end}}

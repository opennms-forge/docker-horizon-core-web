#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#

{{if exists "/provisiond/enablediscovery"}}
org.opennms.provisiond.enableDiscovery={{getv "/provisiond/enablediscovery"}}
{{end}}
{{if exists "/provisiond/schedulerescanforexistingnodes"}}
org.opennms.provisiond.scheduleRescanForExistingNodes={{getv "/provisiond/schedulerescanforexistingnodes"}}
{{end}}
{{if exists "/provisiond/schedulerescanforupdatednodes"}}
org.opennms.provisiond.scheduleRescanForUpdatedNodes={{getv "/provisiond/schedulerescanforupdatednodes"}}
{{end}}
{{if exists "/provisiond/repositoryimplementation"}}
org.opennms.provisiond.repositoryImplementation={{getv "/provisiond/repositoryimplementation"}}
{{end}}
{{if exists "/provisiond/resolvemissingcoordinatesfromaddressstring"}}
org.opennms.provisiond.resolveMissingCoordinatesFromAddressString={{getv "/provisiond/resolvemissingcoordinatesfromaddressstring"}}
{{end}}
{{if exists "/requisition/dir"}}
importer.requisition.dir={{getv "/requisition/dir"}}
{{end}}
{{if exists "/importer/foreign-source/dir"}}
importer.foreign-source.dir={{getv "/importer/foreign-source/dir"}}
{{end}}
{{if exists "/minion/provisioning"}}
opennms.minion.provisioning={{getv "/minion/provisioning"}}
{{end}}
{{if exists "/minion/provisioning/foreignsourcepattern"}}
opennms.minion.provisioning.foreignSourcePattern={{getv "/minion/provisioning/foreignsourcepattern"}}
{{end}}
{{if exists "/provision/maxconcurrentconnections"}}
org.opennms.netmgt.provision.maxConcurrentConnections={{getv "/provision/maxconcurrentconnections"}}
{{end}}
importer.adapter.dns.server={{getv "/importer/adapter/dns/server" "127.0.0.1"}}
{{if exists "/importer/adapter/dns/level"}}
importer.adapter.dns.level={{getv "/importer/adapter/dns/level"}}
{{end}}
{{if exists "/importer/adapter/dns/reverse/level"}}
importer.adapter.dns.reverse.leveli={{getv "/importer/adapter/dns/reverse/level"}}
{{end}}

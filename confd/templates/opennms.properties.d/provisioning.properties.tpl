#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/provisiond" -}}
{{if exists (print $base "/enableDiscovery") -}}
org.opennms.provisiond.enableDiscovery={{getv (print $base "/enableDiscovery")}}
{{end -}}
{{if exists (print $base "/scheduleRescanForExistingNodes") -}}
org.opennms.provisiond.scheduleRescanForExistingNodes={{getv (print $base "/scheduleRescanForExistingNodes")}}
{{end -}}
{{if exists (print $base "/scheduleRescanForUpdatedNodes") -}}
org.opennms.provisiond.scheduleRescanForUpdatedNodes={{getv (print $base "/scheduleRescanForUpdatedNodes")}}
{{end -}}
{{if exists (print $base "/repositoryImplementation") -}}
org.opennms.provisiond.repositoryImplementation={{getv (print $base "/repositoryImplementation")}}
{{end -}}
{{if exists (print $base "/resolveMissingCoordinatesFromAddressString") -}}
org.opennms.provisiond.resolveMissingCoordinatesFromAddressString={{getv (print $base "/resolveMissingCoordinatesFromAddressString")}}
{{end -}}
{{if exists (print $base "/maxConcurrentConnections") -}}
org.opennms.netmgt.provision.maxConcurrentConnections={{getv (print $base "/maxConcurrentConnections")}}
{{end -}}
{{if exists (print $base "/requisition-dir") -}}
importer.requisition.dir={{getv (print $base "/requisition-dir")}}
{{end -}}
{{if exists (print $base "/foreign-source-dir") -}}
importer.foreign-source.dir={{getv (print $base "/foreign-source-dir")}}
{{end -}}
importer.adapter.dns.server={{getv (print $base "/dns-adapter/server") "127.0.0.1"}}
{{if exists (print $base "/dns-adapter/level") -}}
importer.adapter.dns.level={{getv (print $base "/dns-adapter/level")}}
{{end -}}
{{if exists (print $base "/dns-adapter/reverse-level") -}}
importer.adapter.dns.reverse.level={{getv (print $base "/dns-adapter/reverse-level")}}
{{end -}}
{{if exists "/minion/provisioning/enable" -}}
opennms.minion.provisioning={{getv "/minion/provisioning/enable"}}
{{end -}}
{{if exists "/minion/provisioning/foreignSourcePattern" -}}
opennms.minion.provisioning.foreignSourcePattern={{getv "/minion/provisioning/foreignSourcePattern"}}
{{end -}}

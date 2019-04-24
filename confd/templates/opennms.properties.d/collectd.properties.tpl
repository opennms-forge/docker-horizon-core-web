#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
org.opennms.threshd.value.decimalformat={{getv "/threshd/value-decimal-format" "##.##"}}
{{$base := "/collectd" -}}
org.opennms.collectd.instrumentationClass={{getv (print $base "/instrumentation-class") "org.opennms.netmgt.collectd.DefaultCollectdInstrumentation"}}
org.opennms.snmp.dataCollectionConfig.reloadCheckInterval={{getv (print $base "/snmpcollector/data-collection-config/reload-check-interval") "30000"}}
org.opennms.netmgt.collectd.SnmpCollector.forceRescan = {{getv (print $base "/snmpcollector/force-rescan") "false"}}
org.opennms.netmgt.collectd.SnmpCollector.limitCollectionToInstances={{getv (print $base "/snmpcollector/limit-collection-to-instances") "false"}}
{{if exists (print $base "/default-collection-agent/load-snmp-data-on-init") -}}
org.opennms.netmgt.collectd.DefaultCollectionAgent.loadSnmpDataOnInit={{getv (print $base "/default-collection-agent/load-snmp-data-on-init")}}
{{end -}}

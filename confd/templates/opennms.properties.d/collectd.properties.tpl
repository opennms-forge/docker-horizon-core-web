#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
org.opennms.threshd.value.decimalformat={{getv "/threshd/value-decimal-format" "##.##"}}
{{$base := "/collectd" -}}
org.opennms.collectd.instrumentationClass={{getv (print $base "/instrumentationClass") "org.opennms.netmgt.collectd.DefaultCollectdInstrumentation"}}
org.opennms.snmp.dataCollectionConfig.reloadCheckInterval={{getv (print $base "/snmpcollector/dataCollectionConfig/reloadCheckInterval") "30000"}}
org.opennms.netmgt.collectd.SnmpCollector.forceRescan = {{getv (print $base "/snmpcollector/forceRescan") "false"}}
org.opennms.netmgt.collectd.SnmpCollector.limitCollectionToInstances={{getv (print $base "/snmpcollector/limitCollectionToInstances") "false"}}
{{if exists (print $base "/defaultCollectionAgent/loadSnmpDataOnInit") -}}
org.opennms.netmgt.collectd.DefaultCollectionAgent.loadSnmpDataOnInit={{getv (print $base "/defaultCollectionAgent/loadSnmpDataOnInit")}}
{{end -}}

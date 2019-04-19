#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
org.opennms.threshd.value.decimalformat={{getv "/threshd/value/decimal/format" "##.##"}}
org.opennms.snmp.dataCollectionConfig.reloadCheckInterval={{getv "/data/collectionconfig/reload/check/interval" "30000"}}
org.opennms.collectd.instrumentationClass={{getv "/collectd/instrumentation/class" "org.opennms.netmgt.collectd.DefaultCollectdInstrumentation"}}
org.opennms.netmgt.collectd.SnmpCollector.forceRescan = {{getv "/collectd/snmpcollector/force/rescan" "false"}}
org.opennms.netmgt.collectd.SnmpCollector.limitCollectionToInstances={{getv "/collectd/snmpcollector/limit/collection/to/instances" "false"}}
{{if exists "/collectd/default/collection/agent/load/snmp/data/oninit" -}}
org.opennms.netmgt.collectd.DefaultCollectionAgent.loadSnmpDataOnInit={{getv "/collectd/default/collection/agent/load/snmp/data/oninit"}}
{{end -}}

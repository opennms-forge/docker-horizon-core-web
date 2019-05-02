#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$snmp := "/snmp" -}}
org.opennms.snmp.strategyClass={{getv (print $snmp "/strategyClass") "org.opennms.netmgt.snmp.snmp4j.Snmp4JStrategy"}}
org.opennms.snmp.workarounds.allow64BitIpAddress={{getv (print $snmp "/workarounds/allow64BitIpAddress") "true"}}
org.opennms.snmp.workarounds.allowZeroLengthIpAddress={{getv (print $snmp "/workarounds/allowZeroLengthIpAddress") "true"}}
{{$snmp4j := "/snmp4j" -}}
org.snmp4j.smisyntaxes={{getv (print $snmp4j "/smisyntaxes") "opennms-snmp4j-smisyntaxes.properties"}}
org.opennms.snmp.snmp4j.forwardRuntimeExceptions={{getv (print $snmp4j "/forwardRuntimeExceptions") "false"}}
snmp4j.LogFactory={{getv (print $snmp4j "/logFactory") "org.snmp4j.log.Log4jLogFactory"}}
org.opennms.snmp.snmp4j.noGetBulk={{getv (print $snmp4j "/noGetBulk") "false"}}
org.opennms.snmp.snmp4j.allowSNMPv2InV1={{getv (print $snmp4j "/allowSNMPv2InV1") "false"}}

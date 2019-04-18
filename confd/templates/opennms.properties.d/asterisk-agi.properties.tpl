#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/asterisk/agi/listen/address" -}}
org.opennms.netmgt.asterisk.agi.listenAddress={{getv "/asterisk/agi/listen/address"}}
{{end -}}
{{if exists "/asterisk/agi/listen/port" -}}
org.opennms.netmgt.asterisk.agi.listenPort={{getv "/asterisk/agi/listen/port"}}
{{end -}}
{{if exists "/asterisk/agi/max/pool/size" -}}
org.opennms.netmgt.asterisk.agi.maxPoolSize={{getv "/asterisk/agi/max/pool/size"}}
{{end -}}

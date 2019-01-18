#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/asterisk/agi/listenaddress"}}
org.opennms.netmgt.asterisk.agi.listenAddress={{getv "/asterisk/agi/listenaddress"}}
{{end}}
{{if exists "/asterisk/agi/listenport"}}
org.opennms.netmgt.asterisk.agi.listenPort={{getv "/asterisk/agi/listenport"}}
{{end}}
{{if exists "/asterisk/agi/maxpoolsize"}}
org.opennms.netmgt.asterisk.agi.maxPoolSize={{getv "/asterisk/agi/maxpoolsize"}}
{{end}}

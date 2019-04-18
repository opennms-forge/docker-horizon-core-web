#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/icmp/pinger/class"}}
org.opennms.netmgt.icmp.pingerClass={{getv "/icmp/pinger/class"}}
{{end}}
{{if exists "/icmp/requirev4"}}
org.opennms.netmgt.icmp.requireV4={{getv "/icmp/require/v4"}}
{{end}}
{{if exists "/icmp/requirev6"}}
org.opennms.netmgt.icmp.requireV6={{getv "/icmp/require/v6"}}
{{end}}

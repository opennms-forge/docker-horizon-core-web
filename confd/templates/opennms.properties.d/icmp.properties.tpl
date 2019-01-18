#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/icmp/pingerclass"}}
org.opennms.netmgt.icmp.pingerClass={{getv "/icmp/pingerclass"}}
{{end}}
{{if exists "/icmp/requirev4"}}
org.opennms.netmgt.icmp.pingerClass={{getv "/icmp/requirev4"}}
{{end}}
{{if exists "/icmp/requirev6"}}
org.opennms.netmgt.icmp.pingerClass={{getv "/icmp/requirev6"}}
{{end}}

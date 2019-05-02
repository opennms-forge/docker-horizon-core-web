#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/icmp" -}}
{{range ls $base -}}
{{print "org.opennms.netmgt.icmp." .}}={{getv (print $base "/" .)}}
{{end -}}

#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/asterisk" -}}
{{range ls $base -}}
{{print "org.opennms.netmgt.asterisk.agi." .}}={{getv (print $base "/" .)}}
{{end -}}

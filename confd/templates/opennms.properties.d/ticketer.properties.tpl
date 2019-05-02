#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/ticketer" -}}
{{range ls $base -}}
{{print "opennms.ticketer." .}}={{getv (print $base "/" .)}}
{{end -}}

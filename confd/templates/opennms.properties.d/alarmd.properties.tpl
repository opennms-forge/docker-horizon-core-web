#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/alarmd" -}}
{{range ls $base -}}
{{print "org.opennms.alarmd." .}}={{getv (print $base "/" .)}}
{{end -}}

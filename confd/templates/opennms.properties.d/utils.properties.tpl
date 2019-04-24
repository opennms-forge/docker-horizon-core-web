#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/utils/propertiesCache" -}}
{{range ls $base -}}
{{print "org.opennms.utils.propertiesCache." .}}={{getv (print $base "/" .)}}
{{end -}}

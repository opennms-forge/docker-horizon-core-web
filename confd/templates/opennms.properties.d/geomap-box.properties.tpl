#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/geomap" -}}
{{range ls $base -}}
{{print "org.opennms.geomap." .}}={{getv (print $base "/" .)}}
{{end -}}

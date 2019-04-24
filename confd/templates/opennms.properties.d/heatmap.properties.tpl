#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/heatmap" -}}
{{range ls $base -}}
{{print "org.opennms.heatmap." .}}={{getv (print $base "/" .)}}
{{end -}}

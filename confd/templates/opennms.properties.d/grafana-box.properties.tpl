#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/grafana-box" -}}
{{range ls $base -}}
{{print "org.opennms.grafanaBox." .}}={{getv (print $base "/" .)}}
{{end -}}


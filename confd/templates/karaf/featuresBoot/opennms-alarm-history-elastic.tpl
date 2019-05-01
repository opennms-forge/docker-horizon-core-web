#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/opennms-alarm-history-elastic" -}}
{{if (eq (getv (print $base "/enabled") "false") "true") -}}
opennms-alarm-history-elastic
{{end -}}

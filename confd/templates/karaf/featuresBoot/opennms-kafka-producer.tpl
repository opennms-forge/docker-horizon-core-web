#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/opennms-kafka-producer" -}}
{{if (eq (getv (print $base "/enabled") "false") "true") -}}
opennms-kafka-producer
{{end -}}

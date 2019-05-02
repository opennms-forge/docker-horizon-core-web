#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/opennms-kafka-producer" -}}
{{if (eq (getv (print $base "/enabled") "false") "true") -}}
{{$config := (print $base "/kafka") -}}
{{range ls $config -}}
{{.}}={{getv (print $config "/" .)}}
{{end -}}
{{end -}}

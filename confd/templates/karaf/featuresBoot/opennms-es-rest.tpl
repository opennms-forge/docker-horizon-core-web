#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/opennms-es-rest" -}}
{{if (eq (getv (print $base "/enabled") "false") "true") -}}
opennms-es-rest
{{end -}}

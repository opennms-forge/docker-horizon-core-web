#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/elasticsearch-rest-forwarder" -}}
{{if (eq (getv (print $base "/enabled") "false") "true") -}}
opennms-es-rest
{{end -}}

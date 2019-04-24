#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/elasticsearch-rest-forwarder" -}}
{{if and (exists (print $base "/enabled")) (eq (getv (print $base "/enabled") "") ("true")) -}}
opennms-es-rest
{{end -}}

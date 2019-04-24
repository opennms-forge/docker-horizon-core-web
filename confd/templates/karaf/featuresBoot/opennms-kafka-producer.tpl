#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/kafka-producer" -}}
{{if and (exists (print $base "/enabled")) (eq (getv (print $base "/enabled") "") ("true")) -}}
opennms-kafka-producer
{{end -}}

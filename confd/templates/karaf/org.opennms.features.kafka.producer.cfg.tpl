#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/kafka-producer" -}}
{{if and (exists (print $base "/enabled")) (eq (getv (print $base "/enabled") "") ("true")) -}}
{{$config := (print $base "/config") -}}
{{range ls $config -}}
{{.}}={{getv (print $config "/" .)}}
{{end -}}
{{end -}}

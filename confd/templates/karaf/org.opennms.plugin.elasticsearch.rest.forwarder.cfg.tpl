#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/opennms-es-rest" -}}
{{if (eq (getv (print $base "/enabled") "false") "true") -}}
{{$config := print $base "/config" -}}
{{range ls $config -}}
{{.}}={{getv (print $config "/" .)}}
{{end -}}
{{$settings := print $base "/elasticsearch" -}}
{{range ls $settings -}}
{{print "settings." .}}={{getv (print $settings "/" .)}}
{{end -}}
{{end -}}

#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/flows-persistence" -}}
{{if and (exists (print $base "/enabled")) (eq (getv (print $base "/enabled") "") ("true")) -}}
{{$config := print $base "/config" -}}
{{range ls $config -}}
{{.}}={{getv (print $config "/" .)}}
{{end -}}
{{$settings := print $base "/elasticsearch" -}}
{{range ls $settings -}}
{{print "settings." .}}={{getv (print $settings "/" .)}}
{{end -}}
{{end -}}
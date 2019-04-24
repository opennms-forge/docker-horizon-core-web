#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/karaf/shell" -}}
{{range ls $base -}}
{{.}}={{getv (print $base "/" .)}}
{{end -}}

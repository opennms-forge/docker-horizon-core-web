#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/rancid-integration" -}}
{{if exists (print $base "/enabled") -}}
opennms.rancidIntegrationEnabled={{getv (print $base "/enabled")}}
{{end -}}
{{if exists (print $base "/use-only-rancid-adapter") -}}
opennms.rancidIntegrationUseOnlyRancidAdapter={{getv (print $base "/use-only-rancid-adapter")}}
{{end -}}

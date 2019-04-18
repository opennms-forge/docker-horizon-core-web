#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/geomap/default/strategy" -}}
org.opennms.geomap.defaultStrategy={{getv "/geomap/default/strategy"}}
{{end -}}
{{if exists "/geomap/default/severity" -}}
org.opennms.geomap.defaultSeverity={{getv "/geomap/default/severity"}}
{{end -}}

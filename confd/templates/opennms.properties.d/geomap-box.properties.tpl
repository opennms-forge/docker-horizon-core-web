#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/geomap/defaultstrategy"}}
org.opennms.geomap.defaultStrategy={{getv "/geomap/defaultstrategy"}}
{{end}}
{{if exists "/geomap/defaultseverity"}}
org.opennms.geomap.defaultSeverity={{getv "/geomap/defaultseverity"}}
{{end}}

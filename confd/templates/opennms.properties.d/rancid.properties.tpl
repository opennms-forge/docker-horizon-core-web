#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/rancidintegrationenabled"}}
opennms.rancidIntegrationEnabled={{getv "/rancidintegrationenabled"}}
{{end}}
{{if exists "/rancidintegrationuseonlyrancidadapter"}}
opennms.rancidIntegrationUseOnlyRancidAdapter={{getv "/rancidintegrationuseonlyrancidadapter"}}
{{end}}

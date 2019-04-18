#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/rancid/integration/enabled"}}
opennms.rancidIntegrationEnabled={{getv "/rancid/integration/enabled"}}
{{end}}
{{if exists "/rancid/integration/use/only/rancid/adapter"}}
opennms.rancidIntegrationUseOnlyRancidAdapter={{getv "/rancid/integration/use/only/rancid/adapter"}}
{{end}}

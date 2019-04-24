#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/activemq" -}}
{{if exists (print $base "/broker/ttl") -}}
org.opennms.jms.timeout={{getv (print $base "/broker/ttl")}}
{{end -}}
{{if exists (print $base "/broker/disable") -}}
org.opennms.activemq.broker.disable={{getv (print $base "/broker/disable")}}
{{end -}}
{{if exists (print $base "/broker/url") -}}
org.opennms.activemq.broker.url={{getv (print $base "/broker/url")}}
{{end -}}
{{if exists (print $base "/broker/username") -}}
org.opennms.activemq.broker.username={{getv (print $base "/broker/username")}}
{{end -}}
{{if exists (print $base "/broker/password") -}}
org.opennms.activemq.broker.password={{getv (print $base "/broker/password")}}
{{end -}}
{{$clients := print $base "/client" -}}
{{range ls $clients -}}
{{print "org.opennms.activemq.client." .}}={{getv (print $clients "/" .)}}
{{end -}}

#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/jetty" -}}
{{range ls $base -}}
{{print "org.opennms.netmgt.jetty." .}}={{getv (print $base "/" .)}}
{{end -}}
{{$serverRequest := "/jetty-server" -}}
{{range ls $serverRequest -}}
{{print "org.eclipse.jetty.server." .}}={{getv (print $serverRequest "/" .)}}
{{end -}}

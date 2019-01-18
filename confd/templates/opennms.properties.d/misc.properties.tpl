#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
distributed.layoutApplicationsVertically={{getv "/distributed/layoutapplicationsvertically" "false"}}
opennms.bin.dir={{getv "/opennms/bin/dir" "/opt/opennms/bin"}}
java.awt.headless={{getv "/java/awt/headless" "true"}}
{{if exists "/opennms/dao/ipinterface/findbyservicetype"}}
org.opennms.dao.ipinterface.findByServiceType={{getv "/opennms/dao/ipinterface/findbyservicetype"}}
{{end}}
{{if exists "/collectd/defaultcollectionagent/loadsnmpdataoninit"}}
org.opennms.netmgt.collectd.DefaultCollectionAgent.loadSnmpDataOnInit={{getv "/collectd/defaultcollectionagent/loadsnmpdataoninit"}}
{{end}}
{{if exists "/interface-node-cache/refresh-timer"}}
org.opennms.interface-node-cache.refresh-timer={{getv "/interface-node-cache/refresh-timer"}}
{{end}}
{{if exists "/osgi/bridge/restaliases"}}
org.opennms.features.osgi.bridge.restAliases={{getv "/osgi/bridge/restaliases"}}
{{end}}
{{if exists "/excludeservicemonitorsfromremotepoller"}}
excludeServiceMonitorsFromRemotePoller={{getv "/excludeservicemonitorsfromremotepoller"}}
{{end}}
{{if exists "/eventd/eventtemplatecachesize"}}
org.opennms.eventd.eventTemplateCacheSize={{getv "/eventd/eventtemplatecachesize"}}
{{end}}

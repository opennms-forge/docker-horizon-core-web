#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
distributed.layoutApplicationsVertically={{getv "/distributed/layout/applications/vertically" "false"}}
opennms.bin.dir={{getv "/opennms/bin/dir" "/opt/opennms/bin"}}
java.awt.headless={{getv "/java/awt/headless" "true"}}
{{if exists "/dao/ipinterface/findby/servicetype" -}}
org.opennms.dao.ipinterface.findByServiceType={{getv "/dao/ipinterface/findby/servicetype"}}
{{end -}}
{{if exists "/interface/node/cache/refresh/timer" -}}
org.opennms.interface-node-cache.refresh-timer={{getv "/interface/node/cache/refresh/timer"}}
{{end -}}
{{if exists "/osgi/bridge/rest/aliases" -}}
org.opennms.features.osgi.bridge.restAliases={{getv "/osgi/bridge/rest/aliases"}}
{{end -}}
{{if exists "/exclude/service/monitors/from/remote/poller" -}}
excludeServiceMonitorsFromRemotePoller={{getv "/exclude/service/monitors/from/remote/poller"}}
{{end -}}
{{if exists "/eventd/event/template/cache/size" -}}
org.opennms.eventd.eventTemplateCacheSize={{getv "/eventd/event/template/cache/size"}}
{{end -}}

#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
opennms.bin.dir={{getv "/opennms/bin-dir" "/opt/opennms/bin"}}
java.awt.headless={{getv "/java/awt/headless" "true"}}
{{if exists "/dao/ipinterface/find-by-service-type" -}}
org.opennms.dao.ipinterface.findByServiceType={{getv "/dao/ipinterface/findByServiceType"}}
{{end -}}
{{if exists "/dao/interface-node-cache-refresh-timer" -}}
org.opennms.interface-node-cache.refresh-timer={{getv "/dao/interface-node-cache-refresh-timer"}}
{{end -}}
{{if exists "/osgi/bridge/rest-aliases" -}}
org.opennms.features.osgi.bridge.restAliases={{getv "/osgi/bridge/rest-aliases"}}
{{end -}}
{{if exists "/eventd/event-template-cache-size" -}}
org.opennms.eventd.eventTemplateCacheSize={{getv "/eventd/event-template-cache-size"}}
{{end -}}

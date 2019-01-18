#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/ui/datetimeformat"}}
org.opennms.ui.datetimeformat={{getv "/ui/datetimeformat"}}
{{end}}
{{if exists "/ui/showstacktrace"}}
org.opennms.ui.show_stacktrace={{getv "/ui/showstacktrace"}}
{{end}}
{{if exists "/ui/topology-entity-cache-duration"}}
org.opennms.ui.topology-entity-cache-duration={{getv "/ui/topology-entity-cache-duration"}}
{{end}}
{{if exists "/assets/allowhtmlfields"}}
opennms.assets.allowHtmlFields={{getv "/assets/allowhtmlfields"}}
{{end}}
{{if exists "/web/aclsenabled"}}
org.opennms.web.aclsEnabled={{getv "/web/aclsenabled"}}
{{end}}
opennms.eventlist.acknowledge={{getv "/eventlist/acknowledge" "false"}}
opennms.eventlist.showCount={{getv "/eventlist/showcount" "false"}}
opennms.nodesWithOutages.count={{getv "/nodeswithoutages/count" "12"}}
opennms.nodesWithOutages.show={{getv "/nodeswithoutages/show" "true"}}
opennms.situations.count={{getv "/situations/count" "16"}}
opennms.situations.show={{getv "/situations/show" "true"}}
opennms.nodesWithProblems.count={{getv "/nodeswithproblems/count" "16"}}
opennms.nodesWithProblems.show={{getv "/nodeswithproblems/show" "true"}}
opennms.nodeStatusBar.show={{getv "/nodestatusbar/show" "false"}}
org.opennms.security.disableLoginSuccessEvent={{getv "/security/disableloginsuccessevent" "false"}}
org.opennms.interfaceAvailabilityBox.maxInterfaceCount={{getv "/interfaceavailabilitybox/maxinterfacecount" "10"}}
org.opennms.web.console.centerUrl={{getv "/web/console/centerurl" "/status/status-box.jsp,/includes/categories-box.jsp,/geomap/map-box.jsp"}}
org.opennms.dashboard.redirect={{getv "/dashboard/redirect" "false"}}
org.opennms.web.graphs.engine={{getv "/web/graphs/engine" "backshift"}}
org.opennms.web.defaultGraphPeriod={{getv "/web/defaultgraphperiod" "lastday"}}
opennms.alarmlist.sound.enable={{getv "/alarmlist/sound/enabled" "false"}}
opennms.alarmlist.sound.status={{getv "/alarmlist/sound/status" "off"}}
opennms.alarmlist.unackflash={{getv "/alarmlist/unackflash" "false"}}
org.opennms.jasperReportsVersion={{getv "/jasperreportsversion" "6.3.0"}}
net.sf.jasperreports.chart.pie.ignore.duplicated.key={{getv "/jasperreports/chart/pie/ignore/duplicated/key" "true"}}
{{if exists "/statusbox/elements"}}
org.opennms.statusbox.elements={{getv "/statusbox/elements" "business-services,nodes-by-alarms,nodes-by-outages"}}
{{end}}

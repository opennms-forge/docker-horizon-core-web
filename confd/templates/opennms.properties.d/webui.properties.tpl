#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/ui/datetime/format"}}
org.opennms.ui.datetimeformat={{getv "/ui/datetime/format"}}
{{end}}
{{if exists "/ui/show/stacktrace"}}
org.opennms.ui.show_stacktrace={{getv "/ui/show/stacktrace"}}
{{end}}
{{if exists "/ui/topology/entity/cache/duration"}}
org.opennms.ui.topology-entity-cache-duration={{getv "/ui/topology/entity/cache/duration"}}
{{end}}
{{if exists "/assets/allow/html/fields"}}
opennms.assets.allowHtmlFields={{getv "/assets/allow/html/fields"}}
{{end}}
{{if exists "/web/acls/enabled"}}
org.opennms.web.aclsEnabled={{getv "/web/acls/enabled"}}
{{end}}
opennms.eventlist.acknowledge={{getv "/eventlist/acknowledge" "false"}}
opennms.eventlist.showCount={{getv "/eventlist/show/count" "false"}}
opennms.nodesWithOutages.count={{getv "/nodes/with/outages/count" "12"}}
opennms.nodesWithOutages.show={{getv "/nodes/with/outages/show" "true"}}
opennms.situations.count={{getv "/situations/count" "16"}}
opennms.situations.show={{getv "/situations/show" "true"}}
opennms.nodesWithProblems.count={{getv "/nodes/with/problems/count" "16"}}
opennms.nodesWithProblems.show={{getv "/nodes/with/problems/show" "true"}}
opennms.nodeStatusBar.show={{getv "/node/statusbar/show" "false"}}
org.opennms.security.disableLoginSuccessEvent={{getv "/security/disable/login/success/event" "false"}}
org.opennms.interfaceAvailabilityBox.maxInterfaceCount={{getv "/interface/availabilitybox/max/interface/count" "10"}}
org.opennms.web.console.centerUrl={{getv "/web/console/centerurl" "/status/status-box.jsp,/includes/categories-box.jsp,/geomap/map-box.jsp"}}
org.opennms.dashboard.redirect={{getv "/dashboard/redirect" "false"}}
org.opennms.web.graphs.engine={{getv "/web/graphs/engine" "backshift"}}
org.opennms.web.defaultGraphPeriod={{getv "/web/default/graph/period" "lastday"}}
opennms.alarmlist.sound.enable={{getv "/alarmlist/sound/enabled" "false"}}
opennms.alarmlist.sound.status={{getv "/alarmlist/sound/status" "off"}}
opennms.alarmlist.unackflash={{getv "/alarmlist/unackflash" "false"}}
org.opennms.jasperReportsVersion={{getv "/jasper/reports/version" "6.3.0"}}
net.sf.jasperreports.chart.pie.ignore.duplicated.key={{getv "/jasper/reports/chart/pie/ignore/duplicated/key" "true"}}
{{if exists "/statusbox/elements"}}
org.opennms.statusbox.elements={{getv "/statusbox/elements" "business-services,nodes-by-alarms,nodes-by-outages"}}
{{end}}

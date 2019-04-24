#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/webui" -}}
{{if exists (print $base "/base-url") -}}
opennms.web.base-url={{getv (print $base "/base-url")}}
{{end -}}
{{if exists (print $base "/datetime-format") -}}
org.opennms.ui.datetimeformat={{getv (print $base "/datetime-format")}}
{{end -}}
{{if exists (print $base "/show-stacktrace") -}}
org.opennms.ui.show_stacktrace={{getv (print $base "/show-stacktrace")}}
{{end -}}
{{if exists (print $base "/topology-entity-cache-duration") -}}
org.opennms.ui.topology-entity-cache-duration={{getv (print $base "/topology-entity-cache-duration")}}
{{end -}}
{{if exists (print $base "/assets/allowHtmlFields") -}}
opennms.assets.allowHtmlFields={{getv (print $base "/assets/allowHtmlFields")}}
{{end -}}
{{if exists (print $base "/aclsEnabled") -}}
org.opennms.web.aclsEnabled={{getv (print $base "/aclsEnabled")}}
{{end -}}
{{if exists (print $base "/alarmTroubleTicketLinkTemplate") -}}
opennms.alarmTroubleTicketLinkTemplate={{getv (print $base "/alarmTroubleTicketLinkTemplate")}}
{{end -}}
{{if exists (print $base "/alarmTroubleTicketEnabled") -}}
opennms.alarmTroubleTicketEnabled={{getv (print $base "/alarmTroubleTicketEnabled")}}
{{end -}}
opennms.eventlist.acknowledge={{getv (print $base "/eventlist/acknowledge") "false"}}
opennms.eventlist.showCount={{getv (print $base "/eventlist/show/count") "false"}}
opennms.nodesWithOutages.count={{getv (print $base "/nodesWithOutages/count") "12"}}
opennms.nodesWithOutages.show={{getv (print $base "/nodesWithOutages/show") "true"}}
opennms.situations.count={{getv (print $base "/situations/count") "16"}}
opennms.situations.show={{getv (print $base "/situations/show") "true"}}
opennms.nodesWithProblems.count={{getv (print $base "/nodesWithProblems/count") "16"}}
opennms.nodesWithProblems.show={{getv (print $base "/nodesWithProblems/show") "true"}}
opennms.nodeStatusBar.show={{getv (print $base "/nodeStatusBar/show") "false"}}
org.opennms.security.disableLoginSuccessEvent={{getv (print $base "/disableLoginSuccessEvent") "false"}}
org.opennms.interfaceAvailabilityBox.maxInterfaceCount={{getv (print $base "/interfaceAvailabilityBox/maxInterfaceCount") "10"}}
org.opennms.web.console.centerUrl={{getv (print $base "/centerUrl") "/status/status-box.jsp,/includes/categories-box.jsp,/geomap/map-box.jsp"}}
org.opennms.dashboard.redirect={{getv (print $base "/dashboard/redirect") "false"}}
org.opennms.web.graphs.engine={{getv (print $base "/graphs/engine") "backshift"}}
org.opennms.web.defaultGraphPeriod={{getv (print $base "/defaultGraphPeriod") "lastday"}}
opennms.alarmlist.sound.enable={{getv (print $base "/alarmlist/sound/enable") "false"}}
opennms.alarmlist.sound.status={{getv (print $base "/alarmlist/sound/status") "off"}}
opennms.alarmlist.unackflash={{getv (print $base "/alarmlist/unackflash") "false"}}
org.opennms.jasperReportsVersion={{getv (print $base "/jasperReportsVersion") "6.3.0"}}
net.sf.jasperreports.chart.pie.ignore.duplicated.key={{getv (print $base "/jasper-reports/chart-pie-ignore-duplicated-key") "true"}}
org.opennms.statusbox.elements={{getv (print $base "/statusbox/elements") "business-services,nodes-by-alarms,nodes-by-outages"}}
distributed.layoutApplicationsVertically={{getv (print $base "/distributed/layoutApplicationsVertically") "false"}}

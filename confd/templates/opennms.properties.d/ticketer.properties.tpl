#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
opennms.ticketer.servicelayer={{getv "/ticketer/service/layer" "org.opennms.netmgt.ticketd.DefaultTicketerServiceLayer"}}
opennms.ticketer.plugin={{getv "/ticketer/plugin" "org.opennms.netmgt.ticketd.NullTicketerPlugin"}}
{{if exists "/alarm/trouble/ticket/link/template" -}}
opennms.alarmTroubleTicketLinkTemplate={{getv "/alarm/trouble/ticket/link/template"}}
{{end -}}
{{if exists "/alarm/trouble/ticket/enabled" -}}
opennms.alarmTroubleTicketEnabled={{getv "/alarm/trouble/ticket/enabled"}}
{{end -}}
{{if exists "/ticketer/skip/create/when/cleared" -}}
opennms.ticketer.skipCreateWhenCleared={{getv "/ticketer/skip/create/when/cleared"}}
{{end -}}
{{if exists "/ticketer/skip/close/when/not/cleared" -}}
opennms.ticketer.skipCloseWhenNotCleared={{getv "/ticketer/skip/close/when/not/cleared"}}
{{end -}}

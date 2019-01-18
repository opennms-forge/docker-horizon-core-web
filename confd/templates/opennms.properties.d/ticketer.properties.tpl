#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
opennms.ticketer.servicelayer={{getv "/ticketer/servicelayer" "org.opennms.netmgt.ticketd.DefaultTicketerServiceLayer"}}
opennms.ticketer.plugin={{getv "/ticketer/plugin" "org.opennms.netmgt.ticketd.NullTicketerPlugin"}}
{{if exists "/alarmtroubleticketlinktemplate"}}
opennms.alarmTroubleTicketLinkTemplate={{getv "/alarmtroubleticketlinktemplate"}}
{{end}}
{{if exists "/alarmtroubleticketenabled"}}
opennms.alarmTroubleTicketEnabled={{getv "/alarmtroubleticketenabled"}}
{{end}}
{{if exists "/ticketer/skipcreatewhencleared"}}
opennms.ticketer.skipCreateWhenCleared={{getv "/ticketer/skipcreatewhencleared"}}
{{end}}
{{if exists "/ticketer/skipclosewhenmotcleared"}}
opennms.ticketer.skipCloseWhenNotCleared={{getv "/ticketer/skipclosewhenmotcleared"}}
{{end}}

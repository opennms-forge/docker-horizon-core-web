#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/heatmap/defaultmode"}}
org.opennms.heatmap.defaultMode={{getv "/heatmap/defaultmode"}}
{{end}}
{{if exists "/heatmap/defaultheatmap"}}
org.opennms.heatmap.defaultHeatmap={{getv "/heatmap/defaultheatmap"}}
{{end}}
{{if exists "/heatmap/categoryfilter"}}
org.opennms.heatmap.categoryFilter={{getv "/heatmap/categoryfilter"}}
{{end}}
{{if exists "/heatmap/foreignsourcefilter"}}
org.opennms.heatmap.foreignSourceFilter={{getv "/heatmap/foreignsourcefilter"}}
{{end}}
{{if exists "/heatmap/servicefilter"}}
org.opennms.heatmap.serviceFilter={{getv "/heatmap/servicefilter"}}
{{end}}
{{if exists "/heatmap/onlyunacknowledged"}}
org.opennms.heatmap.onlyUnacknowledged={{getv ""}}
{{end}}

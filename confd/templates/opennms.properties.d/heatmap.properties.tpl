#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/heatmap/default/mode" -}}
org.opennms.heatmap.defaultMode={{getv "/heatmap/default/mode"}}
{{end -}}
{{if exists "/heatmap/default/heatmap" -}}
org.opennms.heatmap.defaultHeatmap={{getv "/heatmap/default/heatmap"}}
{{end}}
{{if exists "/heatmap/category/filter" -}}
org.opennms.heatmap.categoryFilter={{getv "/heatmap/category/filter"}}
{{end -}}
{{if exists "/heatmap/foreignsource/filter" -}}
org.opennms.heatmap.foreignSourceFilter={{getv "/heatmap/foreignsource/filter"}}
{{end -}}
{{if exists "/heatmap/service/filter" -}}
org.opennms.heatmap.serviceFilter={{getv "/heatmap/service/filter"}}
{{end -}}
{{if exists "/heatmap/only/unacknowledged" -}}
org.opennms.heatmap.onlyUnacknowledged={{getv "/heatmap/only/unacknowledged"}}
{{end -}}

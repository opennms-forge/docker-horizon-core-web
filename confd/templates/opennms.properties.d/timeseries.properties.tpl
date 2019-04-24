#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/timeseries" -}}
org.opennms.timeseries.strategy={{getv (print $base "/strategy") "rrd"}}
rrd.binary={{getv (print $base "/rrd/binary") "/usr/bin/rrdtool"}}
rrd.base.dir={{getv (print $base "/rrd/base-dir") "/opt/opennms/share/rrd"}}
org.opennms.rrd.storeByForeignSource={{getv (print $base "/storeByForeignSource") "false"}}
org.opennms.rrd.storeByGroup={{getv (print $base "/storeByGroup") "false"}}
{{if eq (getv (print $base "/strategy") "rrd") ("rrd") -}}
org.opennms.rrd.strategyClass={{getv (print $base "/rrd/strategyClass") "org.opennms.netmgt.rrd.rrdtool.MultithreadedJniRrdStrategy"}}
org.opennms.rrd.interfaceJar={{getv (print $base "/rrd/interfaceJar") "/usr/share/java/jrrd2.jar"}}
opennms.library.jrrd2={{getv (print $base "/rrd/library/jrrd2") "/usr/lib64/libjrrd2.so"}}
{{end -}}
{{if exists (print $base "/evaluate/dump-stats-frequency") -}}
org.opennms.evaluate.dump_stats_frequency={{getv (print $base "/evaluate/dump-stats-frequency")}}
{{end -}}
{{if exists (print $base "/evaluate/dump-cache-frequency") -}}
org.opennms.evaluate.dump_cache_frequency={{getv (print $base "/evaluate/dump-cache-frequency")}}
{{end -}}
{{if eq (getv (print $base "/strategy") "rrd") ("newts") -}}
{{$newts_config := (print $base "/newts/config") -}}
{{range ls $newts_config -}}
{{print "org.opennms.newts.config." .}}={{getv (print $newts_config "/" .)}}
{{end -}}
{{$newts_query := (print $base "/newts/query") -}}
{{range ls $newts_query -}}
{{print "org.opennms.newts.query." .}}={{getv (print $newts_query "/" .)}}
{{end -}}
{{else -}}
{{if exists "/newts/query/minimum_step" -}}
org.opennms.newts.query.minimum_step={{getv "/newts/query/minimum_step" "30000"}}
{{end -}}
{{if exists "/newts/query/heartbeat" -}}
org.opennms.newts.query.heartbeat={{getv "/newts/query/heartbeat" "450000"}}
{{end -}}
{{end -}}

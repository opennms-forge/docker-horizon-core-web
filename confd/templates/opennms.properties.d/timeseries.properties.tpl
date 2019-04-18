#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
org.opennms.rrd.storeByForeignSource={{getv "/rrd/storeby/foreignsource" "false"}}
org.opennms.rrd.storeByGroup={{getv "/rrd/storeby/group" "false"}}
org.opennms.timeseries.strategy={{getv "/timeseries/strategy" "rrd"}}
rrd.binary={{getv "/rrd/binary" "/usr/bin/rrdtool"}}
rrd.base.dir={{getv "/rrd/base/dir" "/opt/opennms/share/rrd"}}
{{if eq (getv "/timeseries/strategy" "rrd") ("rrd")}}
org.opennms.rrd.strategyClass={{getv "/rrd/strategy/class" "org.opennms.netmgt.rrd.rrdtool.MultithreadedJniRrdStrategy"}}
org.opennms.rrd.interfaceJar={{getv "/rrd/interface/jar" "/usr/share/java/jrrd2.jar"}}
opennms.library.jrrd2={{getv "/rrd/library/jrrd2" "/usr/lib64/libjrrd2.so"}}
{{end}}
{{if exists "/evaluate/dump/stats/frequency"}}
org.opennms.evaluate.dump_stats_frequency={{getv "/evaluate/dump/stats/frequency"}}
{{end}}
{{if exists "/evaluate/dump/cache/frequency"}}
org.opennms.evaluate.dump_cache_frequency={{getv "/evaluate/dump/cache/frequency"}}
{{end}}
org.opennms.newts.query.minimum_step={{getv "/newts/query/minimum/step" "30000"}}
org.opennms.newts.query.heartbeat={{getv "/newts/query/heartbeat" "450000"}}
{{if eq (getv "/timeseries/strategy" "rrd") ("newts")}}
org.opennms.newts.nan_on_counter_wrap={{getv "/newts/nan/on/counter/wrap" "true"}}
org.opennms.newts.config.hostname={{getv "/newts/config/hostname"}}
org.opennms.newts.config.keyspace={{getv "/newts/config/keyspace" "newts"}}
org.opennms.newts.config.port={{getv "/newts/config/port" "9042"}}
org.opennms.newts.config.username={{getv "/newts/config/username"}}
org.opennms.newts.config.password={{getv "/newts/config/password"}}
org.opennms.newts.config.read_consistency={{getv "/newts/config/read/consistency" "ONE"}}
org.opennms.newts.config.write_consistency={{getv "/newts/config/write/consistency" "ANY"}}
{{if exists "/newts/config/writer/threads"}}
org.opennms.newts.config.writer_threads={{getv "/newts/config/writer/threads"}}
{{end}}
org.opennms.newts.config.max_batch_size={{getv "/newts/config/max/batch/size" "16"}}
org.opennms.newts.config.ring_buffer_size={{getv "/newts/config/ring/buffer/size" "8192"}}
org.opennms.newts.config.ttl={{getv "/newts/config/ttl" "31540000"}}
org.opennms.newts.config.resource_shard={{getv "/newts/config/resource/shard" "604800"}}
org.opennms.newts.config.cache.strategy={{getv "/newts/config/cache/strategy" "org.opennms.netmgt.newts.support.GuavaSearchableResourceMetadataCache"}}
org.opennms.newts.config.cache.max_entries={{getv "/newts/config/cache/max/entries" "8192"}}
{{if (exists "/newts/config/cache/strategy") and (eq (getv "/newts/config/cache/strategy") ("org.opennms.netmgt.newts.support.RedisResourceMetadataCache"))}}
org.opennms.newts.config.cache.redis_hostname={{getv "/newts/config/cache/redis/hostname" "localhost"}}
org.opennms.newts.config.cache.redis_port={{getv "/newts/config/cache/redis/port" "6379"}}
{{end}}
{{if exists "/newts/config/cache/priming/disable"}}
org.opennms.newts.config.cache.priming.disable={{getv "/newts/config/cache/priming/disable"}}
{{end}}
{{if exists "/newts/config/cache/priming/blockms"}}
org.opennms.newts.config.cache.priming.block_ms={{getv "/newts/config/cache/priming/blockms"}}
{{end}}
{{end}}

#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/plugin/elasticsearch/rest/forwarder/elasticurl"}}
elasticUrl={{getv "/plugin/elasticsearch/rest/forwarder/elasticurl"}}
globalElasticUser={{getv "/plugin/elasticsearch/rest/forwarder/global/elasticuser" ""}}
globalElasticPassword={{getv "/plugin/elasticsearch/rest/forwarder/global/elasticpassword" ""}}
elasticIndexStrategy={{getv "/plugin/elasticsearch/rest/forwarder/elastic/index/strategy" "monthly"}}
defaultMaxTotalConnectionPerRoute={{getv "/plugin/elasticsearch/rest/forwarder/default/max/total/connection/per/route" "-1"}}
maxTotalConnection={{getv "/plugin/elasticsearch/rest/forwarder/max/total/connection" "-1"}}
nodeDiscovery={{getv "/plugin/elasticsearch/rest/forwarder/node/discovery" "false"}}
nodeDiscoveryFrequency={{getv "/plugin/elasticsearch/rest/forwarder/node/discovery/frequency" "0"}}
proxy={{getv "/plugin/elasticsearch/rest/forwarder/proxy" ""}}
retryCooldown={{getv "/plugin/elasticsearch/rest/forwarder/retry/cooldown" "500"}}
connTimeout={{getv "/plugin/elasticsearch/rest/forwarder/conntimeout" "5000"}}
readTimeout={{getv "/plugin/elasticsearch/rest/forwarder/readtimeout" "30000"}}
retries={{getv "/plugin/elasticsearch/rest/forwarder/retries" "0"}}
batchSize={{getv "/plugin/elasticsearch/rest/forwarder/batch/size" "200"}}
batchInterval={{getv "/plugin/elasticsearch/rest/forwarder/batch/interval" "500"}}
threads={{getv "/plugin/elasticsearch/rest/forwarder/threads" "0"}}
cache_max_ttl={{getv "/plugin/elasticsearch/rest/forwarder/cache/maxttl" "0"}}
cache_max_size={{getv "/plugin/elasticsearch/rest/forwarder/cache/maxsize" "10000"}}
logEventDescription={{getv "/plugin/elasticsearch/rest/forwarder/log/event/description" "true"}}
logAllEvents={{getv "/plugin/elasticsearch/rest/forwarder/local/levents" "false"}}
archiveRawEvents={{getv "/plugin/elasticsearch/rest/forwarder/archive/raw/events" "true"}}
archiveAlarms={{getv "/plugin/elasticsearch/rest/forwarder/archive/alarms" "true"}}
archiveAlarmChangeEvents={{getv "/plugin/elasticsearch/rest/forwarder/archive/alarm/change/events" "true"}}
archiveOldAlarmValues={{getv "/plugin/elasticsearch/rest/forwarder/archive/old/alarm/values" "true"}}
archiveNewAlarmValues={{getv "/plugin/elasticsearch/rest/forwarder/archive/new/alarm/values" "true"}}
archiveAssetData={{getv "/plugin/elasticsearch/rest/forwarder/archive/asset/data" "true"}}
groupOidParameters={{getv "/plugin/elasticsearch/rest/forwarder/group/oid/parameters" "false"}}
bulkRetryCount={{getv "/plugin/elasticsearch/rest/forwarder/bulk/retry/count" "5"}}
{{if exists "/plugin/elasticsearch/rest/forwarder/number/of/shards"}}
settings.index.number_of_shards={{getv "/plugin/elasticsearch/rest/forwarder/number/of/shards"}}
{{end}}
{{if exists "/plugin/elasticsearch/rest/forwarder/number/of/replicas"}}
settings.index.number_of_replicas={{getv "/plugin/elasticsearch/rest/forwarder/number/of/replicas"}}
{{end}}
{{if exists "/plugin/elasticsearch/rest/forwarder/refresh/interval"}}
settings.index.refresh_interval={{getv "/plugin/elasticsearch/rest/forwarder/refresh/interval"}}
{{end}}
{{if exists "/plugin/elasticsearch/rest/forwarder/routing/partition/size"}}
settings.index.routing_partition_size={{getv "/plugin/elasticsearch/rest/forwarder/routing/partition/size"}}
{{end}}
{{end}}

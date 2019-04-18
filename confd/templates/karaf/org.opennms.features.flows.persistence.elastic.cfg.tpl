#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/flows/persistence/elastic/elasticurl"}}
elasticUrl={{getv "/flows/persistence/elastic/elasticurl"}}
globalElasticUser={{getv "/flows/persistence/elastic/global/elasticuser" ""}}
globalElasticPassword={{getv "/flows/persistence/elastic/global/elasticpassword" ""}}
elasticIndexStrategy={{getv "/flows/persistence/elastic/elastic/index/strategy" "monthly"}}
maxFlowDurationMs={{getv "/flows/persistence/elastic/max/flow/durationms" "120000"}}
defaultMaxTotalConnectionPerRoute={{getv "/flows/persistence/elastic/default/max/total/connection/per/route" "-1"}}
maxTotalConnection={{getv "/flows/persistence/elastic/max/total/connection" "-1"}}
nodeDiscovery={{getv "/flows/persistence/elastic/node/discovery" "false"}}
nodeDiscoveryFrequency={{getv "/flows/persistence/elastic/node/discovery/frequency" "0"}}
proxy={{getv "/flows/persistence/elastic/proxy" ""}}
retryCooldown={{getv "/flows/persistence/elastic/retry/cooldown" "500"}}
connTimeout={{getv "/flows/persistence/elastic/conntimeout" "5000"}}
readTimeout={{getv "/flows/persistence/elastic/readtimeout" "30000"}}
retries={{getv "/flows/persistence/elastic/retries" "0"}}
nodeCache.enabled={{getv "/flows/persistence/elastic/nodecache/enabled" "true"}}
nodeCache.maximumSize={{getv "/flows/persistence/elastic/nodecache/maximum/size" "1000"}}
nodeCache.expireAfterWrite={{getv "/flows/persistence/elastic/nodecache/expire/after/write" "300"}}
nodeCache.recordStats={{getv "/flows/persistence/elastic/nodecache/record/stats" "true"}}
bulkRetryCount={{getv "/flows/persistence/elastic/bulk/retry/count" "5"}}
{{if exists "/flows/persistence/elastic/settings/index/number/of/shards"}}
settings.index.number_of_shards={{getv "/flows/persistence/elastic/settings/index/number/of/shards"}}
{{end}}
{{if exists "/flows/persistence/elastic/settings/index/number/of/replicas"}}
settings.index.number_of_replicas={{getv "/flows/persistence/elastic/settings/index/number/of/replicas"}}
{{end}}
{{if exists "/flows/persistence/elastic/settings/index/refresh/interval"}}
settings.index.refresh_interval={{getv "/flows/persistence/elastic/settings/index/refresh/interval"}}
{{end}}
{{if exists "/flows/persistence/elastic/settings/index/routing/partition/size"}}
settings.index.routing_partition_size={{getv "/flows/persistence/elastic/settings/index/routing/partition/size"}}
{{end}}
{{end}}

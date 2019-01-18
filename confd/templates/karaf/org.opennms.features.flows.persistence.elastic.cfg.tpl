#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/flows/persistence/elastic/elasticurl"}}
elasticUrl={{getv "/flows/persistence/elastic/elasticurl"}}
globalElasticUser={{getv "/flows/persistence/elastic/globalelasticuser" ""}}
globalElasticPassword={{getv "/flows/persistence/elastic/globalelasticpassword" ""}}
elasticIndexStrategy={{getv "/flows/persistence/elastic/elasticindexstrategy" "monthly"}}
maxFlowDurationMs={{getv "/flows/persistence/elastic/maxflowdurationms" "120000"}}
defaultMaxTotalConnectionPerRoute={{getv "/flows/persistence/elastic/defaultmaxtotalconnectionperroute" "-1"}}
maxTotalConnection={{getv "/flows/persistence/elastic/maxtotalconnection" "-1"}}
nodeDiscovery={{getv "/flows/persistence/elastic/nodediscovery" "false"}}
nodeDiscoveryFrequency={{getv "/flows/persistence/elastic/nodediscoveryfrequency" "0"}}
proxy={{getv "/flows/persistence/elastic/proxy" ""}}
retryCooldown={{getv "/flows/persistence/elastic/retrycooldown" "500"}}
connTimeout={{getv "/flows/persistence/elastic/conntimeout" "5000"}}
readTimeout={{getv "/flows/persistence/elastic/readtimeout" "30000"}}
retries={{getv "/flows/persistence/elastic/retries" "0"}}
nodeCache.enabled={{getv "/flows/persistence/elastic/nodecache/enabled" "true"}}
nodeCache.maximumSize={{getv "/flows/persistence/elastic/nodecache/maximumsize" "1000"}}
nodeCache.expireAfterWrite={{getv "/flows/persistence/elastic/nodecache/expireafterwrite" "300"}}
nodeCache.recordStats={{getv "/flows/persistence/elastic/nodecache/recordstats" "true"}}
bulkRetryCount={{getv "/flows/persistence/elastic/bulkretrycount" "5"}}
settings.index.number_of_shards={{getv "/flows/persistence/elastic/settings/index/numberofshards" ""}}
settings.index.number_of_replicas={{getv "/flows/persistence/elastic/settings/index/numberofreplicas" ""}}
settings.index.refresh_interval={{getv "/flows/persistence/elastic/settings/index/refreshinterval" ""}}
settings.index.routing_partition_size={{getv "/flows/persistence/elastic/settings/index/routingpartitionsize" ""}}
{{end}}

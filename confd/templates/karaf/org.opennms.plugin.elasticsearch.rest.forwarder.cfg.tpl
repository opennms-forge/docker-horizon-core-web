#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{if exists "/plugin/elasticsearch/rest/forwarder/elasticurl"}}
elasticUrl={{getv "/plugin/elasticsearch/rest/forwarder/elasticurl"}}
globalElasticUser={{getv "/plugin/elasticsearch/rest/forwarder/globalelasticuser" ""}}
globalElasticPassword={{getv "/plugin/elasticsearch/rest/forwarder/globalelasticpassword" ""}}
elasticIndexStrategy={{getv "/plugin/elasticsearch/rest/forwarder/elasticindexstrategy" "monthly"}}
defaultMaxTotalConnectionPerRoute={{getv "/plugin/elasticsearch/rest/forwarder/defaultmaxtotalconnectionperroute" "-1"}}
maxTotalConnection={{getv "/plugin/elasticsearch/rest/forwarder/maxtotalconnection" "-1"}}
nodeDiscovery={{getv "/plugin/elasticsearch/rest/forwarder/nodediscovery" "false"}}
nodeDiscoveryFrequency={{getv "/plugin/elasticsearch/rest/forwarder/nodediscoveryfrequency" "0"}}
proxy={{getv "/plugin/elasticsearch/rest/forwarder/proxy" ""}}
retryCooldown={{getv "/plugin/elasticsearch/rest/forwarder/retrycooldown" "500"}}
connTimeout={{getv "/plugin/elasticsearch/rest/forwarder/conntimeout" "5000"}}
readTimeout={{getv "/plugin/elasticsearch/rest/forwarder/readtimeout" "30000"}}
retries={{getv "/plugin/elasticsearch/rest/forwarder/retries" "0"}}
batchSize={{getv "/plugin/elasticsearch/rest/forwarder/batchsize" "200"}}
batchInterval={{getv "/plugin/elasticsearch/rest/forwarder/batchinterval" "500"}}
threads={{getv "/plugin/elasticsearch/rest/forwarder/threads" "0"}}
cache_max_ttl={{getv "/plugin/elasticsearch/rest/forwarder/cachemaxttl" "0"}}
cache_max_size={{getv "/plugin/elasticsearch/rest/forwarder/cachemaxsize" "10000"}}
logEventDescription={{getv "/plugin/elasticsearch/rest/forwarder/logeventdescription" "true"}}
logAllEvents={{getv "/plugin/elasticsearch/rest/forwarder/logallevents" "false"}}
archiveRawEvents={{getv "/plugin/elasticsearch/rest/forwarder/archiverawevents" "true"}}
archiveAlarms={{getv "/plugin/elasticsearch/rest/forwarder/archivealarms" "true"}}
archiveAlarmChangeEvents={{getv "/plugin/elasticsearch/rest/forwarder/archivealarmchangeevents" "true"}}
archiveOldAlarmValues={{getv "/plugin/elasticsearch/rest/forwarder/archiveoldalarmvalues" "true"}}
archiveNewAlarmValues={{getv "/plugin/elasticsearch/rest/forwarder/archivenewalarmvalues" "true"}}
archiveAssetData={{getv "/plugin/elasticsearch/rest/forwarder/archiveassetdata" "true"}}
groupOidParameters={{getv "/plugin/elasticsearch/rest/forwarder/groupoidparameters" "false"}}
bulkRetryCount={{getv "/plugin/elasticsearch/rest/forwarder/bulkretrycount" "5"}}
settings.index.number_of_shards={{getv "/plugin/elasticsearch/rest/forwarder/numberofshards" ""}}
settings.index.number_of_replicas={{getv "/plugin/elasticsearch/rest/forwarder/numberofreplicas" ""}}
settings.index.refresh_interval={{getv "/plugin/elasticsearch/rest/forwarder/refreshinterval" ""}}
settings.index.routing_partition_size={{getv "/plugin/elasticsearch/rest/forwarder/routingpartitionsize" ""}}
{{end}}

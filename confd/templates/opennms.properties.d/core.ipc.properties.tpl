#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
#
{{if exists "/core/ipc/sink/strategy"}}
#
# Global Sink Settings
org.opennms.core.ipc.sink.strategy={{getv "/core/ipc/sink/strategy"}}
org.opennms.core.ipc.sink.initialSleepTime={{getv "/core/ipc/sink/initialsleeptime" "60000"}}
{{end}}
{{if exists "/core/ipc/rpc/strategy"}}
#
### Global RPC Settings
org.opennms.core.ipc.rpc.strategy={{getv "/core/ipc/rpc/strategy"}}
{{end}}
{{if or (and (exists "/core/ipc/sink/strategy") (eq (getv "/core/ipc/sink/strategy" "") ("sqs"))) (and (exists "/core/ipc/rpc/strategy") (eq (getv "/core/ipc/rpc/strategy" "") ("sqs")))}}
#
# Global AWS Settings for RPC and Sink
org.opennms.core.ipc.aws.sqs.aws_region={{getv "/core/ipc/aws/sqs/aws/region"}}
org.opennms.core.ipc.aws.sqs.aws_access_key_id={{getv "/core/ipc/aws/sqs/aws/access/key/id"}}
org.opennms.core.ipc.aws.sqs.aws_secret_access_key={{getv "/core/ipc/aws/sqs/aws/secret/access/key"}}
{{end}}
{{if and (exists "/core/ipc/rpc/strategy") (eq (getv "/core/ipc/rpc/strategy" "") ("kafka"))}}
#
# Kafka RPC Settings
org.opennms.core.ipc.rpc.kafka.bootstrap.servers={{getv "/core/ipc/rpc/kafka/bootstrap/servers" "127.0.0.1.9092"}}
org.opennms.core.ipc.rpc.kafka.ttl={{getv "/core/ipc/rpc/kafka/ttl" "30000"}}
org.opennms.core.ipc.rpc.kafka.max.buffer.size={{getv "/core/ipc/rpc/kafka/max/buffer/size" "921600"}}
{{end}}
{{if and (exists "/core/ipc/sink/strategy") (eq (getv "/core/ipc/sink/strategy" "") ("kafka"))}}
#
# Kafka Sink Settings
{{if exists "/core/ipc/sink/kafka/group/id"}}
org.opennms.core.ipc.sink.kafka.group.id={{getv "/core/ipc/sink/kafka/group/id"}}
{{end}}
org.opennms.core.ipc.sink.kafka.bootstrap.servers={{getv "/core/ipc/sink/kafka/bootstrap/servers" "127.0.0.1.9092"}}
{{end}}
{{if and (exists "/core/ipc/rpc/strategy") (eq (getv "/core/ipc/rpc/strategy" "") ("sqs"))}}
#
# AWS RPC Settings
org.opennms.core.ipc.aws.sqs.rpc.DelaySeconds={{getv "/core/ipc/aws/sqs/rpc/delayseconds" "0"}}
org.opennms.core.ipc.aws.sqs.rpc.MaximumMessageSize={{getv "/core/ipc/aws/sqs/rpc/maximummessagesize" "262144"}}
org.opennms.core.ipc.aws.sqs.rpc.MessageRetentionPeriod={{getv "/core/ipc/aws/sqs/rpc/messageretentionperiod" "1209600"}}
org.opennms.core.ipc.aws.sqs.rpc.ReceiveMessageWaitTimeSeconds={{getv "/core/ipc/aws/sqs/rpc/receivemessagewaittimeseconds" "10"}}
org.opennms.core.ipc.aws.sqs.rpc.VisibilityTimeout={{getv "/core/ipc/aws/sqs/rpc/visibilitytimeout" "30"}}
{{if exists "/core/ipc/aws/sqs/rpc/policy"}}
org.opennms.core.ipc.aws.sqs.rpc.Policy={{getv "/core/ipc/aws/sqs/rpc/policy"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/rpc/redrivepolicy"}}
org.opennms.core.ipc.aws.sqs.rpc.RedrivePolicy={{getv "/core/ipc/aws/sqs/rpc/redrivepolicy"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/rpc/kmsmasterkeyid"}}
org.opennms.core.ipc.aws.sqs.rpc.KmsMasterKeyId={{getv "/core/ipc/aws/sqs/rpc/kmsmasterkeyid"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/rpc/kmsdatakeyreuseperiodseconds"}}
org.opennms.core.ipc.aws.sqs.rpc.KmsDataKeyReusePeriodSeconds={{getv "/core/ipc/aws/sqs/rpc/kmsdatakeyreuseperiodseconds"}}
{{end}}
org.opennms.core.ipc.aws.sqs.rpc.FifoQueue={{getv "/core/ipc/aws/sqs/rpc/fifoqueue" "false"}}
org.opennms.core.ipc.aws.sqs.rpc.ContentBasedDeduplication{{getv "/core/ipc/aws/sqs/rpc/contentbaseddeduplication" "false"}}
{{end}}
{{if and (exists "/core/ipc/sink/strategy") (eq (getv "/core/ipc/sink/strategy" "") ("sqs"))}}
#
# AWS Sink Settings
org.opennms.core.ipc.aws.sqs.sink.DelaySeconds={{getv "/core/ipc/aws/sqs/sink/delayseconds" "0"}}
org.opennms.core.ipc.aws.sqs.sink.MaximumMessageSize={{getv "/core/ipc/aws/sqs/sink/maximummessagesize" "262144"}}
org.opennms.core.ipc.aws.sqs.sink.MessageRetentionPeriod={{getv "/core/ipc/aws/sqs/sink/messageretentionperiod" "1209600"}}
org.opennms.core.ipc.aws.sqs.sink.ReceiveMessageWaitTimeSeconds={{getv "/core/ipc/aws/sqs/sink/receivemessagewaittimeseconds" "10"}}
org.opennms.core.ipc.aws.sqs.sink.VisibilityTimeout={{getv "/core/ipc/aws/sqs/sink/visibilitytimeout" "30"}}
{{if exists "/core/ipc/aws/sqs/sink/policy"}}
org.opennms.core.ipc.aws.sqs.sink.Policy={{getv "/core/ipc/aws/sqs/sink/policy"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/sink/redrivepolicy"}}
org.opennms.core.ipc.aws.sqs.sink.RedrivePolicy={{getv "/core/ipc/aws/sqs/sink/redrivepolicy"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/sink/kmsmasterkeyid"}}
org.opennms.core.ipc.aws.sqs.sink.KmsMasterKeyId={{getv "/core/ipc/aws/sqs/sink/kmsmasterkeyid"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/sink/kmsdatakeyreuseperiodseconds"}}
org.opennms.core.ipc.aws.sqs.sink.KmsDataKeyReusePeriodSeconds={{getv "/core/ipc/aws/sqs/sink/kmsdatakeyreuseperiodseconds"}}
{{end}}
org.opennms.core.ipc.aws.sqs.sink.FifoQueue={{getv "/core/ipc/aws/sqs/sink/fifoqueue" "false"}}
org.opennms.core.ipc.aws.sqs.sink.ContentBasedDeduplication{{getv "/core/ipc/aws/sqs/sink/contentbaseddeduplication" "false"}}
{{end}}

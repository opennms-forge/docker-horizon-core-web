#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
#
{{if exists "/core/ipc/sink/strategy"}}
#
# Global Sink Settings
org.opennms.core.ipc.sink.strategy={{getv "/core/ipc/sink/strategy"}}
org.opennms.core.ipc.sink.initialSleepTime={{getv "/core/ipc/sink/initial/sleep/time" "60000"}}
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
org.opennms.core.ipc.aws.sqs.rpc.DelaySeconds={{getv "/core/ipc/aws/sqs/rpc/delay/seconds" "0"}}
org.opennms.core.ipc.aws.sqs.rpc.MaximumMessageSize={{getv "/core/ipc/aws/sqs/rpc/maximum/message/size" "262144"}}
org.opennms.core.ipc.aws.sqs.rpc.MessageRetentionPeriod={{getv "/core/ipc/aws/sqs/rpc/message/retention/period" "1209600"}}
org.opennms.core.ipc.aws.sqs.rpc.ReceiveMessageWaitTimeSeconds={{getv "/core/ipc/aws/sqs/rpc/receive/message/wait/time/seconds" "10"}}
org.opennms.core.ipc.aws.sqs.rpc.VisibilityTimeout={{getv "/core/ipc/aws/sqs/rpc/visibility/timeout" "30"}}
{{if exists "/core/ipc/aws/sqs/rpc/policy"}}
org.opennms.core.ipc.aws.sqs.rpc.Policy={{getv "/core/ipc/aws/sqs/rpc/policy"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/rpc/redrive/policy"}}
org.opennms.core.ipc.aws.sqs.rpc.RedrivePolicy={{getv "/core/ipc/aws/sqs/rpc/redrive/policy"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/rpc/kms/master/keyid"}}
org.opennms.core.ipc.aws.sqs.rpc.KmsMasterKeyId={{getv "/core/ipc/aws/sqs/rpc/kms/master/keyid"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/rpc/kms/data/key/reuse/period/seconds"}}
org.opennms.core.ipc.aws.sqs.rpc.KmsDataKeyReusePeriodSeconds={{getv "/core/ipc/aws/sqs/rpc/kms/data/key/reuse/period/seconds"}}
{{end}}
org.opennms.core.ipc.aws.sqs.rpc.FifoQueue={{getv "/core/ipc/aws/sqs/rpc/fifo/queue" "false"}}
org.opennms.core.ipc.aws.sqs.rpc.ContentBasedDeduplication{{getv "/core/ipc/aws/sqs/rpc/content/based/deduplication" "false"}}
{{end}}
{{if and (exists "/core/ipc/sink/strategy") (eq (getv "/core/ipc/sink/strategy" "") ("sqs"))}}
#
# AWS Sink Settings
org.opennms.core.ipc.aws.sqs.sink.DelaySeconds={{getv "/core/ipc/aws/sqs/sink/delay/seconds" "0"}}
org.opennms.core.ipc.aws.sqs.sink.MaximumMessageSize={{getv "/core/ipc/aws/sqs/sink/maximum/message/size" "262144"}}
org.opennms.core.ipc.aws.sqs.sink.MessageRetentionPeriod={{getv "/core/ipc/aws/sqs/sink/message/retention/period" "1209600"}}
org.opennms.core.ipc.aws.sqs.sink.ReceiveMessageWaitTimeSeconds={{getv "/core/ipc/aws/sqs/sink/receive/message/wait/times/econds" "10"}}
org.opennms.core.ipc.aws.sqs.sink.VisibilityTimeout={{getv "/core/ipc/aws/sqs/sink/visibility/timeout" "30"}}
{{if exists "/core/ipc/aws/sqs/sink/policy"}}
org.opennms.core.ipc.aws.sqs.sink.Policy={{getv "/core/ipc/aws/sqs/sink/policy"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/sink/redrive/policy"}}
org.opennms.core.ipc.aws.sqs.sink.RedrivePolicy={{getv "/core/ipc/aws/sqs/sink/redrive/policy"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/sink/kms/master/keyid"}}
org.opennms.core.ipc.aws.sqs.sink.KmsMasterKeyId={{getv "/core/ipc/aws/sqs/sink/kms/master/keyid"}}
{{end}}
{{if exists "/core/ipc/aws/sqs/sink/kms/data/key/reuse/period/seconds"}}
org.opennms.core.ipc.aws.sqs.sink.KmsDataKeyReusePeriodSeconds={{getv "/core/ipc/aws/sqs/sink/kms/data/key/reuse/period/seconds"}}
{{end}}
org.opennms.core.ipc.aws.sqs.sink.FifoQueue={{getv "/core/ipc/aws/sqs/sink/fifo/queue" "false"}}
org.opennms.core.ipc.aws.sqs.sink.ContentBasedDeduplication{{getv "/core/ipc/aws/sqs/sink/content/based/deduplication" "false"}}
{{end}}

#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$sink := "/core/ipc/sink" -}}
{{$sink_strategy := (print $sink "/strategy") -}}
{{$rpc := "/core/ipc/rpc" -}}
{{$rpc_strategy := (print $sink "/strategy") -}}
{{if exists $sink_strategy -}}
#
# Global Sink Settings
org.opennms.core.ipc.sink.strategy={{getv $sink_strategy}}
org.opennms.core.ipc.sink.initialSleepTime={{getv (print $sink "/initial-sleep-time") "60000"}}
{{end -}}
{{if exists $rpc_strategy -}}
#
# Global RPC Settings
org.opennms.core.ipc.rpc.strategy={{getv $rpc_strategy}}
{{end -}}
{{if or (eq (getv $sink_strategy "") "sqs") (eq (getv $rpc_strategy "") "sqs") -}}
#
# Global AWS Settings for RPC and Sink
{{$aws := "/core/ipc/aws" -}}
org.opennms.core.ipc.aws.sqs.aws_region={{getv (print $aws "/aws-region")}}
org.opennms.core.ipc.aws.sqs.aws_access_key_id={{getv (print $aws "/aws-access-key-id")}}
org.opennms.core.ipc.aws.sqs.aws_secret_access_key={{getv (print $aws "/aws-secret-access-key")}}
{{end -}}
{{if (eq (getv $rpc_strategy "") "kafka") -}}
#
# Kafka RPC Settings
{{$kafka_rpc_settings := (print $rpc "/kafka") -}}
{{range ls $kafka_rpc_settings -}}
{{print "org.opennms.core.ipc.rpc.kafka." .}}={{getv (print $kafka_rpc_settings "/" .)}}
{{end -}}
{{end -}}
{{if (eq (getv $sink_strategy "") "kafka") -}}
#
# Kafka Sink Settings
{{$kafka_sink_settings := (print $sink "/kafka") -}}
{{range ls $kafka_sink_settings -}}
{{print "org.opennms.core.ipc.sink.kafka." .}}={{getv (print $kafka_sink_settings "/" .)}}
{{end -}}
{{end -}}
{{if (eq (getv $rpc_strategy "") "sqs") -}}
#
# AWS RPC Settings
{{$aws_rpc_settings := (print $rpc "/sqs") -}}
{{range ls $aws_rpc_settings -}}
{{print "org.opennms.core.ipc.aws.sqs.rpc." .}}={{getv (print $aws_rpc_settings "/" .)}}
{{end -}}
{{end -}}
{{if (eq (getv $sink_strategy "") "sqs") -}}
#
# AWS Sink Settings
{{$aws_sink_settings := (print $sink "/sqs") -}}
{{range ls $aws_sink_settings -}}
{{print "org.opennms.core.ipc.aws.sqs.sink." .}}={{getv (print $aws_sink_settings "/" .)}}
{{end -}}
{{end -}}

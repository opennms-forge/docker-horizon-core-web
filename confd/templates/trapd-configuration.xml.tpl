<!-- DO NOT CHANGE THIS FILE! GENERATED FROM confd -->

<trapd-configuration xmlns="http://xmlns.opennms.org/xsd/config/trapd"
  snmp-trap-address="{{getv "/trapd/snmp-trap-address" "*"}}"
  snmp-trap-port="{{getv "/trapd/snmp-trap-port" "1162"}}"
  new-suspect-on-trap="{{getv "/trapd/new-suspect-on-trap" "false"}}"
  include-raw-message="{{getv "/trapd/include-raw-message" "false"}}"
  threads="{{getv "/trapd/threads" "0"}}"
  queue-size="{{getv "/trapd/queue-size" "10000"}}"
  batch-size="{{getv "/trapd/batch-size" "1000"}}"
  batch-interval="{{getv "/trapd/batch-interval" "500"}}"/>

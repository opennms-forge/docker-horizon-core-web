#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/sms-gateway" -}}
gnu.io.SerialPorts={{getv (print $base "/serial-ports") "/dev/ttyACM0:/dev/ttyACM1:/dev/ttyACM2:/dev/ttyACM3:/dev/ttyACM4:/dev/ttyACM5"}}
smslib.serial.polling={{getv (print $base "/serial-polling") "true"}}

#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/rtc" -}}
opennms.rtc.event.proxy.host={{getv (print $base "/event/proxy/host") "127.0.0.1"}}
opennms.rtc.event.proxy.port={{getv (print $base "/event/proxy/port") "5817"}}
opennms.rtc.event.proxy.timeout={{getv (print $base "/event/proxy/timeout") "2000"}}
opennms.rtc-client.http-post.base-url={{getv (print $base "/client/http-post/base-url") "http://localhost:8980/opennms/rtc/post"}}
opennms.rtc-client.http-post.username={{getv (print $base "/client/http-post/username") "rtc"}}
opennms.rtc-client.http-post.password={{getv (print $base "/client/http-post/password") "rtc"}}
opennms.map-client.http-post.url={{getv (print $base "/map-client/http-post/url") "http://localhost:8980/opennms/map/post"}}
opennms.map-client.http-post.username={{getv (print $base "/map-client/http-post/username") "map"}}
opennms.map-client.http-post.password={{getv (print $base "/map-client/http-post/password") "map"}}

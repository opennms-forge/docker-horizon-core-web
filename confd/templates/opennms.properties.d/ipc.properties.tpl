#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
opennms.rtc.event.proxy.host={{getv "/rtc/event/proxy/host" "127.0.0.1"}}
opennms.rtc.event.proxy.port={{getv "/rtc/event/proxy/port" "5817"}}
opennms.rtc.event.proxy.timeout={{getv "/rtc/event/proxy/timeout" "2000"}}
opennms.rtc-client.http-post.base-url = {{getv "/rtc-client/http-post/base-url" "http://localhost:8980/opennms/rtc/post"}}
opennms.rtc-client.http-post.username = {{getv "/rtc-client/http-post/username" "rtc"}}
opennms.rtc-client.http-post.password = {{getv "/rtc-client/http-post/password" "rtc"}}
opennms.map-client.http-post.url = {{getv "/map-client/http-post/url" "http://localhost:8980/opennms/map/post"}}
opennms.map-client.http-post.username = {{getv "/map-client/http-post/username" "map"}}
opennms.map-client.http-post.password = {{getv "/map-client/http-post/password" "map"}}

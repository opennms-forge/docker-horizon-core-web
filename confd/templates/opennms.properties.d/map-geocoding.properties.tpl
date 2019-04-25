#
# DO NOT CHANGE THIS FILE! GENERATED FROM confd
#
{{$base := "/map-geocoding" -}}
gwt.maptype={{getv (print $base "/maptype") "OpenLayers"}}
gwt.apikey={{getv (print $base "/apikey") ""}}
gwt.geocoder.class={{getv (print $base "/geocoder/class") "org.opennms.features.poller.remote.gwt.server.geocoding.NullGeocoder"}}
gwt.geocoder.rate={{getv (print $base "/geocoder/rate") "10"}}
gwt.geocoder.referer={{getv (print $base "/geocoder/referer") "http://localhost/"}}
gwt.geocoder.minimumQuality={{getv (print $base "/geocoder/minimumQuality") "ZIP"}}
gwt.geocoder.email={{getv (print $base "/geocoder/email") ""}}
gwt.openlayers.url={{getv (print $base "/openlayers/url") "https://tiles.opennms.org/${z}/${x}/${y}.png"}}
gwt.openlayers.options.attribution={{getv (print $base "/openlayers/options/attribution") "Map data &copy; <a tabindex=\"-1\" target=\"_blank\" href=\"http://openstreetmap.org/copyright\">OpenStreetMap</a> contributors under <a tabindex=\"-1\" target=\"_blank\" href=\"http://opendatacommons.org/licenses/odbl/\">ODbL</a>, <a tabindex=\"-1\" target=\"_blank\" href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC BY-SA 2.0</a>"}}
gwt.maxClusterRadius={{getv (print $base "/max-cluster-radius") "350"}}

FROM opennms/openjdk:8u121-jdk

MAINTAINER Ronny Trommer <ronny@opennms.org>

ARG OPENNMS_VERSION=develop

RUN rpm -Uvh http://yum.opennms.org/repofiles/opennms-repo-${OPENNMS_VERSION}-rhel7.noarch.rpm && \
    rpm --import http://yum.opennms.org/OPENNMS-GPG-KEY && \
    yum -y install iplike \
                   rrdtool \
                   jrrd2 \
                   opennms-core \
                   opennms-webapp-jetty && \
    rm -rf /opt/opennms/logs \
           /var/opennms/rrd \
           /var/opennms/reports && \
    mkdir -p /opennms-data/logs \
             /opennms-data/rrd \
             /opennms-data/reports && \
    ln -s /opennms-data/logs /opt/opennms/logs && \
    ln -s /opennms-data/rrd /var/opennms/rrd && \
    ln -s /opennms-data/reports /var/opennms/reports

COPY ./assets/opennms-datasources.xml.tpl /tmp
COPY ./docker-entrypoint.sh /

## Volumes for storing data outside of the container
VOLUME ["/opt/opennms/etc", "/opennms-data"]

HEALTHCHECK --interval=10s --timeout=3s CMD curl --fail -s -I http://localhost:8980/opennms/login.jsp | grep "HTTP/1.1 200 OK" || exit 1

LABEL license="AGPLv3" \
      org.opennms.horizon.version="20.0.0-SNAPSHOT" \
      vendor="OpenNMS Community" \
      name="Horizon 20.0.0-SNAPSHOT"

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "-h" ]

##------------------------------------------------------------------------------
## EXPOSED PORTS
##------------------------------------------------------------------------------
## -- OpenNMS HTTP        8980/TCP
## -- OpenNMS JMX        18980/TCP
## -- OpenNMS KARAF RMI   1099/TCP
## -- OpenNMS KARAF SSH   8101/TCP
## -- OpenNMS MQ         61616/TCP
## -- OpenNMS Eventd      5817/TCP
## -- SNMP Trapd           162/UDP
## -- Syslog Receiver      514/UDP
EXPOSE 8980 18980 1099 8101 61616 5817 162/udp 514/udp

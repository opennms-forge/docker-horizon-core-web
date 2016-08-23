FROM indigo/centos-jdk8:latest
MAINTAINER Ronny Trommer <ronny@opennms.org>

ENV OPENNMS_VERSION develop
ENV OPENNMS_HOME=/opt/opennms

RUN rpm -Uvh http://yum.opennms.org/repofiles/opennms-repo-${OPENNMS_VERSION}-rhel7.noarch.rpm && \
    rpm --import http://yum.opennms.org/OPENNMS-GPG-KEY && \
    yum -y install iplike && \
    yum -y install rrdtool && \
    yum -y install jrrd2 && \
    yum -y install opennms-core && \
    yum -y install opennms-webapp-jetty

COPY ./docker-entrypoint.sh /

## Volumes for storing data outside of the container
VOLUME ["/opt/opennms/etc","/var/log/opennms","/var/opennnms/rrd", "/var/opennms/reports"]

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "-h" ]

##------------------------------------------------------------------------------
## EXPOSED PORTS
##------------------------------------------------------------------------------
## -- OpenNMS HTTP       8980/TCP
## -- OpenNMS JMX        18980/TCP
## -- OpenNMS KARAF RMI  1099/TCP
## -- OpenNMS KARAF SSH  8101/TCP
## -- OpenNMS MQ         61616/TCP
## -- OpenNMS Eventd     5817/TCP
## -- SNMP (SERVER)      162/UDP
EXPOSE 8980 18980 1099 8101 61616 5817 162/udp
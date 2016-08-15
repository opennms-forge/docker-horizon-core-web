FROM indigo/centos-jdk8:latest
MAINTAINER Ronny Trommer <ronny@no42.org>

ENV OPENNMS_VERSION branches-release-18.0.1
ENV DB_NAME opennms
ENV DB_USER opennms
ENV DB_PASS opennms

RUN rpm -Uvh http://yum.opennms.eu/repofiles/opennms-repo-${OPENNMS_VERSION}-rhel7.noarch.rpm && \
    rpm --import http://yum.opennms.org/OPENNMS-GPG-KEY && \
    yum -y install opennms-core && \
    yum -y install opennms-webapp-jetty

##------------------------------------------------------------------------------
## EXPOSED PORTS
##------------------------------------------------------------------------------
## -- OpenNMS HTTP       Port(8980)
## -- OpenNMS JMX        Port(18980)
## -- OpenNMS KARAF RMI  Port(1099)
## -- OpenNMS KARAF SSH  Port(8101)
## -- OpenNMS MQ         Port(61616)
## -- OpenNMS Eventd     Port(5817)
## -- SNMP (SERVER)      Port(162)
EXPOSE 8980 18980 1099 8101 61616 5817 162
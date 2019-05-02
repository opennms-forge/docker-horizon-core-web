#
# Dockerfile to build the Official OpenNMS Horizon OCI image with Docker
#
ARG BASE_IMAGE="opennms/base-horizon"
ARG BASE_IMAGE_VERSION="jdk11-1.0.0"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION=${BASE_IMAGE_VERSION}
ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG ONMS_UID=10001

ARG PACKAGES

ARG ONMS_PACKAGES="opennms-core opennms-webapp-jetty opennms-webapp-hawtio"
ARG OPENNMS_OVERLAY="/opt/opennms-overlay"

SHELL ["/bin/bash", "-c"]

# Add templates replaced at runtime and entrypoint
COPY ./assets/entrypoint.sh /
COPY ./rpms /tmp/rpms
COPY ./confd /etc/confd

# Install packages, repositories and dependencies
RUN if [[ -n ${PACKAGES} ]]; then yum -y install ${PACKAGES}; fi && \
    if [[ "$(ls -1 /tmp/rpms/*.rpm 2>/dev/null | wc -l)" != 0 ]]; then yum -y localinstall /tmp/rpms/*.rpm; else yum -y install ${ONMS_PACKAGES}; fi && \
    yum clean all -y && \
    rm -rf /var/cache/yum && \
    rm -rf /tmp/rpms && \
    mkdir -p "${OPENNMS_OVERLAY}" && \
    groupadd -g ${ONMS_UID} opennms && \
    useradd -u ${ONMS_UID} -g ${ONMS_UID} -r -d /opt/opennms -s /bin/bash opennms && \
    cp /etc/skel/.bash* /opt/opennms/ && \
    chmod 0775 /opt/opennms "${OPENNMS_OVERLAY}" /entrypoint.sh && \
    chown opennms:opennms -R /opt/opennms /var/opennms /var/log/opennms "${OPENNMS_OVERLAY}" && \
    chgrp -R 0 /opt/opennms /var/opennms /var/log/opennms "${OPENNMS_OVERLAY}" && \
    chmod -R g=u /opt/opennms /var/opennms /var/log/opennms "${OPENNMS_OVERLAY}"

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Horizon" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community"

WORKDIR /opt/opennms

ENTRYPOINT [ "/entrypoint.sh" ]

USER ${ONMS_UID}

STOPSIGNAL SIGTERM

CMD [ "-h" ]

### Runtime information and not relevant at build time

ENV JAVA_MEM_OPTS="-Xmx1024m -XX:MaxMetaspaceSize=512m"
ENV JAVA_OPTS ""

# Volumes for data which need to be persistent
VOLUME [ "/opt/opennms-overlay", "/opt/opennms/etc", "/opt/opennms/share/rrd", "/opt/opennms/share/reports", "/opt/opennms/share/mibs" ]

##------------------------------------------------------------------------------
## EXPOSED PORTS
##------------------------------------------------------------------------------
## -- OpenNMS HTTP        8980/TCP
## -- OpenNMS JMX        18980/TCP
## -- OpenNMS KARAF RMI   1099/TCP
## -- OpenNMS KARAF SSH   8101/TCP
## -- OpenNMS MQ         61616/TCP
## -- OpenNMS Eventd      5817/TCP
## -- SNMP Trapd          1162/UDP
## -- Syslog Receiver     1514/UDP
EXPOSE 8980 8101 1162/udp

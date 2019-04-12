#
# Dockerfile to build the Official OpenNMS Horizon OCI image with Docker
#
ARG BASE_IMAGE="opennms/openjdk"
ARG BASE_IMAGE_VERSION="11.0.2.7"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION=${BASE_IMAGE_VERSION}
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

ARG PACKAGES="wget gettext"
ARG CONFD_VERSION="0.16.0"
ARG CONFD_URL="https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64"

ARG REPO_KEY_URL="https://${REPO_HOST}/OPENNMS-GPG-KEY"
ARG REPO_RPM="https://${REPO_HOST}/repofiles/opennms-repo-${REPO_RELEASE}-rhel7.noarch.rpm"
ARG ONMS_PACKAGES="opennms-core opennms-webapp-jetty opennms-webapp-hawtio"
ARG OPENNMS_OVERLAY="/opt/opennms-overlay"

SHELL ["/bin/bash", "-c"]

# Add templates replaced at runtime and entrypoint
COPY ./assets/entrypoint.sh /
COPY ./rpms /tmp/rpms
COPY ./confd /etc/confd

# Install packages, repositories and dependencies
RUN curl -L ${CONFD_URL} -o /usr/bin/confd && \
    chmod +x /usr/bin/confd && \
    yum -y install epel-release && \
    rpm --import "${REPO_KEY_URL}" && \
    yum -y install ${REPO_RPM} && \
    yum -y install ${PACKAGES} && \
    if [ "$(ls -1 /tmp/rpms/*.rpm 2>/dev/null | wc -l)" != 0 ]; then yum -y localinstall /tmp/rpms/*.rpm; else yum -y install ${ONMS_PACKAGES}; fi && \
    yum clean all -y && \
    rm -rf /var/cache/yum && \
    rm -rf /tmp/rpms && \
    mkdir -p "${OPENNMS_OVERLAY}" && \
    groupadd -g 10001 opennms && \
    useradd -u 10001 -g 10001 -r -d /opt/opennms -s /usr/bin/bash opennms && \
    chmod 0775 /opt/opennms "${OPENNMS_OVERLAY}" /entrypoint.sh && \
    chown opennms:opennms -R /opt/opennms "${OPENNMS_OVERLAY}" && \
    chgrp -R 0 /opt/opennms "${OPENNMS_OVERLAY}" && \
    chmod -R g=u /opt/opennms "${OPENNMS_OVERLAY}"

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="Horizon" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      io.confd.version="${CONFD_VERSION}"

WORKDIR /opt/opennms

ENTRYPOINT [ "/entrypoint.sh" ]

USER root

STOPSIGNAL SIGTERM

CMD [ "-h" ]

### Runtime information and not relevant at build time

ENV JAVA_MEM_OPTS="-Xmx1024m -XX:MaxMetaspaceSize=512m"
ENV JAVA_OPTS ""
ENV CONFD_BACKEND="env"

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

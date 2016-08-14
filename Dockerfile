FROM indigo/centos-jdk8:latest
MAINTAINER Ronny Trommer <ronny@no42.org>

ENV OPENNMS_VERSION branches-release-18.0.0
ENV OPENNMS_HOME /opt/opennms
ENV DB_NAME opennms
ENV DB_USER opennms
ENV DB_PASS opennms

RUN rpm -Uvh http://yum.opennms.eu/repofiles/opennms-repo-${OPENNMS_VERSION}-rhel7.noarch.rpm && \
    rpm --import http://yum.opennms.org/OPENNMS-GPG-KEY && \
    yum -y install opennms && \
    postgresql-setup initdb && \
    sed -i 's/all             127\.0\.0\.1\/32            ident/all             127.0.0.1\/32            trust/g' /var/lib/pgsql/data/pg_hba.conf && \
    sed -i 's/all             ::1\/128                 ident/all             ::1\/128                 trust/g' /var/lib/pgsql/data/pg_hba.conf && \
    ${OPENNMS_HOME}/bin/runjava -s && \
    ${OPENNMS_HOME}/bin/install -dis


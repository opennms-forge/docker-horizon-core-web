#!/bin/bash -e
# =====================================================================
# Build script running OpenNMS in Docker environment
#
# Source: https://github.com/indigo423/docker-opennms
# Web: https://www.opennms.org
#
# =====================================================================

START_DELAY=5
OPENNMS_DATA_DIR=/opennms-data
OPENNMS_HOME=/opt/opennms

# Error codes
E_ILLEGAL_ARGS=126

# Help function used in error messages and -h option
usage() {
    echo ""
    echo "Docker entry script for OpenNMS service container"
    echo ""
    echo "-f: Initialize as in -i and start OpenNMS in foreground."
    echo "-h: Show this help."
    echo "-i: Initialize Java environment, database and pristine OpenNMS configuration files."
    echo "-s: Start OpenNMS core monitoring and web application services."
    echo ""
}

initdb() {
    if [ ! -d ${OPENNMS_HOME} ]; then
        echo "OpenNMS home directory doesn't exist in ${OPENNMS_HOME}."
        exit ${E_ILLEGAL_ARGS}
    fi

    if [ ! -f ${OPENNMS_HOME}/etc/configured ]; then
        sed -i "s,url=\"jdbc:postgresql:\/\/localhost:5432\/template1\",url=\"jdbc:postgresql:\/\/${POSTGRES_HOST}:${POSTGRES_PORT}\/template1\"," ${OPENNMS_DB_CONFIG}
        sed -i "s,user-name=\"postgres\",user-name=\"${POSTGRES_USER}\"," ${OPENNMS_DB_CONFIG}
        sed -i "s,password=\"\",password=\"${POSTGRES_PASSWORD}\"," ${OPENNMS_DB_CONFIG}

        sed -i "s,url=\"jdbc:postgresql:\/\/localhost:5432\/opennms\",url=\"jdbc:postgresql:\/\/${POSTGRES_HOST}:${POSTGRES_PORT}\/${OPENNMS_DBNAME}\"," ${OPENNMS_DB_CONFIG}
        sed -i "s,user-name=\"opennms\",user-name=\"${OPENNMS_DBUSER}\"," ${OPENNMS_DB_CONFIG}
        sed -i "s,password=\"opennms\",password=\"${OPENNMS_DBPASS}\"," ${OPENNMS_DB_CONFIG}

        cd ${OPENNMS_HOME}/bin
        ./runjava -s
        sleep ${START_DELAY}
        ./install -dis
    else
        echo "OpenNMS is already configured skip initdb."
    fi
}

initConfig() {
    if [ ! "$(ls -A ${OPENNMS_HOME}/etc)"  ]; then
        cp -r ${OPENNMS_HOME}/share/etc-pristine/* ${OPENNMS_HOME}/etc/
    else
        echo "OpenNMS configuration already initialized."
    fi
}

initData() {
    mkdir -p ${OPENNMS_DATA_DIR}/logs \
             ${OPENNMS_DATA_DIR}/rrd \
             ${OPENNMS_DATA_DIR}/reports
}

start() {
    cd ${OPENNMS_HOME}/bin
    sleep ${START_DELAY}
    exec ./opennms -f start
}

# Evaluate arguments for build script.
if [[ "${#}" == 0 ]]; then
    usage
    exit ${E_ILLEGAL_ARGS}
fi

# Evaluate arguments for build script.
while getopts fhis flag; do
    case ${flag} in
        f)
            initConfig
            initdb
            initData
            start
            exit
            ;;
        h)
            usage
            exit
            ;;
        i)
            initConfig
            initdb
            initData
            exit
            ;;
        s)
            start
            exit
            ;;
        *)
            usage
            exit ${E_ILLEGAL_ARGS}
            ;;
    esac
done

# Strip of all remaining arguments
shift $((OPTIND - 1));

# Check if there are remaining arguments
if [[ "${#}" > 0 ]]; then
    echo "Error: To many arguments: ${*}."
    usage
    exit ${E_ILLEGAL_ARGS}
fi

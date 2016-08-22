#!/bin/bash -e
# =====================================================================
# Build script running OpenNMS in Docker environment
#
# Source: https://github.com/indigo423/docker-opennms
# Web: https://www.opennms.org
#
# =====================================================================

# Error codes
E_ILLEGAL_ARGS=126

# Help function used in error messages and -h option
usage() {
    echo ""
    echo "Docker entry script for OpenNMS service container"
    echo ""
    echo "-i: Initialize/Update database and Java environment"
    echo "-s: Start OpenNMS core monitoring and webapplication services"
    echo "-f: Initialize/Update the database and start OpenNMS in forground in one step"
    echo "-h: Show this help"
    echo ""
}

initdb() {
    if [ ! -d ${OPENNMS_HOME} ]; then
        echo "OpenNMS home directory doesn't exist in ${OPENNMS_HOME}"
        exit
    fi

    sed -i "s,url=\"jdbc:postgresql:\/\/localhost:5432\/template1\",url=\"jdbc:postgresql:\/\/${POSTGRES_HOST}:${POSTGRES_PORT}\/template1\"," ${OPENNMS_DB_CONFIG}
    sed -i "s,user-name=\"postgres\",user-name=\"${POSTGRES_USER}\"," ${OPENNMS_DB_CONFIG}
    sed -i "s,password=\"\",password=\"${POSTGRES_PASSWORD}\"," ${OPENNMS_DB_CONFIG}

    sed -i "s,url=\"jdbc:postgresql:\/\/localhost:5432\/opennms\",url=\"jdbc:postgresql:\/\/${POSTGRES_HOST}:${POSTGRES_PORT}\/${OPENNMS_DBNAME}\"," ${OPENNMS_DB_CONFIG}
    sed -i "s,user-name=\"opennms\",user-name=\"${OPENNMS_DBUSER}\"," ${OPENNMS_DB_CONFIG}
    sed -i "s,password=\"opennms\",password=\"${OPENNMS_DBPASS}\"," ${OPENNMS_DB_CONFIG}

    cd ${OPENNMS_HOME}/bin
    ./runjava -s
    ./install -dis
}

start() {
    cd ${OPENNMS_HOME}/bin
    exec ./opennms -f start
}

# Evaluate arguments for build script.
if [[ "${#}" == 0 ]]; then
    usage
    exit ${E_ILLEGAL_ARGS}
fi

# Evaluate arguments for build script.
while getopts his flag; do
    case ${flag} in
        h)
            usage
            exit
            ;;
        i)
            initdb
            exit
            ;;
        s)
            start
            exit
            ;;
        f)
            initdb
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
    echo "Error: To many arguments: ${*}"
    usage
    exit ${E_ILLEGAL_ARGS}
fi

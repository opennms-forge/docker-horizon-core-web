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

OPENNMS_DATASOURCES_TPL=/tmp/opennms-datasources.xml.tpl
OPENNMS_DATASOURCES_CFG=${OPENNMS_HOME}/etc/opennms-datasources.xml

OPENNMS_KARAF_TPL=/tmp/org.apache.karaf.shell.cfg.tpl
OPENNMS_KARAF_CFG=${OPENNMS_HOME}/etc/org.apache.karaf.shell.cfg
OPENNMS_KARAF_SSH_HOST="0.0.0.0"
OPENNMS_KARAF_SSH_HOST="8101"

# Error codes
E_ILLEGAL_ARGS=126

# Help function used in error messages and -h option
usage() {
  echo ""
  echo "Docker entry script for OpenNMS service container"
  echo ""
  echo "-f: Start OpenNMS in foreground with an existing configuration."
  echo "-h: Show this help."
  echo "-i: Initialize Java environment, database and pristine OpenNMS configuration files and do *NOT* start OpenNMS."
  echo "    The database and config file initialization is skipped when a configured file exist."
  echo "-s: Initialize environment like -i and start OpenNMS in foreground."
  echo ""
}

# Initialize database and configure Karaf
initdb() {
  if [ ! -d ${OPENNMS_HOME} ]; then
    echo "OpenNMS home directory doesn't exist in ${OPENNMS_HOME}."
    exit ${E_ILLEGAL_ARGS}
  fi

  # Check if the configured guard file exist
  if [ ! -f ${OPENNMS_HOME}/etc/configured ]; then
    envsubst < ${OPENNMS_DATASOURCES_TPL} > ${OPENNMS_DATASOURCES_CFG}
    envsubst < ${OPENNMS_KARAF_TPL} > ${OPENNMS_KARAF_CFG}
    cd ${OPENNMS_HOME}/bin
    ./runjava -s

    # Wait until the Postgres container is ready
    sleep ${START_DELAY}
    ./install -dis
  else
    echo "OpenNMS is already configured skip initdb."
  fi
}

# In case there is no configuration, initialize with a plain config from etc-pristine
initConfig() {
  if [ ! "$(ls --ignore .git --ignore .gitignore --ignore ${OPENNMS_DATASOURCES_CFG} -A ${OPENNMS_HOME}/etc)"  ]; then
    cp -r ${OPENNMS_HOME}/share/etc-pristine/* ${OPENNMS_HOME}/etc/
  else
    echo "OpenNMS configuration already initialized."
  fi
}

# to make data management easier, move all operational data to one data directory
initData() {
  # Create OpenNMS data directories
  mkdir -p ${OPENNMS_DATA_DIR}/logs \
           ${OPENNMS_DATA_DIR}/rrd/response \
           ${OPENNMS_DATA_DIR}/rrd/snmp \
           ${OPENNMS_DATA_DIR}/reports

  # Remove symlinks and pristine empty data directories
  rm -rf $OPENNMS_HOME/logs
  rm -rf ${OPENNMS_HOME}/share/rrd
  rm -rf ${OPENNMS_HOME}/share/reports

  # Create links to directories which can be mounted into a data container
  ln -s ${OPENNMS_DATA_DIR}/logs ${OPENNMS_HOME}/logs
  ln -s ${OPENNMS_DATA_DIR}/rrd ${OPENNMS_HOME}/share/rrd
  ln -s ${OPENNMS_DATA_DIR}/reports ${OPENNMS_HOME}/share/reports
}

# Start opennms in foreground
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
      initConfig
      initdb
      initData
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

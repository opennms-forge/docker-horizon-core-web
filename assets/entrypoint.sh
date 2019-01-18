#!/bin/bash -e
# =====================================================================
# Build script running OpenNMS in Docker environment
#
# Source: https://github.com/opennms-forge/docker-horizon-core-web
# Web: https://www.opennms.org
#
# =====================================================================

# Cause false/positives
# shellcheck disable=SC2086

OPENNMS_HOME="/opt/opennms"
OPENNMS_OVERLAY="/opt/opennms-overlay"

# Error codes
E_ILLEGAL_ARGS=126
E_INIT_CONFIG=127
E_DEPRECATED_CONFIG=128

# Help function used in error messages and -h option
usage() {
  echo ""
  echo "Docker entry script for OpenNMS service container"
  echo ""
  echo "Overlay Config file:"
  echo "If you want to overwrite the default configuration with your custom config, you can use an overlay"
  echo "folder in which needs to be mounted to ${OPENNMS_OVERLAY}."
  echo "Every file in this folder is overwriting files in ${OPENNMS_HOME}."
  echo ""
  echo "-h: Show this help."
  echo "-i: Initialize or update the database and OpenNMS configuration files, runs install -dis."
  echo "    OpenNMS will be *NOT* started"
  echo "-s: Start OpenNMS in foreground with an existing configuration."
  echo "-t: options: Run the config-tester, default is -h to show usage."
  echo ""
}

install() {
  echo "Run OpenNMS install command to initialize or upgrade the database schema and configurations."
  ${JAVA_HOME}/bin/java -Dopennms.home="${OPENNMS_HOME}" -Dlog4j.configurationFile="${OPENNMS_HOME}"/etc/log4j2-tools.xml -cp "${OPENNMS_HOME}/lib/opennms_bootstrap.jar" org.opennms.bootstrap.InstallerBootstrap "${@}" || exit ${E_INIT_CONFIG}
}

configTester() {
  echo "Run config tester to validate existing configuration files."
  ${JAVA_HOME}/bin/java -Dopennms.manager.class="org.opennms.netmgt.config.tester.ConfigTester" -Dopennms.home="${OPENNMS_HOME}" -Dlog4j.configurationFile="$OPENNMS_HOME"/etc/log4j2-tools.xml -jar $OPENNMS_HOME/lib/opennms_bootstrap.jar "${@}" || exit ${E_INIT_CONFIG}
}

processConfdTemplates() {
  echo "Processing confd templates using the backend ${CONFD_BACKEND}."
  confd -onetime -backend "${CONFD_BACKEND}"
}

# Initialize configuration directory from etc-pristine when empty
initConfigWhenEmpty() {
  if [ ! -d ${OPENNMS_HOME} ]; then
    echo "OpenNMS home directory doesn't exist in ${OPENNMS_HOME}."
    exit ${E_ILLEGAL_ARGS}
  fi

  if [ ! "$(ls --ignore .git --ignore .gitignore --ignore ${OPENNMS_DATASOURCES_CFG} --ignore ${OPENNMS_KARAF_CFG} -A ${OPENNMS_HOME}/etc)"  ]; then
    echo "No existing configuration in ${OPENNMS_HOME}/etc found. Initialize from etc-pristine."
    cp -r ${OPENNMS_HOME}/share/etc-pristine/* ${OPENNMS_HOME}/etc/ || exit ${E_INIT_CONFIG}
  fi
}

applyOverlayConfig() {
  # Overlay relative to the root of the install dir
  if [ -d "${OPENNMS_OVERLAY}" ] && [ -n "$(ls -A ${OPENNMS_OVERLAY})" ]; then
    echo "Apply custom configuration from ${OPENNMS_OVERLAY}."
    cp -r ${OPENNMS_OVERLAY}/* ${OPENNMS_HOME}/ || exit ${E_INIT_CONFIG}
  else
    echo "No custom config found in ${OPENNMS_OVERLAY}. Use default configuration."
  fi
}

# Start opennms in foreground
start() {
  local OPENNMS_JAVA_OPTS="--add-modules=java.base,java.compiler,java.datatransfer,java.desktop,java.instrument,java.logging,java.management,java.management.rmi,java.naming,java.prefs,java.rmi,java.scripting,java.security.jgss,java.security.sasl,java.sql,java.sql.rowset,java.xml,jdk.attach,jdk.httpserver,jdk.jdi,jdk.sctp,jdk.security.auth,jdk.xml.dom \
  -Dorg.apache.jasper.compiler.disablejsr199=true
  -Dopennms.home=/opt/opennms
  -XX:+HeapDumpOnOutOfMemoryError
  -Dcom.sun.management.jmxremote.authenticate=true
  -Dcom.sun.management.jmxremote.login.config=opennms
  -Dcom.sun.management.jmxremote.access.file=/opt/opennms/etc/jmxremote.access
  -DisThreadContextMapInheritable=true
  -Dgroovy.use.classvalue=true
  -Djava.io.tmpdir=/opt/opennms/data/tmp
  -XX:+StartAttachListener"
  exec ${JAVA_HOME}/bin/java ${OPENNMS_JAVA_OPTS} ${JAVA_MEM_OPTS} ${JAVA_OPTS} -jar /opt/opennms/lib/opennms_bootstrap.jar start
}

testConfig() {
  shift
  if [ "${#}" == "0" ]; then
    configTester -h
  else
    configTester "${@}"
  fi
}

preflightchecks() {
  if [ -z "${JAVA_HOME}" ]; then
    echo "ERROR: Environment variable JAVA_HOME is not set and is required to run."
    exit ${E_ILLEGAL_ARGS}
  fi

  if [ -n "${OPENNMS_DBNAME}" ]; then
    echo "WARNING: The OPENNMS_DBNAME is deprecated use OPENNMS_DATABASE_NAME instead."
    export OPENNMS_DATABASE_NAME=${OPENNMS_DBNAME}
  fi

  if [ -n "${OPENNMS_DBUSER}" ]; then
    echo "WARNING: The OPENNMS_DBUSER is deprecated use OPENNMS_DATABASE_USER instead."
    export OPENNMS_DATABASE_USER=${OPENNMS_DBUSER}
  fi

  if [ -n "${OPENNMS_DBPASS}" ]; then
    echo "WARNING: The OPENNMS_DBPASS is deprecated use OPENNMS_DATABASE_PASSWORD instead."
    export OPENNMS_DATABASE_PASSWORD=${OPENNMS_DBPASS}
  fi

  if [ -d /opennms-data ]; then
    echo "ERROR: The mount point for /opennms-data directory is deprecated."
    echo "Use the following mount points instead:"
    echo "  old mount points      -> new mount points          "
    echo "  ---------------------------------------------------"
    echo "  /opennms-data/rrd     -> /opt/opennms/share/rrd    "
    echo "  /opennms-data/mibs    -> /opt/opennms/share/mibs   "
    echo "  /opennms-data/reports -> /opt/opennms/share/reports"
    exit ${E_DEPRECATED_CONFIG}
  fi

  if [ -d /opt/opennms-etc-overlay ]; then
    echo "ERROR: The mount point for /opt/opennms-etc-overlay directory is"
    echo "deprecated in favour of /opt/opennms-overlay."
    echo "Move your content from your etc overlay directory to"
    echo "/opt/opennms-overlay/etc or mount it like this:"
    echo "  old mount                -> new point               "
    echo "  ----------------------------------------------------"
    echo "  /opt/opennms-etc-overlay -> /opt/opennms-overlay/etc"
    exit ${E_DEPRECATED_CONFIG}
  fi

  if [ -d /opt/opennms-etc-overlay ]; then
    echo "ERROR: The mount point for /opt/opennms-etc-overlay directory is"
    echo "deprecated in favour of /opt/opennms-overlay."
    echo "Move your content from your etc overlay directory to"
    echo "/opt/opennms-overlay/etc or mount it like this:"
    echo ""
    echo "  old mount                -> new point               "
    echo "  ----------------------------------------------------"
    echo "  /opt/opennms-etc-overlay -> /opt/opennms-overlay/etc"
    exit ${E_DEPRECATED_CONFIG}
  fi

  if [ -d /opt/opennms-jetty-webinf-overlay ]; then
    echo "ERROR: The mount point for /opt/opennms-jetty-webinf-overlay"
    echo "directory is deprecated in favour of /opt/opennms-overlay. Move your"
    echo "content from your etc overlay directory to /opt/opennms-overlay/etc"
    echo "or mount it like this:"
    echo ""
    echo "  old mount                         -> new point                                         "
    echo "  ---------------------------------------------------------------------------------------"
    echo "  /opt/opennms-jetty-webinf-overlay -> /opt/opennms-overlay/jetty-webapps/opennms/WEB-INF"
    exit ${E_DEPRECATED_CONFIG}
  fi
}

# Evaluate arguments for build script.
if [[ "${#}" == 0 ]]; then
  usage
  exit ${E_ILLEGAL_ARGS}
fi

# Evaluate arguments for build script.
while getopts "hist" flag; do
  case ${flag} in
    h)
      usage
      exit
      ;;
    i)
      preflightchecks
      initConfigWhenEmpty
      processConfdTemplates
      applyOverlayConfig
      testConfig -t -a
      install -dis
      exit
      ;;
    s)
      if [ ! -f "${OPENNMS_HOME}"/etc/configured ]; then
        echo "ERROR: Can't start OpenNMS Horizon. Configuration files not initialized."
        echo "Run -i to initialize a configuration directory which creates"
        echo "${OPENNMS_HOME/etc/configured}."
        exit ${E_INIT_CONFIG}
      fi
      preflightchecks
      processConfdTemplates
      applyOverlayConfig
      testConfig -t -a
      start
      exit
      ;;
    t)
      preflightchecks
      processConfdTemplates
      applyOverlayConfig
      testConfig "${@}"
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
if [[ "${#}" -gt 0 ]]; then
  echo "Error: To many arguments: ${*}."
  usage
  exit ${E_ILLEGAL_ARGS}
fi

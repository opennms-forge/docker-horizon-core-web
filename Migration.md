# Migrate configuration and data to new container format

The container image running OpenNMS Horizon has been refactored to address the following needs:

* beeing able to run as non-root user in environments like [OpenShift]/[OKD]
* make deployment in container orchestration easier without the need for [Init Containers]
* remove self-written bash templates
* allow to create more complex software stacks by injecting configuration from a single configuration source
* have the possibility to use network based configuration data sources, e.g. etcd or zookeeper

We have introduced [confd] to remove some selfwritten bash templates which where required to spin-up an Horizon instance.
In our old image version it was only possible to configure the PostgreSQL database connection with environment variables and injecting properties files.
With [confd] is now possible to initialize also more complex software stacks by injecting configuration from a single source such as:

* OpenNMS Horizon <-> Minion communication with ActiveMQ, Apache Kafka or Amazon SQS
* Time series persistens with RRDtool, JRobin or Newts based on Cassandra
* Arbitray startup configurations defined in `${OPENNMS_HOME}/etc/opennms.properties.d`
* Setting up ElasticSearch for Flows, Alarms and Events

## Migration of configuration files injected as overlay config

Over time we introduced overlay directories as a convention which allows you to inject files with three bind-mount conventions:

* `OPENNMS_OVERLAY_ETC=/opt/opennms-etc-overlay`: Just for configuration files injected in `/opt/opennms/etc`
* `OPENNMS_OVERLAY_JETTY_WEBINF=/opt/opennms-jetty-webinf-overlay`: Mainly used to maintain authentication for Spring with LDAP or RADIUS which injects files into `jetty-webapps/opennms/WEB-INF`
* `OPENNMS_OVERLAY=/opt/opennms-overlay`: Overwrite any file in `/opt/opennms`

With introducing lately the `OPENNMS_OVERLAY` directory the more specific bind-mount conventsions became obsolete and we removed the specific ones for `/opt/opennms/etc` and `/opt/opennms/jetty-webapps/opennms/WEB-INF`.

If you want to inject configuration files, just use the `OPENNMS_OVERLAY` directory and create the corresponding directory structure to overwrite or inject any file you want.

```
mkdir -p my-overlay/jetty-webapps/opennms/WEB-INF \
         my-overlay/etc
```

Populate the directories with the files you want to inject and bind-mount it into the container with:

```yaml
services:
  horizon:
    image: opennms/horizon-core-web:24.1.0-1
    volumes:
      - ./my-overlay:/opt/opennms-overlay
```

## Migrate from environment config to confd

Here an example with a Horizon image in version < 25.
The connection to a Newts cluster and PostgreSQL database was configured as the following:

```yaml
services:
  horizon:
    image: opennms/horizon-core-web:24.1.0-1
    environment:
      - POSTGRES_HOST=database
      - POSTGRES_PORT=5432
      - POSTGRES_USER=postgres-user
      - POSTGRES_PASSWORD=postgres-pass
      - OPENNMS_DBNAME=opennms-db
      - OPENNMS_DBUSER=opennms-dbuser
      - OPENNMS_DBPASS=opennms-dbpass
      - OPENNMS_CASSANDRA_HOSTNAMES=newts1,newts2,newts3
      - OPENNMS_CASSANDRA_KEYSPACE=newts
      - OPENNMS_CASSANDRA_PORT=9042
      - OPENNMS_CASSANDRA_USERNAME=cassandra
      - OPENNMS_CASSANDRA_PASSWORD=cassandra
```

By default [confd.io] uses a file as configuration source in `YAML` format in `opennms.yaml` which is injected into the container with:

```yaml
services:
  horizon:
    image: opennms/horizon-core-web:24.1.0-1
    volumes:
      - ./opennms.yaml:/etc/confd/opennms.yaml
```

The content for the configuration shown in the example above needs to be converted into the following structure:

```yaml
# Basic YAML configuration for OpenNMS

# Ends up in the opennms-datasources.xml
database:
  name: opennms-db                    # OPENNMS_DBNAME=opennms-db
  user: opennms-dbuser                # OPENNMS_DBNAME=opennms-dbuser
  password: opennms-dbpass            # OPENNMS_DBNAME=opennms-dbpass

postgres:
  host: database                      # POSTGRES_HOST=database
  user: postgres                      # POSTGRES_USER=postgres-user
  password: postgres                  # POSTGRES_PASSWORD=postgres-pass

# Creates /opt/opennms/opennms.properties.d/timeseries.properties
timeseries:
  storeByForeignSource: true
  strategy: newts
  newts:
    config:
      hostname: newts1,newts2,newts3  # OPENNMS_CASSANDRA_HOSTNAMES=newts1,newts2,newts3
      port: 9042                      # OPENNMS_CASSANDRA_PORT=9042
      keyspace: newts                 # OPENNMS_CASSANDRA_KEYSPACE=newts
      username: cassandra             # OPENNMS_CASSANDRA_USERNAME=cassandra
      password: cassandra             # OPENNMS_CASSANDRA_PASSWORD=cassandra
```

It is important to define all properties from the `opennms.yaml` file.
If you inject property files you will get a mix of properties which are hard to debug.

## Migrate data directories

Todo

[OKD]: https://www.okd.io/
[OpenShift]: https://www.openshift.com/
[Init Containers]: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
[confd.io]: http://confd.io
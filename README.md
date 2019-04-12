# Docker Image for OpenNMS Horizon

## Version Tags

* `bleeding`, daily bleeding edge version of Horizon 24 using OpenJDK 11
* `23.0.4-1`, last stable release of Horizon using OpenJDK 8

## General Project Information

* CI/CD Status: [![CircleCI](https://circleci.com/gh/opennms-forge/docker-horizon-core-web.svg?style=svg)](https://circleci.com/gh/opennms-forge/docker-horizon-core-web)
* Container Image Info: [![Container Image Info](https://images.microbadger.com/badges/version/opennms/horizon-core-web.svg)](https://microbadger.com/images/opennms/horizon-core-web "Get your own version badge on microbadger.com") [![Container Image Info](https://images.microbadger.com/badges/image/opennms/horizon-core-web.svg)](https://microbadger.com/images/opennms/horizon-core-web "Get your own image badge on microbadger.com") [![Container Image License](https://images.microbadger.com/badges/license/opennms/horizon-core-web.svg)](https://microbadger.com/images/opennms/horizon-core-web "Get your own license badge on microbadger.com")
* CI/CD System: [CircleCI]
* Docker Container Image Repository: [DockerHub]
* Issue- and Bug-Tracking: [GitHub issue]
* Source code: [GitHub]
* Help others and ask questions: [Discourse]
* Talk with people in chat: [Web Chat]

## Horizon Docker files

This repository provides the Docker files to build OpenNMS Horizon OCI images with Docker.

To build the container images files the following is required:

* Docker in a current version
* git to checkout the repository

### Quickstart to build an OCI image with Docker

**Step 1:** Checkout the repository

```shell
git clone https://github.com/opennms-forge/docker-horizon-core-web.git
cd docker-horizon-core-web/
```

**Step 2:** Build the container image

```shell
./build_container_image.sh
```

As a result you will get a tag `horizon-core-web:latest` and an OCI file in `images/horizon-core-web.oci`

### Customize build from Bamboo RPMs

**Step 1:** Check out the repository to build a Docker image

```shell
git clone https://github.com/opennms-forge/docker-horizon-core-web.git
cd docker-horizon-core-web/
git checkout -b refactor/images origin/refactor/image
```

**Step 2:** Fetch the RPMS from Bamboo from a build URL

```shell
./fetch-rpms.sh https://bamboo.opennms.org/browse/OPENNMS-ONMS2852-7
```

**Step 3:** Build the container image from the local RPMS

```shell
./build_container_image.sh
```

The image is created with the tag `horizon-core-web:latest` and also persisted in the file system in `images/horizon-core-web.oci`

### Run OpenNMS Horizon with Docker Compose

A OpenNMS Horizon requirese minimal a running PostgreSQL service.
Applications like Grafana, Elasticsearch or Kafka are optional and depend on your setup and use cases, e.g. processing network flows or having a scalable time series storage with Newts based on Cassandra.

It is recommended to run a application stack with `docker-compose`.

#### Spin-up the minimal example stack

You will find ready-to-run stack in our example directory.
When you start the images for the first time the following tasks need to be accomplished:

* Initialize the PostgreSQL
* Initialize Horizon configuration files and setup the database schema

Here are the steps to initialize your environment to get you up and running.
Environment variables and volumes to persist data are pre-configured with example values.

**Step 1:** Change into the minimal directory

```
cd examples/minimal
```

**Step 2:** Initialize and start the PostgreSQL service in background

```
docker-compose up -d database
```

**Step 3:** Initialize OpenNMS Horizon configuration files and database schema

```
docker-compose run --rm horizon -i
```

**Step 4:** Start OpenNMS Horizon as a background service

```
docker-compose up -d horizon
```

You can startup the whole stack now with `docker-compose up -d` and tear it down with `docker-compose down`.

If you want to **delete all your data** to start fresh use `docker-compose down -v` which deletes also the used volumes.
The content in the bind-mount directory will not be deleted.

#### Minimal required environment variables

For a minimal stack with PostgreSQL you need the following environment variables to setup the connection to PostgreSQL and initializing the database:

```bash
# Environment variables for OpenNMS database connection
TZ=Europe/Berlin
OPENNMS_DATABASE_NAME=opennms
OPENNMS_DATABASE_USER=opennms
OPENNMS_DATABASE_PASSWORD=opennms
POSTGRES_HOST=database
POSTGRES_PORT=5432
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
```

Ensure the time zone `TZ` is set to the correct time zone you're in.
The examples use `.opennms.env` and `.postgres.env` files which contain these settings.
You can also set them in the docker-compose file if you want.

### Persistence your data

Running the container images are ephemeral and by default do not persist data.
The following directories are required to be persisted in a volume or as a bind-mount depending on your environment.
The minimal example uses volumes for data which is not required to be edited on the file system and bind-mounts for configurations.

* PostgreSQL database: `- data-pgsql:/var/lib/postgresql/data`
* OpenNMS Horizon JasperReports: `- data-opennms-reports:/opt/opennms/share/reports`
* OpenNMS Horizon RRD files: `- data-opennms-rrd:/opt/opennms/share/rrd`
* OpenNMS Horizon MIB files: `- data-opennms-mibs:/opt/opennms/share/mibs`
* OpenNMS configuration files: `- ./opennms-etc:/opt/opennms/etc`
      

For the reason some configuration files from OpenNMS Horizon need to be edited and migrated to newer versions from the file system it is recommended you persist the `opennms/etc` directory on your local files system so you can easily access it or set it under version control.

### Configuration through Environment Variables

OpenNMS Horizon has no built-in mechanism to get configured through Environment variables.
To enable this functionality the container image uses confd [confd] which uses by default `env` as configuration backend.

You can lookup all built-in configuration parameters in `confd/conf.d`. For the environment `env` you have to convert the key to uppercase letters and replace the `/` with an `_` like this:

```bash
# Key in confd
"/newts/config/keyspace"

# Environment variable get resolved to value "newts" in the template
export NEWTS_CONFIG_KEYSPACE=newts
```

You can extend the existing configuration as you need it by bind-mounting additional template and resource files in `/etc/confd`.

If you want to use a different _confd_ backend like you can set the `CONFD_BACKEND` variable which is when unset by default `env`.

### Injecting files with bind-mounts

OpenNMS Horizon can be extended with plugins and additional configuration files.
The image provides a bind-mount convention which allows you to inject files and directories into the `/opt/opennms` directory as the following:

```yaml
volumes:
  - ./overlay:/opt/opennms-overlay
```

When starting Horizon everything will be copied into `/opt/opennms`.

### Testing configuration files

If you want to just test all configuration files you can run

```
docker-compose run --rm horizon -t -a
```

if you want to test a specific configuration file

```
docker-compose run --rm horizon -t eventd-configuration.xml
```

You can get a list of all testable configuraiton files with

```
docker-compose run --rm horizon -t -l
```

### Setting Java variables

There are two conventions to adjust the Horizon Java options.

* Memory specific options can be set with `JAVA_MEM_OPTS` which default to `-Xmx1024m -XX:MaxMetaspaceSize=512m`
* Any other Java options can be set with `JAVA_OPTS`

```yaml
environment:
  - JAVA_OPTS=-XX:+UseParallelGC -XX:+PrintGCDetails -XX:+PrintFlagsFinal
  - JAVA_MEM_OPTS=-Xmx2g -XX:MaxMetaspaceSize=1g`
```

[GitHub]: https://github.com/opennms-forge/docker-horizon-core-web.git
[DockerHub]: https://hub.docker.com/r/opennms/horizon-core-web
[GitHub issue]: https://github.com/opennms-forge/docker-horizon-core-web
[CircleCI]: https://circleci.com/gh/opennms-forge/docker-horizon-core-web
[Discourse]: https://opennms.discourse.group
[Web Chat]: https://chats.opennms.org/opennms-discuss
[confd]: http://www.confd.io
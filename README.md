## Supported tags

* `latest`, latest develop release Horizon 20
* `rc-19.0.0`, release candidate for Horizon 19
* `18.0.3-1`, stable Horizon

### latest

* CentOS 7 with OpenJDK 8u121-jdk
* Official PostgreSQL 9.6.1
* Horizon 20 develop snapshot

### rc-19.0.0

* CentOS 7 with OpenJDK 8u121-jdk
* Official PostgreSQL 9.6.1
* Horizon 19.0.0 release candidate

### 18.0.3-1

* CentOS 7 with OpenJDK 8u121-jdk
* Official PostgreSQL 9.6.1
* Horizon 18.0.3-1

## Horizon Docker files

This repository provides snapshots for Horizon as docker images.
The image provides the Horizon core monitoring services and the web application.

It is recommended to use `docker-compose` to build a service stack using the official PostgreSQL images.
In case you have already a PostgreSQL database running, you can provide the database configuration in the `.opennms.env` and `.postgres.env` environment files.

The compose file uses two data container.
They are not running and just for persisting data purposes:

* opennms_data: RRD/JRobin files, logs and configuration files
* db_data: PostgreSQL database files

IMPORTANT:
As long as you don't delete the `db_data` and `opennms_data` container you keep your data.

For the reason it is required to manually edit OpenNMS configuration files, it is recommended to mount the `/opt/opennms/etc` into a local directory on your host system. In case the directory is empty it will be initialized with a plain configuration from `etc-pristine`.

Just add the volumes directive in `docker-compose.yml` in the opennms service section:
```
volumes:
    - /myhost/opennms/etc:/opt/opennms/etc
```

## Requirements

* docker 1.11+
* docker-compose 1.8.0+
* git
* optional on MacOSX, Docker environment, e.g. Kitematic, boot2docker or similar

## Usage

```
git clone https://github.com/opennms-forge/docker-horizon-core-web.git
cd docker-horizon-core-web
docker-compose up -d
```

The web application is exposed on TCP port 8980. You can login with default user *admin* with password *admin*.
Please change immediately the default password to a secure password.

## Support and Issues

Please open issues in the [GitHub issue](https://github.com/opennms-forge/docker-horizon-core-web) section.

## Author

ronny@opennms.org

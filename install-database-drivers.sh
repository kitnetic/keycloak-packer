#!/bin/bash
set -e

mkdir -p /opt/keycloak/modules/system/layers/keycloak/org/mariadb/main
wget https://dlm.mariadb.com/1484707/Connectors/java/connector-java-2.7.1/mariadb-java-client-2.7.1.jar -P /tmp
mv /tmp/mariadb-java-client-2.7.1.jar /opt/keycloak/modules/system/layers/keycloak/org/mariadb/main/.

mv module.xml /opt/keycloak/modules/system/layers/keycloak/org/mariadb/main/module.xml


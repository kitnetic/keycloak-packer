#!/bin/bash
set -e

sudo mkdir -p /opt/keycloak-10.0.2/modules/system/layers/keycloak/org/mariadb/main
sudo wget https://dlm.mariadb.com/1484707/Connectors/java/connector-java-2.7.1/mariadb-java-client-2.7.1.jar /tmp
sudo mv /tmp/mariadb-java-client-2.7.1.jar /opt/keycloak-10.0.2/modules/system/layers/keycloak/org/mariadb/main/.



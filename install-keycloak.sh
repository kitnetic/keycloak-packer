#!/bin/bash
set -e

# up to version 11 download is from jboss
sudo wget https://downloads.jboss.org/keycloak/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz -P /tmp
# from version 12 download is from github
# sudo wget https://github.com/keycloak/keycloak/releases/download/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz -P /tmp
sudo tar -xf /tmp/keycloak-${KEYCLOAK_VERSION}.tar.gz -C /opt
sudo mv /opt/keycloak-${KEYCLOAK_VERSION} /opt/keycloak
sudo chown -R ubuntu:ubuntu /opt/keycloak

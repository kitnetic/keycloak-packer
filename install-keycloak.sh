#!/bin/bash
set -e

sudo wget https://downloads.jboss.org/keycloak/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz -P /tmp
sudo tar -xf /tmp/keycloak-10.0.2.tar.gz -C /opt
sudo mv /opt/keycloak-10.0.2 /opt/keycloak
sudo chown -R ubuntu:ubuntu /opt/keycloak

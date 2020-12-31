#!/bin/bash
set -e

mv keycloak-setup-ha.cli /opt/keycloak/keycloak-setup-ha.cli

/opt/keycloak/bin/jboss-cli.sh --file=/opt/keycloak/keycloak-setup-ha.cli


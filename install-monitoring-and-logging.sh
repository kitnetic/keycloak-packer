#!/bin/bash

set -e

if sudo test -f /sys/hypervisor/uuid -a `head -c 3 /sys/hypervisor/uuid` = "ec2"; then
  # install AWS-specific stuff only if running on AWS
  echo "Found old EC2 - Installing Cloudwatch Agent"
  curl -L -O https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
  sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
  rm ./amazon-cloudwatch-agent.deb
elif sudo test -f /sys/devices/virtual/dmi/id/product_uuid -a `head -c 3 /sys/devices/virtual/dmi/id/product_uuid | tr [:lower:] [:upper:]` = "EC2"; then
  # install AWS-specific stuff only if running on AWS
  echo "Found new EC2 - Installing Cloudwatch Agent"
  curl -L -O https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
  sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
  rm ./amazon-cloudwatch-agent.deb
elif (sudo dmidecode -s system-product-name | grep -q "Google Compute Engine"); then
  echo "Found GCP - Installing google fluentd agent"
  export DO_NOT_INSTALL_CATCH_ALL_CONFIG=true
  curl -sSO https://dl.google.com/cloudagents/install-logging-agent.sh
  chmod a+x ./install-logging-agent.sh
  sudo -E ./install-logging-agent.sh
  rm ./install-logging-agent.sh
else
  echo "No Cloud Provider Found - Not Installing Cloud Logging"
fi

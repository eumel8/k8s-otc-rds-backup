#!/bin/bash

# test if cloud env is set
if [[ -z  ${OS_PROJECT_NAME} ]]; then
    echo "OS_PROJECT_NAME not set"
    exit 1
fi
if [[ -z  ${OS_REGION_NAME} ]]; then
    echo "OS_REGION_NAME not set"
    exit 1
fi
if [[ -z  ${OS_AUTH_URL} ]]; then
    echo "OS_AUTH_URL not set"
    exit 1
fi
if [[ -z  ${OS_IDENTITY_API_VERSION} ]]; then
    echo "OS_IDENTITY_API_VERSION not set"
    exit 1
fi
if [[ -z  ${OS_USER_DOMAIN_NAME} ]]; then
    echo "OS_USER_DOMAIN_NAME not set"
    exit 1
fi
if [[ -z  ${OS_USERNAME} ]]; then
    echo "OS_USERNAME not set"
    exit 1
fi
if [[ -z  ${OS_PASSWORD} ]]; then
    echo "OS_PASSWORD not set"
    exit 1
fi
if [[ -z  ${RDS_NAME} ]]; then
    echo "RDS_NAME not set"
    exit 1
fi

if ! out=`ansible-playbook -i inventory k8s.yml`; then echo $out; fi

if [ -f backups.json ]; then
  cat backups.json
fi

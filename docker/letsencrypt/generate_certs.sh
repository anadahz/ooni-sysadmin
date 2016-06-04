#!/bin/bash
set -e

source config

docker run -it --rm -p 80:80 --name certbot \
        -v "/etc/letsencrypt:/etc/letsencrypt" \
        -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
        -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
        quay.io/letsencrypt/letsencrypt:latest \
        certonly --standalone --standalone-supported-challenges http-01 \
        --noninteractive --text --agree-tos \
        --email ${ADMIN_EMAIL} \
        --domains ${DOMAIN_GEN} \
        --test-cert

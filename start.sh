#!/usr/bin/env bash

# Check if SSL certificate files are present
if ! test -f "./.conf/ssl/ctfd.crt" && ! test -f "./.conf/ssl/ctfd.key"; then
    echo 'Certificate files not found!'

    read -p "Do you want to generated self-signed certificate (y/n): " -r ANSWER

    if [[ ${ANSWER} =~ ^[Yy]$ ]]; then
        echo "Generating self-signed certificate files..."

        openssl req -new \
            -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 365 \
            -nodes \
            -subj "/CN=CRB-CTF/O=Cerberos/C=NL" \
            -out ./.conf/ssl/ctfd.crt \
            -keyout ./.conf/ssl/ctfd.key
    else
        echo "Please add your certificate files to '.conf/ssl' with names 'ctfd.crt' and 'ctfd.key' before continuing!"

        exit 1
    fi
fi

echo "Starting containers..."

docker-compose -f docker-compose-crb.yml up -d

#!/usr/bin/env bash

echo "Generating CRT and KEY files"

openssl req -new \
    -newkey rsa:4096 \
    -x509 \
    -sha256 \
    -days 365 \
    -nodes \
    -subj "/CN=CRB-CTF/O=Cerberos/C=NL" \
    -out ./.conf/ssl/ctfd.crt \
    -keyout ./.conf/ssl/ctfd.key

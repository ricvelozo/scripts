#!/bin/sh
# Installs or updates the Insomnia REST Client (.deb)
cd /tmp && wget https://builds.insomnia.rest/downloads/ubuntu/latest -O \
insomnia-rest-client.deb && sudo dpkg -i ./insomnia-rest-client.deb

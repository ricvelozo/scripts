#!/bin/sh

# Generate a random string
cat /dev/urandom | tr -cd '[:alnum:]' | head -c 16

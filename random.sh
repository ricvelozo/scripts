#!/bin/sh

# Generate a random string
echo $(cat /dev/urandom | tr -cd '[:alnum:]' | head -c 16)

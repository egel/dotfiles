#!/bin/sh
while true; do
  # Send 'Hello World' to anybody who connects on port 5000
  echo "Hello World" | nc -l 5000
done

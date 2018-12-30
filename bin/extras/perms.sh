#!/bin/bash
ARG=$1
while [[ "$ARG" != "." && "$ARG" != "/" ]]
do
  ls -ld -- "$ARG"
  ARG=$(dirname -- "$ARG")
done

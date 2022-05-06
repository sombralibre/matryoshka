#!/bin/bash

# Soon in the future I will write a configurable tool for placeholders replacement.
# this code sucks!!

. pkgsource.data

eval "cat <<EOF > Dockerfile
$(<templates/Dockerfile.template)
EOF"
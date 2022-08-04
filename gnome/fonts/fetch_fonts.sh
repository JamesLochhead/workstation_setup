#!/usr/bin/env bash

set -Eexuo pipefail

aws s3 cp "s3://technowomble-fonts/Euclid font/" . --recursive

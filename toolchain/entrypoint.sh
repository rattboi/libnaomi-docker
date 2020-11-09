#!/usr/bin/env bash
# Read in the file of environment settings
source /opt/toolchains/naomi/env.sh
# Then run the CMD
exec "$@"

#!/bin/bash
set -e

make rack-sdk-all 

exec "$@"

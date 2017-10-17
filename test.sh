#!/bin/bash
set -e
#
# validate all YAML files in this repo against JSON-schema Draft04
#
echo "Checking individual files for JSON-schema compliance" 
for i in `find . -name *.yml  -type f ! -path "./venv/*"`; do yamlvalidate -y $i; if [ $? -ne 0 ]; then exit 1; fi; done
for i in `find . -name *.yaml  -type f ! -path "./venv/*"`; do yamlvalidate -y $i; if [ $? -ne 0 ]; then exit 1; fi; done
for i in `find . -name *.json  -type f ! -path "./venv/*"`; do yamlvalidate -y $i; if [ $? -ne 0 ]; then exit 1; fi; done
echo ""

#
# execute all test that are specified in any 'test_*.sh' files, e.g., validate examples against TANGO schemas.
#
echo "Executing defined test-scripts to check compliance with VNFD/NSD-schemas"
for i in `find . -name test_*.sh -type f`; do $i; if [ $? -ne 0 ]; then exit 1; fi; done

#!/bin/bash

## Copyright (c) 2015 SONATA-NFV, 2017 5GTANGO
## ALL RIGHTS RESERVED.
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
## Neither the name of the SONATA-NFV, 5GTANGO
## nor the names of its contributors may be used to endorse or promote
## products derived from this software without specific prior written
## permission.
##
## This work has been performed in the framework of the SONATA project,
## funded by the European Commission under Grant number 671517 through
## the Horizon 2020 and 5G-PPP programmes. The authors would like to
## acknowledge the contributions of their colleagues of the SONATA
## partner consortium (www.sonata-nfv.eu).
##
## This work has been performed in the framework of the 5GTANGO project,
## funded by the European Commission under Grant number 761493 through
## the Horizon 2020 and 5G-PPP programmes. The authors would like to
## acknowledge the contributions of their colleagues of the 5GTANGO
## partner consortium (www.5gtango.eu).

set -e
#
# validate all YAML files in this repo against JSON-schema Draft04
#
echo "Checking individual files for JSON-schema compliance" 
for i in `find . -name *.yml  -type f ! -path "./venv/*"`; do yamlvalidate -y $i; if [ $? -ne 0 ]; then exit 1; fi; done
for i in `find . -name *.yaml  -type f ! -path "./venv/*"`; do yamlvalidate -y $i; if [ $? -ne 0 ]; then exit 1; fi; done
for i in `find . -name *.json  -type f ! -path "./venv/*"`; do yamlvalidate -y $i; if [ $? -ne 0 ]; then exit 1; fi; done
for i in `find . -name *.ref  -type f ! -path "./venv/*"`; do yamlvalidate -y $i; if [ $? -ne 0 ]; then exit 1; fi; done
echo ""

#
# execute all test that are specified in any 'test_*.sh' files, e.g., validate examples against TANGO schemas.
#
echo "Executing defined test-scripts to check compliance with VNFD/NSD-schemas"
for i in `find . -name test_*.sh -type f`; do echo $i; $i; if [ $? -ne 0 ]; then exit 1; fi; done

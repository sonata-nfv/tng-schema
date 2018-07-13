#!/bin/bash
set -e
##
## Test package examples against schemas,
## e.g., NAPD, NSDs, VNFDs, REFs, ...

CMD=yamlvalidate
BASE_DIR=`dirname $0`
# schema paths
NAPD_SCHEMA=${BASE_DIR}/../napd-schema.yml
REF_SCHEMA=${BASE_DIR}/../ref-schema.yml
NSD_SCHEMA=${BASE_DIR}/../../service-descriptor/nsd-schema.yml
VNFD_SCHEMA=${BASE_DIR}/../../function-descriptor/vnfd-schema.yml

#
# Execute the tests.
#
# TODO add test to test test descriptor :-)
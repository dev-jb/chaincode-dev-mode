#!/bin/bash
# Copyright London Stock Exchange Group All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
export CHAINCODE_PATH=$1
export ORDERER_IMAGE_TAG=2.2.3
export PEER_IMAGE_TAG=2.2.3
export CLI_IMAGE_TAG=2.2.3
export COUCHDB_IMAGE_TAG=3.1.1

set -e

docker-compose -f docker-compose-simple.yaml -f docker-compose-couch.yaml down --volumes

sleep 5
exit 0

#!/bin/bash
# Copyright London Stock Exchange Group All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
export CHAINCODE_PATH=../blockchain-voting-app/
set -e

docker-compose -f docker-compose-simple.yaml -f docker-compose-couch.yaml down --volumes

sleep 5
exit 0

#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
#Color code for shell script
Red='\033[0;31m'
Green='\033[0;32m'
Color_Off='\033[0m'

# Print the usage message
function printHelp() {
    echo -e "${Green}"
    echo "Usage: "
    echo "  runChaincode.sh <chaincodeName>"
    echo -e "${Red}"
    echo "  Note: Please make sure the chaincode name matches the chaincode directory name"
    echo -e "${Color_Off}"
}

function runChaincode(){
    echo -e "${Green}"
    echo -e "----------------------"
    echo -e "Initializing Go"
    echo -e "----------------------"
    echo -e "${Color_Off}"
    docker exec -it chaincode go mod init
    echo -e "${Green}"
    echo -e "----------------------"
    echo -e "Installing Go Dependencies"
    echo -e "----------------------"
    echo -e "${Color_Off}"
    docker exec -it chaincode go mod vendor
    echo -e "${Green}"
    echo -e "----------------------"
    echo -e "Building Chaincode"
    echo -e "----------------------"
    echo -e "${Color_Off}"
    docker exec -it chaincode bash -c "cd $CHAINCODE_NAME/ && go build -o $CHAINCODE_NAME"

    echo -e "${Green}"
    echo -e "----------------------"
    echo -e "Starting Chaincode"
    echo -e "----------------------"
    echo -e "${Color_Off}"
    docker exec -it chaincode bash -c "cd $CHAINCODE_NAME/ && CORE_CHAINCODE_ID_NAME=$CHAINCODE_NAME:0 CORE_PEER_TLS_ENABLED=false ./$CHAINCODE_NAME -peer.address peer:7052"
}

export CHAINCODE_NAME=$1
if [ "$CHAINCODE_NAME" != "" ]; then
    runChaincode
else
    echo "Chaincode name not found"
    printHelp
    exit 1
fi
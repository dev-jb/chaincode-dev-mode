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
    echo "  installChaincode.sh <chaincodeName>"
    echo -e "${Red}"
    echo "  Note: Please make sure the chaincode name matches the chaincode directory name"
    echo -e "${Color_Off}"
}

function installChaincode(){
    echo -e "${Green}"
    echo -e "----------------------"
    echo -e "Installing Chaincode"
    echo -e "----------------------"
    echo -e "${Color_Off}"
    docker exec -it cli peer chaincode install -p chaincodedev/chaincode/$CHAINCODE_NAME -n $CHAINCODE_NAME -v 0
    echo -e "${Green}"
    echo -e "----------------------"
    echo -e "Instantiating Chaincode"
    echo -e "----------------------"
    echo -e "${Color_Off}"
    docker exec -it cli peer chaincode instantiate -n $CHAINCODE_NAME -v 0 -c '{"Args":[]}' -C myc
    echo -e "${Green}"
    echo -e "----------------------"
    echo -e "Chaincode Install completed"
    echo -e "----------------------"
    echo -e "${Color_Off}"
}

export CHAINCODE_NAME=$1
if [ "$CHAINCODE_NAME" != "" ]; then
    installChaincode
else
    echo "Chaincode name not found"
    printHelp
    exit 1
fi

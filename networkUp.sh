#!/bin/bash
# SPDX-License-Identifier: Apache-2.0
#Color code for shell script
Red='\033[0;31m'
Green='\033[0;32m'
Color_Off='\033[0m'

export ORDERER_IMAGE_TAG=2.2.3
export PEER_IMAGE_TAG=2.2.3
export CLI_IMAGE_TAG=2.2.3
export COUCHDB_IMAGE_TAG=3.1.1

# Print the usage message
function printHelp() {
    echo -e "${Green}"  
    echo "Usage: "
    echo "  networkUp.sh <chaincodePath>"
    echo -e "${Red}"
    echo "  Note: Home Directory is current directory"
    echo -e "${Green}"

    echo "Bringing the newtork Down:"
    echo "  Run ./networkDown.sh"
    echo -e "${Color_Off}"

}

function networkUp(){
    # This script expedites the chaincode development process by automating the
    # requisite channel create/join commands

    # We use a pre-generated orderer.block and channel transaction artifact (myc.tx),
    # both of which are created using the configtxgen tool
    docker-compose -f docker-compose-simple.yaml -f docker-compose-couch.yaml up -d

    sleep 10

    # first we create the channel against the specified configuration in myc.tx
    # this call returns a channel configuration block - myc.block - to the CLI container
    docker exec -it cli peer channel create -c myc -f myc.tx -o orderer:7050

    sleep 2
    # now we will join the channel and start the chain with myc.block serving as the
    # channel's first block (i.e. the genesis block)
    docker exec -it cli peer channel join -b myc.block

    # Now the user can proceed to build and start chaincode in one terminal
    # And leverage the CLI container to issue install instantiate invoke query commands in another

    #we should have bailed if above commands failed.
    #we are here, so they worked
    sleep 2
    exit 0
}

export CHAINCODE_PATH=$1
if [ "$CHAINCODE_PATH" != "" ]; then
    networkUp
else
    echo "Chaincode path not found"
    printHelp
    exit 1
fi
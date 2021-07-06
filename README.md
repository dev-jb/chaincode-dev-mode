# Installing Dependencies

Intalling dependencies will do following operations:

1. Download and installation of Go dependencies. (Go will be installed on **/opt/go**)
2. Transfer fabric necessary files like fabric-ca-client fabric-ca-server from **./bin** folder to **/opt/go/bin**

> **_NOTE:_** Run the dependency run only if you haven't downloaded the go library and assign the GOPATH

Run the command for installing all the dependencies:

`./installDependencies.sh`

After the completion, add the GO ENV path on ~/.profile

Open editor using nano
`sudo nano ~/.profile`

Copy and paste the following lines at EOF

> export GOPATH=/opt/gopath
> export PATH=$PATH:/opt/go/bin:$GOPATH/bin

Save the file using Ctrl+O

Then run the following command
`source ~/.profile`

# Bring Up the network

Run following command to launch dev environment

> Replace the **<chaincode_path>** with the path where your chaincode folder resides
> For Example: If your chaincode is on the path ../test/sample/sample.go then run the below command as: **./networkUp.sh ../test/sample**

`./networkUp.sh <chaincode_path>`

# Run Chaincode Container

We run the chaincode container using the following command

> This will run the chaincode container. Leave the terminal at it is and on next terminal run the Chaincode Install script
> Replace the **<chaincode_name>** with the name of your chaincode. Make sure the chaincode name matches the chaincode folder name

`./runChaincode.sh <chaincode_name>`

# Install Chaincode

Installing chaincode on the peer

> This will run the chaincode container. Leave the terminal at it is and on next terminal run the Chaincode Install script
> Replace the **<chaincode_name>** with the name of your chaincode. Make sure the chaincode name matches the chaincode folder name

`./installChaincode.sh <chaincode_name>`

# Invoke Chaincode

For invoking chaincode we need to run the command manually

> **_NOTE:_** Replace chaincodeName with your chaincode name, functionName with the required value. Make sure the arguments are string value separated with comma.

`peer chaincode invoke -n <chaincodeName> -c '{"Args":["<functionName>","<arg1>","<arg2>"...]}' -C myc`

# Query Chaincode

For quering chaincode we need to run the command manually

> **_NOTE:_** Replace chaincodeName with your chaincode name, functionName with the required value. Make sure the arguments are string value separated with comma.

`peer chaincode query -n <chaincodeName> -c '{"Args":["<functionName>","<arg1>","<arg2>"...]}' -C myc`

**We are Good to Go Cheers!!**

#!/bin/bash

#Color code for shell script
Red='\033[0;31m'
Green='\033[0;32m'
Color_Off='\033[0m'

export ROOT_DIR=$PWD/..

# Install go ubuntu
installGo(){

    echo -e "${Green}"
    echo "------------------------"
    echo "------------------------"
    echo "Downloading Go Packages"
    echo "------------------------"
    echo "------------------------"
    echo -e "${Color_Off}"

    curl -O https://dl.google.com/go/go1.15.7.linux-amd64.tar.gz

    chmod +x go1.15.7.linux-amd64.tar.gz

    sha256sum go1.15.7.linux-amd64.tar.gz

    echo -e "${Green}"
    echo "------------------"
    echo "------------------"
    echo "Unzip Go Packages"
    echo "------------------"
    echo "------------------"
    echo -e "${Color_Off}"
    tar xvf go1.15.7.linux-amd64.tar.gz

    sudo chown -R root:root ./go

    sudo mv go /opt/go

    sudo rm -r go1.15.7.linux-amd64.tar.gz

    echo -e "${Green}"
    echo "-------------------------"
    echo "-------------------------"
    echo "Successfully Installed Go"
    echo "-------------------------"
    echo "-------------------------"
    echo -e "${Color_Off}"

    # echo "export GOPATH=/opt/gopath" >> ~/.profile

    # source ~/.profile

}

moveFabricFiles(){
    sudo cp -r ../bin/* /opt/go/bin/
}

installGo

moveFabricFiles
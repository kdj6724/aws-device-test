#!/bin/sh
# stop script on error
set -e

if [ ! -d ./libs ]; then
  mkdir libs
fi
INSTALL_PATH=${PWD}/libs

# install AWS Device SDK for Python if not already installed
if [ ! -d ./aws-iot-device-sdk-cpp ]; then
  printf "\nInstalling AWS SDK...\n"
  git clone https://github.com/aws/aws-iot-device-sdk-cpp.git
  mkdir aws-iot-device-sdk-cpp/build
  pushd aws-iot-device-sdk-cpp/build
  cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH} ../
  make
  make install
  popd
fi

# Check to see if root CA file exists, download if not
if [ ! -f ./aws-iot-device-sdk-cpp/certs/root-CA.crt ]; then
  printf "\nDownloading AWS IoT Root CA certificate from AWS...\n"
#  curl https://www.amazontrust.com/repository/AmazonRootCA1.pem > ./aws-iot-device-sdk-cpp/certs/root-CA.crt
fi

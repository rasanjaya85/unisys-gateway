#!/usr/bin/env bash

BUILD_NUMBER=$1
TOOLKIT_DIRECTORY='/home/vagrant/toolkit'
JENKINS_DIRECTORY='/var/lib/jenkins/workspace/unisys-gateway-pipeline'

printf ${BUILD_NUMBER}
sed  -i "s/TARGET_VERSION/${BUILD_NUMBER}/g" petstore/conf/deployment-config.toml
#exit
cp -r ${JENKINS_DIRECTORY}/petstore ${TOOLKIT_DIRECTORY}/bin
cd ${TOOLKIT_DIRECTORY}/bin/

printf "Build the Product Image "
./micro-gw build petstore --deployment-config deployment.toml

if [ $? -eq 0 ]; then
   printf "Starting the rolling-update"
   kubectl rollout history deployment  gateway-deployment
   kubectl set image deployment gateway-deployment gateway=registry.wso2.org/petstore:1.0.${BUILD_NUMBER}
else
   exit
fi

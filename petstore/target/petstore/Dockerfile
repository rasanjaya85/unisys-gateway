# Auto Generated Dockerfile

FROM ballerina/ballerina-runtime:0.990.5
LABEL maintainer="dev@ballerina.io"

COPY petstore.balx /home/ballerina 

COPY micro-gw.conf /home/ballerina/conf/micro-gw.conf

CMD ballerina run  --config /home/ballerina/conf/micro-gw.conf petstore.balx

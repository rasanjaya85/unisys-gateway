import ballerina/log;
import ballerina/http;
import ballerina/config;
import ballerina/time;

import wso2/gateway;

    http:Client Swagger_Petstore_New__1_0_0_prod = new (
gateway:retrieveConfig("api_1bff9f11aa45fd8d340e14633413481a2a963a5ff81b21fcebd62cea8e7bb012_prod_endpoint_0","http://www.mocky.io/v2/5d28af622c000066003edbcb"),
config = { 
    httpVersion: gateway:getHttpVersion(),
secureSocket:{
    trustStore: {
           path: gateway:getConfigValue(gateway:LISTENER_CONF_INSTANCE_ID, gateway:TRUST_STORE_PATH,
               "${ballerina.home}/bre/security/ballerinaTruststore.p12"),
           password: gateway:getConfigValue(gateway:LISTENER_CONF_INSTANCE_ID, gateway:TRUST_STORE_PASSWORD, "ballerina")
     },
     verifyHostname:gateway:getConfigBooleanValue(gateway:HTTP_CLIENTS_INSTANCE_ID, gateway:ENABLE_HOSTNAME_VERIFICATION, true)
}
});








    
    
    
    
    
    

    
    
    
    
    
    











@http:ServiceConfig {
    basePath: "/petstore/v1",
    authConfig:{
    
        authProviders:["jwt","oauth2"]
    
    }
}

@gateway:API {
    publisher:"",
    name:"Swagger Petstore New",
    apiVersion: "1.0.0" 
}
service Swagger_Petstore_New__1_0_0 on apiListener,
apiSecureListener {


    @http:ResourceConfig {
        methods:["GET"],
        path:"/pet/findByStatus",
        authConfig:{
    
        authProviders:["jwt","oauth2"]
      

        }
    }
    @gateway:RateLimit{policy : ""}
    resource function get_e02d5567_4b97_444f_9632_3cdb99948f9b (http:Caller outboundEp, http:Request req) {
        handleExpectHeaderForSwagger_Petstore_New__1_0_0(outboundEp, req);
    
    
    string urlPostfix = untaint req.rawPath.replace("/petstore/v1","");
    if(!urlPostfix.hasPrefix("/")) {
        urlPostfix = "/" + urlPostfix;
    }
        http:Response|error clientResponse;
        http:Response r = new;
        clientResponse = r;
        string destination_attribute;
        runtime:getInvocationContext().attributes["timeStampRequestOut"] = time:currentTime().time;
        boolean reinitRequired = false;
        string failedEtcdKey = "";
        string failedEtcdKeyConfigValue = "";
        boolean|error hasUrlChanged;
        http:ClientEndpointConfig newConfig;
        boolean reinitFailed = false;
        boolean isProdEtcdEnabled = false;
        boolean isSandEtcdEnabled = false;
        map<string> endpointEtcdConfigValues = {};
        
            
            
                if("PRODUCTION" == <string>runtime:getInvocationContext().attributes["KEY_TYPE"]) {
                
                    
    clientResponse = Swagger_Petstore_New__1_0_0_prod->forward(urlPostfix, req);

runtime:getInvocationContext().attributes["destination"] = "http://www.mocky.io/v2/5d28af622c000066003edbcb";
                
                    } else {
                
                    http:Response res = new;
res.statusCode = 403;
json payload = {
    ERROR_CODE: "900901",
    ERROR_MESSAGE: "Sandbox key offered to the API with no sandbox endpoint"
};
runtime:getInvocationContext().attributes["error_code"] = "900901";
res.setPayload(payload);
clientResponse = res;
                
                }
            
        
        
        runtime:getInvocationContext().attributes["timeStampResponseIn"] = time:currentTime().time;


        if(clientResponse is http:Response) {
            
            
            var outboundResult = outboundEp->respond(clientResponse);
            if (outboundResult is error) {
                log:printError("Error when sending response", err = outboundResult);
            }
        } else {
            http:Response res = new;
            res.statusCode = 500;
            string errorMessage = clientResponse.reason();
            int errorCode = 101503;
            string errorDescription = "Error connecting to the back end";

            if(errorMessage.contains("connection timed out") || errorMessage.contains("Idle timeout triggered")) {
                errorCode = 101504;
                errorDescription = "Connection timed out";
            }
            if(errorMessage.contains("Malformed URL")) {
                errorCode = 101505;
                errorDescription = "Malformed URL";
            }
            // Todo: error is not type any -> runtime:getInvocationContext().attributes["error_response"] =  clientResponse;
            runtime:getInvocationContext().attributes["error_response_code"] = errorCode;
            json payload = {fault : {
                code : errorCode,
                message : "Runtime Error",
                description : errorDescription
            }};
            res.setPayload(payload);
            log:printError("Error in client response", err = clientResponse);
            var outboundResult = outboundEp->respond(res);
            if (outboundResult is error) {
                log:printError("Error when sending response", err = outboundResult);
            }
        }
    }


    @http:ResourceConfig {
        methods:["GET"],
        path:"/pet/{petId}",
        authConfig:{
    
        authProviders:["jwt","oauth2"]
      

        }
    }
    @gateway:RateLimit{policy : ""}
    resource function get_984f91c2_bd72_4d80_a5a9_cdd63d922264 (http:Caller outboundEp, http:Request req) {
        handleExpectHeaderForSwagger_Petstore_New__1_0_0(outboundEp, req);
    
    
    string urlPostfix = untaint req.rawPath.replace("/petstore/v1","");
    if(!urlPostfix.hasPrefix("/")) {
        urlPostfix = "/" + urlPostfix;
    }
        http:Response|error clientResponse;
        http:Response r = new;
        clientResponse = r;
        string destination_attribute;
        runtime:getInvocationContext().attributes["timeStampRequestOut"] = time:currentTime().time;
        boolean reinitRequired = false;
        string failedEtcdKey = "";
        string failedEtcdKeyConfigValue = "";
        boolean|error hasUrlChanged;
        http:ClientEndpointConfig newConfig;
        boolean reinitFailed = false;
        boolean isProdEtcdEnabled = false;
        boolean isSandEtcdEnabled = false;
        map<string> endpointEtcdConfigValues = {};
        
            
            
                if("PRODUCTION" == <string>runtime:getInvocationContext().attributes["KEY_TYPE"]) {
                
                    
    clientResponse = Swagger_Petstore_New__1_0_0_prod->forward(urlPostfix, req);

runtime:getInvocationContext().attributes["destination"] = "http://www.mocky.io/v2/5d28af622c000066003edbcb";
                
                    } else {
                
                    http:Response res = new;
res.statusCode = 403;
json payload = {
    ERROR_CODE: "900901",
    ERROR_MESSAGE: "Sandbox key offered to the API with no sandbox endpoint"
};
runtime:getInvocationContext().attributes["error_code"] = "900901";
res.setPayload(payload);
clientResponse = res;
                
                }
            
        
        
        runtime:getInvocationContext().attributes["timeStampResponseIn"] = time:currentTime().time;


        if(clientResponse is http:Response) {
            
            
            var outboundResult = outboundEp->respond(clientResponse);
            if (outboundResult is error) {
                log:printError("Error when sending response", err = outboundResult);
            }
        } else {
            http:Response res = new;
            res.statusCode = 500;
            string errorMessage = clientResponse.reason();
            int errorCode = 101503;
            string errorDescription = "Error connecting to the back end";

            if(errorMessage.contains("connection timed out") || errorMessage.contains("Idle timeout triggered")) {
                errorCode = 101504;
                errorDescription = "Connection timed out";
            }
            if(errorMessage.contains("Malformed URL")) {
                errorCode = 101505;
                errorDescription = "Malformed URL";
            }
            // Todo: error is not type any -> runtime:getInvocationContext().attributes["error_response"] =  clientResponse;
            runtime:getInvocationContext().attributes["error_response_code"] = errorCode;
            json payload = {fault : {
                code : errorCode,
                message : "Runtime Error",
                description : errorDescription
            }};
            res.setPayload(payload);
            log:printError("Error in client response", err = clientResponse);
            var outboundResult = outboundEp->respond(res);
            if (outboundResult is error) {
                log:printError("Error when sending response", err = outboundResult);
            }
        }
    }

}

    function handleExpectHeaderForSwagger_Petstore_New__1_0_0 (http:Caller outboundEp, http:Request req ) {
        if (req.expects100Continue()) {
            req.removeHeader("Expect");
            var result = outboundEp->continue();
            if (result is error) {
            log:printError("Error while sending 100 continue response", err = result);
            }
        }
    }

function getUrlOfEtcdKeyForReInitSwagger_Petstore_New__1_0_0(string defaultUrlRef,string etcdRef, string defaultUrl, string etcdKey) returns string {
    string retrievedEtcdKey = <string> gateway:retrieveConfig(etcdRef,etcdKey);
    gateway:urlChanged[<string> retrievedEtcdKey] = false;
    string url = <string> gateway:etcdUrls[retrievedEtcdKey];
    if (url == "") {
        return <string> gateway:retrieveConfig(defaultUrlRef, defaultUrl);
    } else {
        return url;
    }
}
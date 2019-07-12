
public function main() {
    
    string[] Swagger_Petstore_New__1_0_0_service = [ "get_e02d5567_4b97_444f_9632_3cdb99948f9b"
                                , "get_984f91c2_bd72_4d80_a5a9_cdd63d922264"
                                ];
    gateway:populateAnnotationMaps("Swagger_Petstore_New__1_0_0", Swagger_Petstore_New__1_0_0, Swagger_Petstore_New__1_0_0_service);
    

    initThrottlePolicies();

    map<string> receivedRevokedTokenMap = gateway:getRevokedTokenMap();
    boolean jmsListenerStarted = gateway:initiateTokenRevocationJmsListener();

    boolean useDefault = gateway:getConfigBooleanValue(gateway:PERSISTENT_MESSAGE_INSTANCE_ID,
    gateway:PERSISTENT_USE_DEFAULT, false);

    if (useDefault){
        future<()> initETCDRetriveal = start gateway:etcdRevokedTokenRetrieverTask();
    } else {
        initiatePersistentRevokedTokenRetrieval(receivedRevokedTokenMap);
    }
    startupExtension();
}

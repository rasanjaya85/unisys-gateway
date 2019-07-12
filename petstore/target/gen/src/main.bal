
public function main() {
    
    string[] Swagger_Petstore_New__1_0_0_service = [ "get_179ecc8c_6dc3_46a8_b2af_57a3c595e810"
                                , "get_2b886230_3e2a_4e1a_9d40_c67a6cd3ef5f"
                                , "get_0e821612_92b6_4c0e_8bda_2470d27c8adb"
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

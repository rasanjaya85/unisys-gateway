
public function main() {
    
    string[] Swagger_Petstore_New__1_0_0_service = [ "get_4f79d3a3_8f23_478c_a9e4_93fc6e1f5f7f"
                                , "get_a70334aa_494a_4fc4_9ac0_e22722f786c6"
                                , "get_dba6d9e9_c67c_4951_a138_e96b10307488"
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

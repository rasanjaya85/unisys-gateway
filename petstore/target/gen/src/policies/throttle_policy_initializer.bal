import ballerina/log;
import ballerina/runtime;
import wso2/gateway;


function initThrottlePolicies() {
    boolean globalThrottlingEnabled=gateway:initiateThrottlingJmsListener();

     if(!globalThrottlingEnabled){
         while (true) {
             if(gateway:isStreamsInitialized == true) {
                            log:printDebug("Throttle streams initialized.");
                            break;
             }
         }
     }

    future<()> initApplication50PerMinPolicyFtr = start initApplication50PerMinPolicy();

    future<()> initApplication20PerMinPolicyFtr = start initApplication20PerMinPolicy();

    future<()> initApplication10PerMinPolicyFtr = start initApplication10PerMinPolicy();

    future<()> initSubscriptionGoldPolicyFtr = start initSubscriptionGoldPolicy();

    future<()> initSubscriptionSilverPolicyFtr = start initSubscriptionSilverPolicy();

    future<()> initSubscriptionBronzePolicyFtr = start initSubscriptionBronzePolicy();

    future<()> initSubscriptionUnauthenticatedPolicyFtr = start initSubscriptionUnauthenticatedPolicy();

    future<()> initResource50kPerMinPolicyFtr = start initResource50kPerMinPolicy();

    future<()> initResource20kPerMinPolicyFtr = start initResource20kPerMinPolicy();

    future<()> initResource10kPerMinPolicyFtr = start initResource10kPerMinPolicy();

    log:printDebug("Throttle policies initialized.");
}

function getDeployedPolicies() returns map<boolean> {
    return { "50PerMin":true,"20PerMin":true,"10PerMin":true,"Gold":true,"Silver":true,"Bronze":true,"Unauthenticated":true,"50kPerMin":true,"20kPerMin":true,"10kPerMin":true };
}
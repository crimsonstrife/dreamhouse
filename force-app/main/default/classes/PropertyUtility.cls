public with sharing class PropertyUtility {
    //Use SOQL to identify properties listed with DreamHouse Realty in the last 30 days.
    public static void newListedProperties() {
        List<Property__c> newPropList = [SELECT Name, Days_On_Market__c, Broker__r.Email__c FROM Property__c WHERE Date_Listed__c = LAST_N_DAYS:30];
        // loop through the list of properties, for each concatenate the name and email address of the broker, store in a string
        for (Property__c property : newPropList) {
            String propEmail = property.Name + ' : ' + property.Broker__r.Email__c;
            //print the string to the debug log
            System.debug(propEmail);
        }
    }
}
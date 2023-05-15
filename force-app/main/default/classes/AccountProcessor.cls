public with sharing class AccountProcessor {
    //An @future method that takes a list of Account IDs, and for each counts the number of Contacts associated with that Account.  Then assigns that number to Number_Of_Contacts__c.
    @future
    public static void countContacts(Set<Id> accountIds) {
        //for each ID in the provided list
        for (Id accountId : accountIds) {
            //query for the number of contacts associated with that account
            Integer contactCount = [SELECT COUNT() FROM Contact WHERE AccountId = :accountId];
            //get the account record
            Account account = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id = :accountId];
            //set the number of contacts
            account.Number_Of_Contacts__c = contactCount;
            //update the account
            update account;
        }
    }
}
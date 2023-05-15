@IsTest
private class AccountProcessorTest {
    //test class for AccountProcessor and the countContacts method
    @isTest
    static void testCountContacts() {
        //create an account
        Account account = new Account(Name = 'Test Account');
        insert account;
        //create a contact
        Contact contact = new Contact(AccountId = account.Id, LastName = 'Test Contact');
        insert contact;
        //create a set of account IDs
        Set<Id> accountIds = new Set<Id>();
        accountIds.add(account.Id);
        //call the future method
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        //assert that the number of contacts is 1
        Account updatedAccount = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :account.Id];
        System.assertEquals(1, updatedAccount.Number_Of_Contacts__c);
    }
}
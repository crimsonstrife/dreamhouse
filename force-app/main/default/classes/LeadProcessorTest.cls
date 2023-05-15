@isTest
public with sharing class LeadProcessorTest {
    //Create a test class that inserts 200 Lead records
    @isTest
    public static void LeadProcessorTest() {
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            Lead l = new Lead();
            l.LastName = 'Test' + i;
            l.Company = 'Test' + i;
            l.LeadSource = 'Other';
            leads.add(l);
        }
        insert leads;

        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Database.executeBatch(lp);
        Test.stopTest();

        //assert that all leads have been updated
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size());
    }
}
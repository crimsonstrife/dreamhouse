//Create an Apex class that implements the Database.Batchable interface to update all Lead records in the org with a specific LeadSource.
public with sharing class LeadProcessor implements Database.Batchable<sObject> {
    //Use a QueryLocator in the start method to collect all Lead records in the org
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, LeadSource FROM Lead]);
    }
    //The execute method must update all Lead records in the org with the LeadSource value of "Dreamforce"
    public void execute(Database.BatchableContext bc, List<Lead> scope) {
        for(Lead l : scope) {
            l.LeadSource = 'Dreamforce';
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc) {
        //debug message
        System.debug('Batch job complete');
    }
}
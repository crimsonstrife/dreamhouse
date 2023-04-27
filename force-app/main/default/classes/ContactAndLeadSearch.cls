public with sharing class ContactAndLeadSearch {
    // public static method to search for contacts and leads, accepts a string as a parameter
    // matches string as part of either the first or last name
    // returns List of SObjects
    public static List<SObject> search(String searchStr) {
        // create a list of SObjects to return
        List<SObject> results = new List<SObject>();
        // create a list of Contact records that match the search string
        List<Contact> contacts = [SELECT Id, Name FROM Contact WHERE Name LIKE :searchStr + '%'];
        // create a list of Lead records that match the search string
        List<Lead> leads = [SELECT Id, Name FROM Lead WHERE Name LIKE :searchStr + '%'];
        // add the contacts and leads to the results list
        results.addAll(contacts);
        results.addAll(leads);
        // return the results list
        return results;
    }
}
public with sharing class ContactAndLeadSearch {
    // public static method to search for contacts and leads, accepts a string as a parameter
    // matches string as part of either the first or last name
    // returns List of SObjects
    public static List<List<SObject>> searchContactsAndLeads(String searchStr) {
        //use SOSL to search for contacts and leads
        List<List<SObject>> searchResults = [FIND :searchStr IN ALL FIELDS RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)];

        Contact[] contacts = (Contact[])searchResults[0];
        Lead[] leads = (Lead[])searchResults[1];

        // create a list of lists to return
        List<List<SObject>> results = new List<List<SObject>>();

        // add contacts and leads to the list of lists
        results.add(contacts);
        results.add(leads);

        // return the list of lists
        return results;
    }
}
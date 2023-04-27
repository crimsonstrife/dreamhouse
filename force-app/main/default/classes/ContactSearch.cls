public with sharing class ContactSearch {
    //public static method to search for contacts, accepts two strings, returns a list of contacts using SOQL
    public static List<Contact> searchForContacts(String lastName, String postCode) {
        //create a list of contacts to return
        List<Contact> contacts = new List<Contact>();
        //create a string to hold the SOQL query
        String query = 'SELECT Id, FirstName, LastName FROM Contact WHERE LastName LIKE \'%' + lastName + '%\' AND MailingPostalCode LIKE \'%' + postCode + '%\'';
        //execute the query and assign the results to a list of contacts
        contacts = Database.query(query);
        //return the list of contacts
        return contacts;
    }
}
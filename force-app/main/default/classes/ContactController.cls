public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsBornAfter(Date birthDate) {
        return [
            SELECT Name, Title, Email, Phone
            FROM Contact
            WHERE Birthdate > :birthDate
            WITH SECURITY_ENFORCED
       ];
    }
    // get a list of contacts and get the names and emails
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [
            SELECT FirstName, LastName, Email
            FROM Contact
            WITH SECURITY_ENFORCED
        ];
    }
}
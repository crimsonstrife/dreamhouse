public with sharing class RandomContactFactory {
    //Use a Public Static Method to consistently generate contacts with unique first names based on the iterated number in the format Test 1, Test 2 and so on.
    public static List <Contact> generateRandomContacts (Integer numberOfContacts, String lastName) {
        List <Contact> contacts = new List <Contact> ();
        for (Integer i = 0; i < numberOfContacts; i++) {
            contacts.add(new Contact(
                FirstName = 'Test ' + i,
                LastName = lastName
            ));
        }
        return contacts;
    }
}
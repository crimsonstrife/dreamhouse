@isTest
private class TestRestrictContactByName{
    
    @isTest static void testOne() {
        List<Contact> listOfContacts = new List<Contact>();
        for(integer i = 0; i < 200; i++){
            Contact c = new Contact(FirstName = 'FNAME', LastName = 'INVALIDNAME');
            listOfContacts.add(c);
        }
        try{
            insert listOfContacts;
        }
        catch(DMLException ex){
            for(integer i = 0; i < 200; i++){
                System.assert(ex.getMessage().contains('The Last Name "'+listOfContacts[i].LastName+'" is not allowed for DML'));
            }
        }        
    }    
}
trigger AccountAddressTrigger on Account (before insert, before update) {
//match billing address checkbox is true
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            for(Account account : Trigger.new){
                if(account.Match_Billing_Address__c == true){
                    //Set shipping postcode to match billing postcode
                    account.ShippingPostalCode = account.BillingPostalCode;
                }
            }
        }
    }
}
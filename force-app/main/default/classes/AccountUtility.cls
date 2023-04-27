public with sharing class AccountUtility {
    //Write a query to get the name and annual revenue of all accounts. Then use a for loop to iterate through each account, printing the name and annual revenue of each account to the debug log.
    public static void viewAnnualRevenue() {
        //validate CRUD permissions
        if (!Schema.sObjectType.Account.isAccessible()) {
            System.debug('Account sObject is not accessible');
            return;
        } else {
            //create a list
            List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];   
            //create a query and assign the results to a list
            for (Account account : accountsList) {
                //iterate through the list and add the name and annual revenue to a concatenated string
                String acctRev = 'Account Name: ' + account.Name + ' Annual Revenue: ' + account.AnnualRevenue;
                //print the concatenated string to the debug log
                System.debug(acctRev);
            }
        }
    }
}
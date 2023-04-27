public with sharing class AccountHandler {
    // a public static method to insert an account with an Integer to determine the number of accounts to insert
    public static void insertAccount(Integer numAccounts) {
        // create a list of accounts
        List<Account> addAccounts = new List<Account>();
        // loop through the number of accounts to insert
        for (Integer i = 0; i < numAccounts; i++) {
            // create a new account
            Account a = new Account();
            // set the account name
            a.Name = 'Acme Inc ' + i;
            // set the account number
            a.AccountNumber = 'A000' + i;
            // add the account to the list of accounts
            addAccounts.add(a);
        }
        // use DML to insert the list of accounts one at a time
        insert addAccounts;
    }
}
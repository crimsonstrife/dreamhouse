public with sharing class AccountHandler {
    //insert new account, accept account name string, if account name is null, catch the failed DML and return null
    public static Account insertNewAccount(String accountName) {
        Account newAccount = new Account(Name = accountName);
        try {
            //validate CRUD permissions
            if (!Schema.sObjectType.Account.isCreateable()) {
                return null;
            } else {
                insert newAccount;
            }
        } catch (DMLException e) {
            return null;
        }
        return newAccount;
    }
}
Skip to content
 
Search…
All gists
Back to GitHub
@Forwardmotion79 
@Forwardmotion79 Forwardmotion79/WeekSixHomework.cls Secret
Created 1 hour ago
0
 Code Revisions 1
<script src="https://gist.github.com/Forwardmotion79/c801cb0b2d39bbb30824287db1276f2f.js"></script>
  
 WeekSixHomework.cls
public with sharing class WeekSixHomework {
    
    public static void soqlPractice() {
        
        //1. Below is a SOQL query that should be returning the top 5 Accounts in our org based on Annual Revenue.
        //Something's not quite right, can you fix the query?
        List<Account> topFiveAccounts = [SELECT Id, Name, AnnualRevenue
                                         FROM Account 
                                         WHERE AnnualRevenue != 0 
                                         ORDER BY AnnualRevenue DESC
                                         LIMIT 5];
        
        
        
        System.debug('This should be 5: ' + topFiveAccounts.size());
        
        
        //2. Here is a query that is missing something.  It compiles, but if you try and run this method in Anonymous
        //you'll get an error when the method tries to use the query results.  Fix it! :)
        
        List<Contact> contacts = [SELECT FirstName, LastName, MailingState FROM Contact LIMIT 10];
        
        for (Contact c : contacts) {
            String name = c.FirstName + ' ' + c.LastName;
        }
        
        
        //3.  Can you write a SOQL query from scratch that will return the top 10 Accounts in the org, ordered by annual
        //revenue in decending order?  Print your results in the debug log.
        List <Account> topTenAccounts = [Select Id, Name, AnnualRevenue from Account
                                         Where AnnualRevenue != 0 
                                         Order By AnnualRevenue DESC
                                         LIMIT 10];
        
        System.debug('List of top ten accounts by revenue ' +topTenAccounts);
        
        
        //4.  Can you write a SOQL query that will return all opportunities for all accounts in the topFiveAccounts list that we used
        //in Number 1?  (topFiveAccounts) Hint:  If you're stuck, look back a the code in WeekSixClassExercises, getOpenOppsForHotAccounts method
        //  Print your results in the debug log.
        List<Opportunity> topTenAccOpps = [Select Id, Name,Account.AnnualRevenue
                                           From Opportunity
                                           Where Accountid in :topFiveAccounts
                                           ORDER BY Account.AnnualRevenue];
        System.debug('list of top opps from top 10 accts '+topTenAccOpps);
        
        
    }
    
    public static void forTheLoveOfForLoops() {
        
        //1. Take a look at the list and loop below.  It's commented out since it can't run as is.
        // Can you replace the ?? with the number that makes sense based on the comments?
        // Remove the slashes and compile.
        // Can you add an extra counter variable so that you can print out how many times the loop ran in total?
        Integer counter = 1;
        
        //This loop should run 5 times
        for (Integer i=0; i<=5; i++) {
            counter++;
            System.debug('i is now: '+i);
        }
        System.debug('total times loop ran '+counter);
        
        
        
        //2.  Below is a loop that iterates through a list.  Can you change it to use the new For Loop syntax?  It should print out
        //each account name in the debug log when you're done.
        //Use the list size to tell you how many loops, and use indexing to fetch values.  If you need help, check the
        //loopingThroughLists method in WeekSixClassExercises for hints
        
        List<Account> accountList = [SELECT Id, Name FROM Account LIMIT 5];
        
        for(Integer i=0; i < accountList.size(); i++){
            System.debug('printing account name '+accountList[i].Name);
            
        }
        
        //for (Account a : accountList) {
        //System.debug('Account Name: ' + a.name);
        //}
        
        
    }
    
    
}

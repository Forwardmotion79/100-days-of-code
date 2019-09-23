trigger accWithCon on Account (Before update) {
    for (Account a : Trigger.new){
                         
        Integer c = [select count() from Contact where CreatedDate = THIS_YEAR and Phone != null and accountid = :a.id];
            
        a.Contacts_Created_this_Year__c = c;
        System.debug('total related contacts '+c);
   
                        
  
                               
    }
 
}

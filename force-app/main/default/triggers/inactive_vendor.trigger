trigger inactive_vendor on Account (before update)
{
   if(trigger.isbefore && trigger.isupdate)
        { 
    list<Account> acc = new List<Account>([Select Id from Account where Vendor_Status2__c = 'Active' and Id In (select Vendor_Name__c from Purchase_Contracts__c WHERE Stages__c ='Negotiation' OR Stages__c='Generation' OR Stages__c='Execution' OR Stages__c='Pending Approval' OR Stages__c='Approved' OR Stages__c ='Initiation')]);
   
        for(Account ac : acc)
            {
                for(Account bc : Trigger.New)
                {
                    if(bc.Id == ac.Id && bc.Vendor_Status2__c == 'In Active')
                    {
                        bc.addError('Vendor cannot be inactivated if it has active purchase contracts');
                       
                    }
                }                                                
            }  
    }
}
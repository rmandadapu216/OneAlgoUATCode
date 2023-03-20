trigger inActiveVendor on Purchase_Contracts__c (after update) 
{
    if(trigger.isafter && trigger.isupdate)
    {
       // List<Account> con = [select name,Vendor_Status2__c,  (Select name from Purchase_Contracts__r) from Account where Vendor_Status2__c = 'In Active'];
        //List<Purchase_Contracts__c> pc = [SELECT Name,Stages__c FROM Purchase_Contracts__c WHERE Stages__c = 'Negotiation' OR Stages__c = 'Generation' ];    
      // List<Purchase_Contracts__c> pc = [SELECT Name FROM Purchase_Contracts__c WHERE VendorInActive__c = True];
        for (Purchase_Contracts__c pcc : Trigger.new)
        {
            if(pcc.VendorInActive__c == True)
            {
                pcc.Stages__c='Cancelled';
               // pcc.addError('The vendor is inactive please create new purchase contract');
            }
        }            
        }
}
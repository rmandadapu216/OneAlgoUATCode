trigger inactiveCancel on Purchase_Contracts__c (before Update) 
{
    if(trigger.isbefore && trigger.isupdate)
    {
        list<Purchase_Contracts__c> i=[select id,Name,Vendor_Name__r.id,Vendor_Name__r.Vendor_Status2__c from Purchase_Contracts__c where Vendor_Name__r.Vendor_Status2__c='In Active'];
        for(Purchase_Contracts__c check : i)
        {
            if(check.Id!=null)
                //check.Vendor_Name__r.Vendor_Status2__c == 'In Active')
            {
                check.Stages__c='Cancelled';
                //check.addError('You can not delete the active vendor record');//trigger.newMap.keySet()
            }
        }
    }
}
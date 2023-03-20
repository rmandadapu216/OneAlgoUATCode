trigger locktherecord on Purchase_Contracts__c (before update) {
    
    locktherecordhandler.lockTheRecord(Trigger.New, Trigger.oldMap);
}

    
    
    
    
 /*   for(Purchase_Contracts__c pur:Trigger.New)
    {
        if(pur.Stages__c=='Termination'|| pur.Stages__c=='Cancelled')
        {
         pur.addError('Record is locked');  
        }
    }

   for(Purchase_Contracts__c pur:Trigger.New)
   {
       if(!pur.IsLocked__c && (pur.Stages__c =='Termination' || pur.Stages__c == 'Cancelled')){
           pur.IsLocked__c = true;
       }
       else if(pur.IsLocked__c){
           pur.Stages__c = Trigger.oldMap.get(pur.Id).Stages__c;
           pur.addError('Record is Locked');
       }
   }*/


/*    for(Purchase_Contracts__c pur:Trigger.New)
    {
        if(pur.Stages__c == 'Termination' || pur.Stages__c == 'Cancelled')
        {
            // If Stages__c is already Termination or Cancelled, prevent updates and show error
            pur.Stages__c = Trigger.oldMap.get(pur.Id).Stages__c;
            pur.addError('Record is locked');
        }
        else if(!pur.IsLocked__c && (Trigger.oldMap.get(pur.Id).Stages__c != 'Termination' && Trigger.oldMap.get(pur.Id).Stages__c != 'Cancelled'))
        {
            // If Stages_c is changing to Termination or Cancelled, set IsLocked_c to true
            pur.IsLocked__c = true;
        }
        else if(pur.IsLocked__c)
        {
            // If IsLocked__c is true, prevent updates and show error
            pur.Stages__c = Trigger.oldMap.get(pur.Id).Stages__c;
            pur.addError('Record is locked');
        }
    }*/
  
  /*   for(Purchase_Contracts__c pur:Trigger.New)
   {
       if(!pur.IsLocked__c && (pur.Stages__c =='Termination' || pur.Stages__c == 'Cancelled' || pur.Stages__c == 'Closed')){
           pur.IsLocked__c = true;
       }
       else if(pur.IsLocked__c){
           pur.Stages__c = Trigger.oldMap.get(pur.Id).Stages__c;
           pur.addError('Record is Locked');
       }
   }*/
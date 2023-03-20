trigger comments_update on Purchase_Contracts__c (before update, after update) {
    if(trigger.isUpdate  && trigger.isBefore){
          purchase_contract_comments_update.method(trigger.new);
    }
  /* if(trigger.isAfter && trigger.isUpdate){
        list<Purchase_Contracts__c> pur = [select id from Purchase_Contracts__c WHERE Id IN : Trigger.old];
        for(Purchase_Contracts__c p : pur){
            if(p.Signature__c == true){
                AttachPDF.attachPDFToRecord(p.Id);
            }
        }
        
    }*/
}
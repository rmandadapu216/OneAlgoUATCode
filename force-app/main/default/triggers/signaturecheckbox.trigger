trigger signaturecheckbox on ContentDocumentLink (after insert) {


    Set<Id> parentIds = new Set<Id>();
    for (ContentDocumentLink cdl : Trigger.new) {
        parentIds.add(cdl.LinkedEntityId);
    }
    List<Purchase_Contracts__c> recordsToUpdate = [SELECT Id FROM Purchase_Contracts__c WHERE Id IN :parentIds];
    for (Purchase_Contracts__c co : recordsToUpdate) {
        co.Signature__c = true;
    }
    update recordsToUpdate;
    

    
   
    

    

}
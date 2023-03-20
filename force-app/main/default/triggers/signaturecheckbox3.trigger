trigger signaturecheckbox3 on ContentDocumentLink (after insert) {
    
    Set<Id> parentIds = new Set<Id>();
    for (ContentDocumentLink cdl : Trigger.new) {
        parentIds.add(cdl.LinkedEntityId);
    }
    List<Amendment__c> recordsToUpdate = [SELECT Id FROM Amendment__c WHERE Id IN :parentIds];
    for (Amendment__c co : recordsToUpdate) {
        co.Signature__c = true;
    }
    update recordsToUpdate;

}
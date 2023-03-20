trigger SavePDFAsNoteAndAttachmentTrigger on Purchase_contracts__c (after update) {
  for (Purchase_contracts__c record : Trigger.new) {
    if (record.Signature__c == true) {
      SavePDFAsNoteAndAttachmentController savePDFController = new SavePDFAsNoteAndAttachmentController(new ApexPages.StandardController(record));
      savePDFController.savePDF();
    }
  }
}
@isTest
private class SavePdfTriggerTest {
  static testMethod void testSavePdf() {
    // Create a Purchase Contracts record
    Purchase_Contracts__c contract = new Purchase_Contracts__c();
    contract.Signature__c = true;
    insert contract;

    // Verify that the PDF attachment was saved to the record
    contract = [SELECT Id FROM Purchase_Contracts__c WHERE Id = :contract.Id];
    List<Attachment> attachments = [SELECT Id FROM Attachment WHERE ParentId = :contract.Id];
    System.assertEquals(1, attachments.size());
    System.assertEquals('Contract Agreement.pdf', attachments[0].Name);
  }
}
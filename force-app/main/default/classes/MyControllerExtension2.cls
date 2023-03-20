public with sharing class MyControllerExtension2 {
   public boolean customFieldValue { get; set; }
   public String renderAsPDF { get; set; }

   public MyControllerExtension2(ApexPages.StandardController controller) {
      customFieldValue = [SELECT Signature__c FROM Purchase_contracts__c WHERE Id = :controller.getId()].Signature__c;
      if (customFieldValue) {
         renderAsPDF = 'pdf';
      }
   }
}
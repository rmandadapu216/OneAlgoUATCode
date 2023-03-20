public with sharing class PurchaseContractControllerExtension {
   /* public Purchase_Contracts__c purchaseContract;
    public List<Contract_Material__c> contractMaterials { get; set; }
    
    public PurchaseContractControllerExtension(ApexPages.StandardController stdController) {
    Contract_Material__c conMaterial = (Contract_Material__c)stdController.getRecord();
    this.purchaseContract = [SELECT Id FROM Purchase_Contracts__c WHERE Id = :conMaterial.Purchase_Contract__c];
    this.contractMaterials = [SELECT Id FROM Contract_Material__c WHERE Purchase_Contract__c = :purchaseContract.Id];
} */
    public Amendment__c amendment { get; set; }
    public List<Contract_Material__c> contractMaterials { get; set; }
    
    public PurchaseContractControllerExtension(ApexPages.StandardController stdController) {
        amendment = (Amendment__c)stdController.getRecord();
        Purchase_Contracts__c purchaseContract = [SELECT Id, Name
                                                  FROM Purchase_Contracts__c
                                                  WHERE Id = :amendment.Purchase_Contract__c];
        contractMaterials = [SELECT Id, Name, Quantiy__c, Unit_Of_Measurement__c, Unit_Price__c, Total_Price__c FROM Contract_Material__c WHERE Purchase_Contract__c = :purchaseContract.Id];
    }

}
public with sharing class ImageController {
  public String imageURL{get; set;}
  private Purchase_contracts__c ContentDocumentId;
  private ApexPages.StandardController ImageController;
  //String recId;
  public ImageController(ApexPages.StandardController ImageController)
  {
  //recId = ImageController.getId();    
      this.ImageController = ImageController;
      this.ContentDocumentId = (Purchase_contracts__c)ImageController.getRecord();
    imageURL='/sfc/servlet.shepherd/document/download/';
        list<ContentDocument> ConList=[SELECT Id FROM ContentDocument order By LastModifiedDate ];
        integer a = ConList.size()-1;
    //for(ContentDocument Con: ConList)
    //{        
        if(ConList!=null)
                {
                        imageURL=imageURL+ConList[a].id;
                }
               
  //    }
}
}
//SELECT ContentDocumentId, LinkedEntityId  FROM ContentDocumentLink where LinkedEntityId in ( SELECT Id FROM Purchase_contracts__c ) and LinkedEntity.Type='Purchase_contracts__c'
//select id, (select Id from Attachments )  from Purchase_contracts__c
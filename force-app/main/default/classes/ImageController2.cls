public with sharing class ImageController2 {
  public String imageURL{get; set;}
  private Amendment__c ContentDocumentId;
  private ApexPages.StandardController ImageController;
  //String recId;
  public ImageController2(ApexPages.StandardController imgcontr)
  {
  //recId = ImageController.getId();    
      this.ImageController = imgcontr;
      this.ContentDocumentId = (Amendment__c)ImageController.getRecord();
    imageURL='/sfc/servlet.shepherd/document/download/';
        list<ContentDocument> ConList=[SELECT Id FROM ContentDocument order By LastModifiedDate];
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
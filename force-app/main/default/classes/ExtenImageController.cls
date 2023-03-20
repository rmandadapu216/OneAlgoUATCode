public with sharing class ExtenImageController {
 
    private ApexPages.standardController controller;
       public String imageURL{get; set;}
    private Purchase_contracts__c movie;
 
    private List<Id> photoIds;
 
    public ExtenImageController(ApexPages.StandardController controller) {
        this.controller = controller;
         
        this.movie = (Purchase_contracts__c)controller.getRecord();
    }
 
    public List<Id> photos {
        get {
            if(photoIds == null) {
                photoIds = new List<Id>();
                for(ContentDocument att : [select Id from ContentDocument where ParentId = :movie.Id]) {
                    photoIds.Add(att.Id);
                }
            }
                imageURL=imageURL+photoIds;                                      
            return photoIds;
        }
    }
}
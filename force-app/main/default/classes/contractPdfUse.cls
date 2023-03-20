public class contractPdfUse
{
        public list<Purchase_Contracts__c> sur{get;set;}
    public contractpdfuse(){
        sur=new list<Purchase_Contracts__c>();
        sur=[SELECT Id FROM Purchase_Contracts__c];
    }
     public list<Contract_Material__c> conlist {get; set;}
}
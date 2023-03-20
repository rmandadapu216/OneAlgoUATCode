public class saveVfPDFCtrl1 {
public String MstrId{get;set;}
    public Purchase_Contracts__c accObj{get;set;}
    
    public String PDFNo{get;set;}
    public String EFNo{get;set;}
    public boolean show{get;set;}
    public boolean showpdf{get;set;}
    public ApexPages.PageReference page2{get;set;}
    
    
    /*public PageReference Cancel()
    {
        PageReference Pdf = new PageReference('/'+MstrID);
        pdf.setredirect(True);
        return Pdf;
    } */
    
    public saveVfPDFCtrl1(ApexPages.StandardController controller) {
    MstrId = ApexPages.currentPage().getParameters().get('id');
    accObj = [Select Id From Purchase_Contracts__c Where Id = :MstrId];
}
    /*List<ContentDocumentLink> existingLinks = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :MstrId];
    if (existingLinks.size() > 0) {
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, 'A PDF already exists for this record.'));
        return null;
    }*/
    
    
    public PageReference pdfAction()
    {
             
        
        PageReference savepage ;
        savepage = Page.contractpdf;
        savepage.getParameters().put('id',MstrID);
        system.debug('id:- '+MstrID);
        blob pdfBlob;
        if (!Test.isRunningTest()) {
            pdfBlob = savepage.getContent(); //generate the pdf blob
        } else { 
            pdfBlob = Blob.valueOf('Test');
        }
        List<ContentDocumentLink> notesattch = [select id, ContentDocument.Title,LinkedEntityId from ContentDocumentLink where LinkedEntityId =: MstrID order by ContentDocument.Title asc];    
        system.debug('notesattch## ' + notesattch);
        if(notesattch.size() > 0)
        {
            string title =  notesattch[0].ContentDocument.Title;
            system.debug('title111 ' + title);
            List<String> titleSplit = title.split('R');
            //String FinalTitle = titleSplit[0]+'R0'+notesattch.size();
            String FinalTitle = 'Contract'+notesattch.size();
            system.debug('FinalTitle22 ' + FinalTitle);
            PDFNo=FinalTitle;
            
            ContentVersion conVer = new ContentVersion();
            conVer.ContentLocation = 'S'; // to use S specify this document is in Salesforce, to use E for external files
            conVer.PathOnClient = FinalTitle+'.pdf'; 
            conVer.Title = FinalTitle; 
            conVer.VersionData = pdfBlob;
            system.debug('conVer@@ ' + conVer);
            insert conVer;  
            
            Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
            
            ContentDocumentLink conDocLink = New ContentDocumentLink();
            conDocLink.LinkedEntityId = MstrID;
            conDocLink.ContentDocumentId = conDoc; 
            conDocLink.shareType = 'V';
            insert conDocLink;
            update accObj;
            
            show=false;
            showpdf=true;
            PageReference savepage2 = Page.contractpdf;
            savepage2.getParameters().put('id',MstrID);
            if(!show)
                savepage2.getParameters().put('show','0');
            savepage2.setRedirect(true);
            return savepage2;
            
        }
        
        
        {
            ContentVersion conVer = new ContentVersion();
            conVer.ContentLocation = 'S'; // to use S specify this document is in Salesforce, to use E for external files
            conVer.PathOnClient = PDFNo+'.pdf'; 
            conVer.Title = PDFNo; 
            conVer.VersionData = pdfBlob;
            insert conVer;  
            
            Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
            
            ContentDocumentLink conDocLink = New ContentDocumentLink();
            conDocLink.LinkedEntityId = MstrID;
            conDocLink.ContentDocumentId = conDoc; 
            conDocLink.shareType = 'V';
            insert conDocLink;
            //Addtext = 'File Attached';
            
            update accObj;
           
            show=false;
            showpdf=true;
            PageReference savepage2 = Page.contractpdf;//Cafactionpage;CAFFormPDF
            savepage2.getParameters().put('id',MstrID);
            if(!show)
                savepage2.getParameters().put('show','0');
            savepage2.setRedirect(true);
            return savepage2;
        }
        
        //PageReference Pdf = new PageReference('/'+MstrID);
        //pdf.setredirect(True);
        //return Pdf;        
        
    }
}
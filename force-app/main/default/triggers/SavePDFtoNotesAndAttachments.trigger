trigger SavePDFtoNotesAndAttachments on Purchase_Contracts__c (after insert, after update) {
    
      for(Purchase_Contracts__c obj : Trigger.new){
        // get the record Id
        Id recordId = obj.Id;

        // check if the custom action was performed
        if (Trigger.oldMap.get(recordId) != Trigger.newMap.get(recordId)) {
            // generate the Visualforce page as a PDF
            PageReference pdf = Page.contractpdf;
            pdf.getParameters().put('id', recordId);
            pdf.setRedirect(true);
            Blob pdfBlob = pdf.getContentAsPDF();

            // create a new attachment
            Attachment attachment = new Attachment();
            attachment.ParentId = recordId;
            attachment.Name = 'YourPDFName.pdf';
            attachment.Body = pdfBlob;

            // insert the attachment
            insert attachment;
        }
    }

}
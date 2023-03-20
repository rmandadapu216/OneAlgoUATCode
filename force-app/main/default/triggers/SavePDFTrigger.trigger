trigger SavePDFTrigger on Purchase_Contracts__c (after insert, after update) {
        List<Attachment> attachments = new List<Attachment>();    
        for (Purchase_Contracts__c obj : Trigger.new) {
        PageReference pdf = Page.contractpdf;
        pdf.getParameters().put('id', obj.Id);
        pdf.setRedirect(true);
        Blob pdfBlob = pdf.getContentAsPDF();
        Attachment attach = new Attachment();
        attach.ParentId = obj.Id;
        attach.Name = 'Agreement.pdf';
        attach.Body = pdfBlob;
        attachments.add(attach);
    }
    
    insert attachments;

}
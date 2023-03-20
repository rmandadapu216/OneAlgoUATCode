public with sharing class QuoteAsPDFController {
    public String QuoteId;
    public QuoteAsPDFController(ApexPages.StandardController controller) {
    QuoteId=ApexPages.currentPage().getParameters().get('Id');
        Attachment myAttach = new Attachment();
        myAttach.ParentId = QuoteId;//Id of the object to which the page is attached
        myAttach.name = 'Quotation.pdf';
        PageReference myPdf = ApexPages.currentPage();//myPdfPage is the name of your pdf page
        myAttach.body = myPdf.getContentAsPdf();
        insert myAttach;
    }
   
}
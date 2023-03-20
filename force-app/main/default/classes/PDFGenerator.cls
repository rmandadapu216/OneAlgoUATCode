public class PDFGenerator {
    @future
    public static void generatePDF(Id recordId) {
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
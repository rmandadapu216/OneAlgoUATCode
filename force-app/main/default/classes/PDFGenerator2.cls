public class PDFGenerator2 {
public static Blob generatePDF(Id recordId) {
    PageReference pdf = new PageReference('/apex/contractpdf?id=' + recordId);
    pdf.getParameters().put('renderAs', 'pdf');
    Blob b = pdf.getContentAsPDF();
    return b;
  }
}
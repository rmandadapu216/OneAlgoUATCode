public with sharing class SavePDFAsNoteAndAttachmentController {
  private final ApexPages.StandardController controller;
  public SavePDFAsNoteAndAttachmentController(ApexPages.StandardController controller) {
    this.controller = controller;
  }

  public PageReference savePDF() {
    PageReference pdf = new PageReference('/apex/contractpdf');
    pdf.getParameters().put('id', controller.getId());
    pdf.setRedirect(true);

    Attachment attachment = new Attachment();
    attachment.Body = pdf.getContent();
    attachment.Name = 'Contract Agreement.pdf';
    attachment.IsPrivate = false;
    attachment.ParentId = controller.getId();
    insert attachment;

    Note note = new Note();
    note.Title = 'Contract Agreement';
    note.Body = 'Agrement Information';
    note.ParentId = controller.getId();
    insert note;

    return null;
  }
}
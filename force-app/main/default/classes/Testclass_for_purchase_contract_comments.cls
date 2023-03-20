@istest
public class Testclass_for_purchase_contract_comments {
@istest
    static void method(){
        //create a record 
     
        account ac=new account ();
        ac.Name='Cont Test Method 1';
        ac.Vendor_Status2__c='Active';
         insert ac;
        
        Purchase_Contracts__c pcs = new Purchase_Contracts__c();
                pcs.name = 'ContTest1';
                pcs.Vendor_Name__c = ac.id;
                pcs.Stages__c = 'Initiation';
                pcs.Contract_type__c='Software';
                pcs.Contract_Term__c = 5;
                insert pcs;
        Contract_Material__c  cm1=new Contract_Material__c ();
        cm1.Purchase_Contract__c=pcs.ID;
        cm1.Name='Contmat1';
        cm1.Quantiy__c=20;
        cm1.Unit_Price__c=100;
        cm1.Unit_Of_Measurement__c='Each';
        insert cm1;
        pcs.Stages__c='Negotiation';
        update pcs;
        pcs.Delivery_Schedule__c='Weekly';
        pcs.Stages__c='Generation';
        update pcs;
        //submit for approval 
        Approval.ProcessSubmitRequest req1 =
           new Approval.ProcessSubmitRequest();
        req1.setComments('Approved.');
        req1.setNextApproverIds(new Id[]{UserInfo.getUserId()});
       
        req1.setObjectId(pcs.id);//Set the record Id
       
        // Submit on behalf of a specific submitter
        req1.setSubmitterId(UserInfo.getUserId());
       
        // Submit the record to specific process and skip the criteria evaluation
        req1.setProcessDefinitionNameOrId('Stages__c');//set the name of your approval process
        req1.setSkipEntryCriteria(true);
        // Submit the approval request for the account
        Approval.ProcessResult result = Approval.process(req1);
      
       
        //Step for approving by user 1st
        Approval.ProcessWorkitemRequest req2 =  new Approval.ProcessWorkitemRequest();
        req2.setComments('Approving request.');
        req2.setAction('Approve');
        req2.setNextApproverIds(new Id[] {UserInfo.getUserId()});//UserInfo.getUserId()
        system.debug('req2::'+req2);
        // Use the ID from the newly created item to specify the item to be worked
        req2.setWorkitemId(result.getNewWorkitemIds().get(0));
        system.debug('req3::'+req2);
        // Submit the request for approval
        Approval.ProcessResult result2 =  Approval.process(req2);
      
          //Step for approving by user 2nd
        Approval.ProcessWorkitemRequest req3 =  new Approval.ProcessWorkitemRequest();
        req3.setComments('Rejected request');
        req3.setAction('Reject');
        //req3.setNextApproverIds(new Id[] {UserInfo.getUserId()});//UserInfo.getUserId()
        system.debug('req2::'+req3);
        // Use the ID from the newly created item to specify the item to be worked
        req3.setWorkitemId(result2.getNewWorkitemIds().get(0));
        system.debug('req3::'+req3);
        // Submit the request for approval
        Approval.ProcessResult result3 =  Approval.process(req3);
       //call approvalAction
      ProcessInstance PI =new ProcessInstance();
        PI.TargetObjectId =pcs.Id;
        PI.Status ='Rejected'; 

        insert PI;
        ProcessInstanceStep pis = new ProcessInstanceStep();
        pis.ProcessInstanceId=PI.Id;
        pis.Comments='Rejected';
        pcs.Reason_of_Rejection__c=pis.Comments;
        insert pis;
     system.assertEquals(Pcs.Reason_of_Rejection__c,'Rejected' );
    } 
}
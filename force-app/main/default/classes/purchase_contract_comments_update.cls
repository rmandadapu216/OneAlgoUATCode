public class purchase_contract_comments_update {
    public static void method(list<Purchase_Contracts__c> conlist){
     List<Purchase_Contracts__c> PList=[Select id,(Select Id,
                                                                 IsPending,                              
                                                                 ProcessInstanceId,                              
                                                                 TargetObjectId,                             
                                                                 StepStatus,                              
                                                                 OriginalActorId,                              
                                                                 ActorId,                              
                                                                 RemindersSent,                             
                                                                 Comments,                              
                                                                 IsDeleted,                              
                                                                 CreatedDate,                             
                                                                 CreatedById,                              
                                                                 SystemModstamp                              
                                                                 From ProcessSteps                             
                                                                 ORDER BY CreatedDate DESC)                             
                                                 					From Purchase_Contracts__c                             
                                                 					WHERE Id IN : conlist];

  if(PList.size() > 0){
            for(Purchase_Contracts__c opp : PList){            
                for(Purchase_Contracts__c opp1 : conlist) {               
                    if(opp.id == opp1.id) {               
                            if (opp1.ContractRejected__c ==true ){
                                if(opp.ProcessSteps[0].Comments == null){
                                    opp1.addError('Please mention Comments for Rejection');
                                }
                                else{
                                opp1.Reason_of_Rejection__c  = opp.ProcessSteps[0].Comments ;
                                }
                            }                          
                    }
                }               
            }        
  }         
    }   
    }
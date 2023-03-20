public class amendment_rejection_comments {
    public static void method( List<Amendment__c> amdlist){
        List<Amendment__c> amendList=[Select id,(Select Id,
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
                                                                    From Amendment__c                             
                                                                    WHERE Id IN : amdlist];

  if(amendList.size() > 0 ){
      
            for(Amendment__c amd1 : amendList){            
                for(Amendment__c amd2 : amdlist) {               
                    if(amd1.id == amd2.id  && amd1.processsteps.size()>0 && amd2.Is_amendment__c==true) {
                        if(amd1.ProcessSteps[0].Comments == null){
                            amd2.addError('Please mention comments for Rejection');
                        }else{  
                  amd2.Reason_for_rejection__c   = amd1.ProcessSteps[0].Comments ;      
                        }
                    }
                }                
            }     
            }        
  }         
    }
trigger Amendment_rejection_comments on Amendment__c (before update) {
    if(trigger.IsBefore && trigger.isUpdate){
      amendment_rejection_comments.method(trigger.new);
    }
    }
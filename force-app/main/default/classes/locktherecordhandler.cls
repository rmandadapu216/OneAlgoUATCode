public class locktherecordhandler {
    public static void lockTheRecord(List<Purchase_Contracts__c> contractsToUpdate, Map<Id, Purchase_Contracts__c> oldContractsMap) {
        for(Purchase_Contracts__c contract : contractsToUpdate) {
            if(!contract.IsLocked__c && (contract.Stages__c =='Termination' || contract.Stages__c == 'Cancelled' || contract.Stages__c == 'Closed')) {
                contract.IsLocked__c = true;
            } else if(contract.IsLocked__c){
                contract.Stages__c = oldContractsMap.get(contract.Id).Stages__c;
                contract.addError('Record is Locked');
            }
        }
    }

}
public class PurchaseContractHandler {
    public static void handleBeforeUpdate(List<Purchase_Contracts__c> newPurchases, Map<Id, Purchase_Contracts__c> oldMap) {
        for (Purchase_Contracts__c purchase : newPurchases) {
            if (!purchase.IsLocked__c && (purchase.Stages__c =='Termination' || purchase.Stages__c == 'Cancelled' || purchase.Stages__c == 'Closed')) {
                purchase.IsLocked__c = true;
            } else if (purchase.IsLocked__c) {
                purchase.Stages__c = oldMap.get(purchase.Id).Stages__c;
                purchase.addError('Record is Locked');
            }
        }
    }
}
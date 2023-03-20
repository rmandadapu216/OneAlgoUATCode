public class ContentDocumentLinkTriggerHandler {
    public static void handleInsert(List<ContentDocumentLink> records) {
        
        String opportunityKeyPrefix = 'Signature';
        Map<Id, Purchase_Contracts__c> opportunities = new Map<Id, Purchase_Contracts__c>();

        for (ContentDocumentLink record : records) {
            if (String.valueOf(record.LinkedEntityId).startsWith(opportunityKeyPrefix)) {
                opportunities.put(
                    record.LinkedEntityId,
                    new Purchase_Contracts__c(Id=record.LinkedEntityId, Signature__c=true)
                );
            }
        }

        update opportunities.values();
    }

   /* public void handleDelete(List<ContentDocumentLink> records) {
        
        String opportunityKeyPrefix = 'Signature';
        Set<Id> opportunitiesIds = new Set<Id>();

        for (ContentDocumentLink record : records) {
            if (String.valueOf(record.LinkedEntityId).startsWith(opportunityKeyPrefix)) {
                opportunitiesIds.add(record.LinkedEntityId);
            }
        }

        List<AggregateResult> attachmentPerOpportunity = [
            SELECT COUNT(Id), LinkedEntityId
            FROM ContentDocumentLink
            WHERE LinkedEntityId IN opportunitiesIds
            GROUP BY LinkedEntityId;
        ];

        Set<Id> opportunitiesWithAttachments = new Set<Id>();

        for (AggregateResult ar : attachmentPerOpportunity) {
            opportunitiesWithAttachments.add(Id.valueOf(String.valueOf(ar.get('expr0'))));
        }

        Map<Id, Opportunity> opportunities = new Map<Id, Opportunity>();

        for (ContentDocumentLink record : records) {
            if (!opportunitiesWithAttachments.contains(record.LinkedEntityId)) {
                opportunities.put(
                    record.LinkedEntityId,
                    new Opportunity(Id=record.LinkedEntityId, HasAttachments__c=false)
                );
            }
        }

        update opportunities.values();*/
    }
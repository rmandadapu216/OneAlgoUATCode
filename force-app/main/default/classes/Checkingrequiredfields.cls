public class Checkingrequiredfields {

 
    public static void checkRequiredField( String strObjName ) {
        
       Map<String, Schema.SObjectType> mapObj  = Schema.getGlobalDescribe();
Schema.SObjectType sObjType = mapObj.get('Purchase_Contracts__c');
Schema.DescribeSObjectResult objDescribe = sObjType.getDescribe();
Map<String,Schema.SObjectField> mapFields = objDescribe.fields.getMap();
List<String> requiredFieldList = new List<String>();
 
for(String obj : mapFields.keyset()) {
    Schema.DescribeFieldResult describeField = mapFields.get(obj).getDescribe();
    if (describeField.isCreateable()  && !describeField.isNillable() && !describeField.isDefaultedOnCreate()) {
        requiredFieldList.add(obj);
        System.debug(obj);
    }
}
    }
}
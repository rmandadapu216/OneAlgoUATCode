@isTest
public class inactiveVendorTest {

 static testMethod void MyTestFunction(){

Account acc = new Account();
acc.name = 'Vendor';
acc.Vendor_Status2__c = 'Active';
insert acc;

Purchase_Contracts__c pc = new Purchase_Contracts__c();
pc.name = 'Purchase Contracts1';
pc.Vendor_Name__c = acc.id;
pc.Contract_type__c = 'Software';   
pc.Stages__c = 'Initiation';
//pc.No_of_Materials_Selected__c = 10;
pc.Contract_Term__c = 2;
insert pc;
  
Contract_Material__c cm = new Contract_Material__c();

cm.Name = 'Contract Material';
cm.Unit_Price__c = 100;
cm.Quantiy__c = 2;
cm.Unit_Of_Measurement__c = 'Gallons';
cm.Purchase_Contract__c = pc.id; 

insert cm;     

  
pc.Stages__c = 'Negotiation';
Update pc;

    
pc.Stages__c = 'Generation';
pc.Delivery_Schedule__c = 'weekly';
Update pc;


          
    
pc.Stages__c = 'Cancelled';
pc.Cancellation_Reason__c = 'Price related issue';
update pc;    
     
    try 
    {
           acc.Vendor_Status2__c = 'In Active';
           update acc;
    }
     catch (DmlException ex) 
     {
           System.assertEquals(StatusCode.FIELD_CUSTOM_VALIDATION_EXCEPTION, ex.getDmlType(0));
           System.assertEquals('Vendor cannot be inactivated if it has active purchase contracts', ex.getDmlMessage(0));
          
        
     }

	}

}
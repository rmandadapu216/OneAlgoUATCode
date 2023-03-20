public class example99 {

    public void contactAccountList(){
        Map<Id, account> mAcc = new Map<Id, account>([select id, name, (select id, name, phone from contacts)from account]);
	Map<Id, List<contact>> mapObj = new Map<Id, List<contact>>();
        for (Id idval:mAcc.keyset()){
            System.debug(idval+'=====>'+mAcc.get(idval).contacts);
            mapObj.put(idval, mAcc.get(idval).contacts);
        }
        System.debug('mapObj====>'+mapObj);
    }
}
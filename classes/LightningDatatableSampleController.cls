
/**
 * LightningDatatableSampleのApexコントローラ.
 */
public with sharing class LightningDatatableSampleController {

    /*------------------------------------------------------------------
        内部クラス
    ------------------------------------------------------------------*/
    /**
     * クラス内例外.
     */
    public class ControllerException extends Exception {}

    /*------------------------------------------------------------------
        公開メソッド
    ------------------------------------------------------------------*/
    /**
     * 未承認の申請一覧を取得する.
     */
    @AuraEnabled
    public static ResponseWrapper fetchItemWrapperList() {
        try {
            return new ResponseWrapper(true, createItemWrapperList());
        } catch (Exception e) {
            return new ResponseWrapper(false, e.getMessage());
        }
    }

    /*------------------------------------------------------------------
        非公開メソッド
    ------------------------------------------------------------------*/
    /**
     * ループ用ラッパークラスを作成する.
     */
    private static List<ItemWrapper> createItemWrapperList() {
        List<ItemWrapper> itemWrapperList = new List<ItemWrapper>();
        Integer index = 0;
        for (CustomObject__c obj : selectCustomObject()) {
            itemWrapperList.add(new ItemWrapper(index++, obj));
        }
        return itemWrapperList;
    }


    /**
     * レコードを取得.
     */
    private static List<CustomObject__c> selectCustomObject() {
        return [
            SELECT Id,
                CurrencyField__c, DateField__c, DatetimeField__c,
                MailField__c, TextField__c, LinkUrlField__c, LinkLabelField__c
            FROM CustomObject__c
            LIMIT 100
        ];
    }
}

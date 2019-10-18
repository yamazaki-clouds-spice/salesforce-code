/**
 * ループ用ラッパークラス.
 */
public with sharing class WorkitemWrapper {

	/*------------------------------------------------------------------
		変数
	------------------------------------------------------------------*/
    /** インデックス. */
    @AuraEnabled
    public String index {get;set;}
    /** 通貨. */
    @AuraEnabled
    public Decimal currencyField {get;set;}
    /** 日付. */
    @AuraEnabled
    public Date dateField {get;set;}
    /** 日付＋時間. */
    @AuraEnabled
    public Datetime datetimeField {get;set;}
    /** メール. */
    @AuraEnabled
    public String mailField {get;set;}
    /** テキスト. */
    @AuraEnabled
    public String textField {get;set;}
    /** リンクのURL. */
    @AuraEnabled
    public String linkUrlField {get;set;}
    /** リンクのラベル. */
    @AuraEnabled
    public String linkLabelField {get;set;}

	/*------------------------------------------------------------------
		コンストラクタ
	------------------------------------------------------------------*/
    /**
     * コンストラクタ
     */
    public ItemWrapper(Integer index, CustomObject__c object) {
        this.index = 'item' + index;
        this.currencyField = object.CurrencyField__c;
        this.dateField = object.DateField__c;
        this.datetimeField = object.DatetimeField__c;
        this.mailField = object.MailField__c;
        this.textField = object.TextField__c;
        this.linkUrlField = object.LinkUrlField__c;
        this.linkLabelField = object.LinkLabelField__c;
    }
}

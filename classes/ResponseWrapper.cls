/**
 * レスポンスラッパークラス.
 */
public with sharing class ResponseWrapper {
    
	/*------------------------------------------------------------------
		変数
	------------------------------------------------------------------*/
	/** 処理が成功したかどうか. */
	@AuraEnabled
	public Boolean isSuccess {get;set;}
	/** エラーメッセージ. */
	@AuraEnabled
	public String errorMsg {get;set;}
	/** 成功時の返り値. */
	@AuraEnabled
	public Object result {get;set;}

	/*------------------------------------------------------------------
		コンストラクタ
	------------------------------------------------------------------*/
	/**
	 * Lightningコンポーネント側にreturnするためのクラスコンストラクタ.
	 * @param status 処理が成功したかどうか.
	 * @param obj Lightnin側で取得する処理結果やエラーメッセージ.
	 */
	public ResponseWrapper(Boolean status, Object obj) {
		// 処理が成功したかどうかを保持する.
		isSuccess = status;
		// 失敗した場合、objをエラーメッセージとして保持する.
		errorMsg = isSuccess ? '' : String.valueOf(obj);
		// 成功した場合、objを処理結果として保持する.
		result = isSuccess ? obj : null;
	}
}
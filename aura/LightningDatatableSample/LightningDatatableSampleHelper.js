({
	/**
	 * カラムを設定する.
	 */
	setDatatableColumn : function(cmp) {
		/**
		 * 主なカラム設定.
		 * label: 列のヘッダー.
		 * fieldName: datatableのdata(itemWrapperList)のレコードの項目名.
		 * type: 列の値のデータ形式(action,boolean,button,button-icon,currency,date,
		 *     date-local,email,location,number,percent,phone,text,url).
		 * typeAttributes: typeごとに設定可能な要素.
		 * 
		 * 上記で全てではありません。詳細は
		 * https://developer.salesforce.com/docs/component-library/bundle/lightning:datatable/documentation
		 */
		// データテーブルの列設定.
        cmp.set("v.datatableColumns", [
			// アクション.
			{ type: "action", typeAttributes: {
				// 指定できるアクション一覧.
				rowActions: [
					{ label: "Edit Record", name: "edit" }, // nameはhandleRowActionHelperメソッドで利用.
					{ label: "Delete Record", name: "delete" }
				]
			} },
			// 通貨.
			{ label: "通貨型", fieldName: "currencyField", type: "currency" },
			// 日付.
			{ label: "日付型", fieldName: "dateField", type: "date-local", typeAttributes: {
				// 日付の表示形式を指定(「2020/01/31」形式).
				month: "2-digit",
				day: "2-digit"
			} },
			// 日付＋時間.
			{ label: "日付＋時間型", fieldName: "datetimeField", type: "date", typeAttributes: {
				// 日付の表示形式を指定(「September 26, 2018, 12:00 PM」形式).
				year: "numeric",
				month: "long",
				day: "2-digit",
				hour: "2-digit",
				minute: "2-digit"
			} },
			// メール.
			{ label: "メール型", fieldName: "mailField", type: "email" },
			// テキスト.
			{ label: "テキスト型", fieldName: "textField", type: "text" },
			// URL.
			{ label: "URL型", fieldName: "linkUrlField", type: "url", typeAttributes: {
				// リンクのテキストを指定.
				label: { fieldName: "linkLabelField" }
			} }
		]);
	},
	/**
	 * テーブルのアクション作成.
	 */
	handleRowActionHelper : function(cmp, evt) {
		var action = evt.getParam("action");
		var row = evt.getParam("row");
		switch (action.name) {
			// actionのnameを元に処理内容を取得する.
			case "edit":
				alert("edit button is clicked.");
				break;
			case "delete":
				alert("delete button is clicked.");
				// インデックス.
				console.dir(row.index);
				// 行データ.
				console.dir(JSON.stringify(row));
				break;
		}
	},
	/**
	 * レコードの取得.
	 */
    fetchDataHelper : function(cmp) {
		// Apexメソッドの指定.
		var action = cmp.get("c.fetchItemWrapperList");
		// 引数の指定.
		action.setParams({
		});
		// コールバックの設定.
		action.setCallback(this, function(response) {
			var state = response.getState();
			var result = response.getReturnValue();
			if (state === "SUCCESS" && result.isSuccess) {
                /** 正常終了した場合. */
				cmp.set("v.itemWrapperList", result.result);
			} else {
				/** エラーが発生した場合. */
				var errors = response.getError();
				if (errors[0] && errors[0].message) {
					// Apexでcatchできなかった場合.
					window.alert("予期せぬエラーが発生しました。");
				} else {
					// Apexでcatchした場合.
					window.alert("エラーが発生しました：" + result.errorMsg);
				}
			}
		});
		// メソッドの実行.
		$A.enqueueAction(action);
	},
})

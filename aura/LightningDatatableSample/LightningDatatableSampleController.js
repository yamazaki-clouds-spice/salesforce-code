({
	doInit : function(cmp, evt, hlp) {
		// データテーブルのカラムを設定する.
		hlp.setDatatableColumn(cmp);
		// データ取得.
		hlp.fetchDataHelper(cmp);
	},
	onclickRowAction : function(cmp, evt, hlp) {
		// データ取得.
		hlp.onclickRowActionHelper(cmp);
	},
})

$D.gridCache = function(cacheId,_grid) {
	if (localStorage) {

		var _sortDataArray;

		_sortDataArray = localStorage.getItem("_sortDataArray"+cacheId);

		if (!_sortDataArray) {
			_sortDataArray = "0#0";
		}

		if (_sortDataArray.length > 200) {
			_sortDataArray = "0#0";
		}

		_cm = _grid.getColumnModel();

		_sortArray = _sortDataArray.split(",");
		for (var i = 1; i < _sortArray.length; i++) {
			var _sortData = _sortArray[i];
			oldIndex = parseInt(_sortData.substring(0, _sortData.indexOf("#")));
			newIndex = parseInt(_sortData.substring(_sortData.indexOf("#") + 1));
			_cm.moveColumn(oldIndex, newIndex);
		}

		_grid.on("columnmove", function(oldIndex, newIndex) {
			_sortDataArray = _sortDataArray + "," + oldIndex + "#" + newIndex;
			localStorage.setItem("_sortDataArray"+cacheId, _sortDataArray);
		});
	}
}
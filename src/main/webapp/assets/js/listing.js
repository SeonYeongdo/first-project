var type;

$(document).ready(function() {
	if (typeof type != "undefined") {
		$("#" + type + "_div").trigger("click");
		
	}
});
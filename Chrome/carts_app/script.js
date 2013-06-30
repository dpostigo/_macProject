// chrome.browserAction.onClicked.addListener(function(tab) {


// });



chrome.app.runtime.onLaunched.addListener(function() {
	chrome.app.window.create('background.html', {
		'bounds': {
			'width': 400,
			'height': 500
		}
	});
});



chrome.windows.onFocusChanged.addListener(function(windowId){
	// alert("on focus changed chrome.windows");
});



chrome.app.window.onFocusChanged.addListener(function(windowId){
	// alert("on focus changed chrome.app.window");
});

function getCurrentURL () {
	chrome.tabs.getSelected(null, function(tab) {
		tabId = tab.id;
		tabUrl = tab.url;
		alert(tab.url);
		return tabUrl;
	});
}


function openNewTab() {
  chrome.tabs.create({url:chrome.extension.getURL("tabs_api.html")});
}

function helloWorld() {
	alert("hello?");
}
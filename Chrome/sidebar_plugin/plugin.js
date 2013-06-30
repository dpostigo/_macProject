// chrome.browserAction.onClicked.addListener(function(tab) {


// });

var cartsId = -1;


chrome.windows.onCreated.addListener(function(window) {
	// alert("created");
});


chrome.windows.onRemoved.addListener(function(windowId){
	// alert("onRemoved");
});


chrome.windows.onFocusChanged.addListener(function(windowId){
	// alert("focus did change");
	// alert(windowId);
	// alert(cartsId);
	if (cartsId != -1) {
		chrome.windows.update(cartsId, {focused: true});
	}
});


chrome.browserAction.onClicked.addListener(function(tab) {
	// openNewTab();
	// openPopup();
	// chromeWindowsCreate(tab.url);

    chrome.windows.create({url: tab.url, width: 520, height: 660}, function(window) {
    	cartsId = window.id;
    });
	// injectScript();
});


function injectScript() {

	// var details = {
	// 	code: colorChangeCode()
	// };

	// details = {
	// 	code: "alert('hello')"
	// }
	chrome.tabs.executeScript(null, {file: "background.js"});
	// chrome.tabs.executeScript(null, details);
}

// chrome.app.runtime.onLaunched.addListener(function() {
// 	// createPluginWindow();
// });



// chrome.browserAction.onClicked.addListener(function(tab) {
//   chrome.tabs.create({url:chrome.extension.getURL("tabs_api.html")});
// });


// function getCurrentURL () {
// 	chrome.tabs.getSelected(null, function(tab) {
// 		tabId = tab.id;
// 		tabUrl = tab.url;
// 		alert(tab.url);
// 		return tabUrl;
// 	});
// }



// function createAppWindow() {
// 	chrome.app.window.create('background.html', {
//     'bounds': {
//       'width': 400,
//       'height': 500
//     }
//   });
// }

// function createPluginWindow() {
// 	window.open(chrome.extension.getURL("background.html"));
// }

function openNewTab() {
	chrome.tabs.create({url:chrome.extension.getURL("tabs_api.html")});
}


function chromeWindowsCreate(url) {
	if (url == undefined) url = "background.html";
    chrome.windows.create({url: url, width: 520, height: 660 });
}

function openPopup() {
	window.open(chrome.extension.getURL("background.html"),"gc-popout-window","width=348,height=654")
}



function colorChangeCode() {
	return "document.body.style.backgroundColor='" + e.target.id + "'";
}

function changeBackgroundColor() {
	chrome.tabs.executeScript(null, {code:"document.body.style.backgroundColor='" + e.target.id + "'"});
  // window.close();

}

function getClickHandler() {
  return function(info, tab) {

    // The srcUrl property is only available for image elements.
    var url = 'info.html#' + info.srcUrl;

    // Create a new window to the info page.
    chrome.windows.create({ url: url, width: 520, height: 660 });
  };
};

// function helloWorld() {
// 	alert("hello?");
// }

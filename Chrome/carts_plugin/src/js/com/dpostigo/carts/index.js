

console.log("hello");



function start() {
	getData();
	if (model.user == null) {

	}
}

function getData() {
	model = localStorage.getItem('carts-model');
}
function saveData() {
	localStorage.setItem('carts-model', model);
}

function handleForm() {
	var formId = $(this).attr('id');

	switch (formId) {
		case "login-form" :
			handleLoginForm(this);
			break;
	}

}

function handleLoginForm(target) {
	var username = $(this).find('#username').val();
	var password = $(this).find('#password').val();

	console.log("username = " + username);
	console.log("password = " + password);

}
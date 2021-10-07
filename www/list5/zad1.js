window.onload = function load() {
	document.getElementById('form').onsubmit = checkForm;
	document.getElementById('accId').onblur = checkAccId;
	document.getElementById('pesel').onblur = checkPesel;
	document.getElementById('email').onblur = checkEmail;
	document.getElementById('date').onblur = checkDate;
} 

var borderOk = "2px solid green";
var borderNotOk = "2px solid red";

var accIdRE = /\d{26}/;
var peselRE = /^\d{11}$/;
var emailRE = /^[0-9a-zA-Z_.-]+@[0-9a-zA-Z.-]+\.[a-zA-Z]{2,3}$/;
var dateRE = /^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$/;

function checkForm() {
	//isAllOk = checkAccId() && checkPesel() && checkEmail() && checkDate();
	//isAllOk = checkAccId() & checkPesel() & checkEmail() & checkDate();
	a = checkAccId(), b =  checkPesel(), c = checkEmail(), d = checkDate();
	//zmusza zeby wszystkie te funkcje sie wykonaly
	isAllOk = a && b && c && d;
	if (isAllOk)
		alert ("Dane wypełnione poprawnie");
	else
		alert ("Złe dane");
	return isAllOk;
}

function checkAccId() {
	var field = document.getElementById('accId');
	valid = accIdRE.test(field.value)
	field.style.border = valid ? borderOk : borderNotOk;
	return valid;
}
function checkPesel() {
	var field = document.getElementById('pesel');
	valid = peselRE.test(field.value)
	field.style.border = valid ? borderOk : borderNotOk;
	return valid;
}
        
function checkEmail() {
	var field = document.getElementById('email');
	valid = emailRE.test(field.value)
	field.style.border = valid ? borderOk : borderNotOk;
	return valid;
}

function checkDate() {
	var field = document.getElementById('date');
	valid = dateRE.test(field.value)
	field.style.border = valid ? borderOk : borderNotOk;
	return valid;
}

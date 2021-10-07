//Mateusz Obara, zadanie 2 lista 4
window.onload = function load(){
	document.getElementById('form').onsubmit = checkForm;
	document.getElementById('mail').onblur= checkMail;
	document.getElementById('bank_number').onblur= checkBank_number;
	document.getElementById('pesel').onblur= checkPesel;
	document.getElementById('date').onblur= checkDate;
} 

function checkForm(){
	if (!checkBank_number() || !checkPesel() || !checkMail() || !checkDate()){
		alert('formularz wypelniony niepoprawnie');
		return false;
	}
	alert('formularz poprawny');
	return true;
}

function checkPesel() {
	var regex_pesel = /[0-9]{11}/;
	var pesel = document.getElementById('pesel');
	if (!regex_pesel.test(pesel.value)) {
		pesel.style.border = "3px solid #FF0000";
		return false;
	}
	pesel.style.border = "1px solid #00E600";
}

function checkDate(){
	var date = document.getElementById('date');
	var regex_date = /^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$/; //
	if(!regex_date.test(date.value)){
		date.style.border = "3px solid #FF0000";
		return false;
	}
	date.style.border = "1px solid #00E600";
}

function checkMail() {
	var mail = document.getElementById('mail');
	var regex_mail = /^[0-9a-zA-Z_.-]+@[0-9a-zA-Z.-]+\.[a-zA-Z]{2,3}$/;
	if(!regex_mail.test(mail.value)){
		mail.style.border = "3px solid #FF0000";
		return false;
	}
	mail.style.border = "1px solid #00E600";
}
function checkBank_number(nr) {
	var bank_number = document.getElementById('bank_number');
	var regex_bank_number = /[0-9]{26}/;
	if(!regex_bank_number.test(bank_number.value)){
		bank_number.style.border = "3px solid #FF0000";
		return false;
	}
	bank_number.style.border = "1px solid #00E600";
}

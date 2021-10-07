window.onload = function load() {
	displaySelector1();
	document.getElementById("brand").onchange = displaySelector2; 
	document.getElementById("addOptionButton").onclick = addNewCar;
}

var brands = {
	"aa" : ["a1","a2"],
	"bb" : ["b1", "b2"],
	"cc" : ["c1", "c2"]
};


function displaySelector1(){
	var b = document.getElementById("brand");
	b.options.length = 0;
	for (k of Object.keys(brands))
		b.options[b.options.length] = new Option(k, k);//Options(name, value?);
		//add?
}

function displaySelector2(){
	var m = document.getElementById("model");
	var b = document.getElementById("brand");
	m.options.length = 0;
	for (x of brands[b.value])
		m.options[m.options.length] = new Option(x, x);
}

function addNewCar(){
	var r1 = document.getElementById("addOptionBrand").checked;
	var r2 = document.getElementById("addOptionModel").checked;
	var newcar = document.getElementById("addOptionField").value;
	var b = document.getElementById("brand");
	if (!(newcar === "")){
		if (r1) {
			brands[newcar] = [];
			var option = document.createElement("option");
			option.text = option.value = newcar;
			b.add(option);
		} else if (r2) {
			brands[b.value].push(newcar);
		} else {
			alert("zaznacz jakas opcje")
		} 	
	} else {
		alert("wpisz cokolwiek")
	}
}

// Mateusz Obara Zadanie 1 lista 4
var div = document.createElement('div');
div.id = 'menu';
div.setAttribute("style", "border-style: solid;");

function changeColor(clr) {
	document.getElementById("menu").style.borderColor = clr;
};

function addLink(clr) {
	var link_element = document.createElement('link_element');
	link_element.setAttribute('href', '#');
	link_element.setAttribute('onclick', `changeColor('${clr}')`);
	link_element.innerHTML = clr;
	return link_element;
}


//aby zrobic odpowiednie czesci zadania, wpisalbym do konsoli wykomentowane ponizsze linijki

//pierwsza czesc
//document.body.appendChild(div);

//druga czesc
//changeColor('Blue')

//trzecia czesc
/*
document.getElementById('menu').appendChild(addLink('Red'));
document.getElementById('menu').appendChild(addLink('Black'));
document.getElementById('menu').appendChild(addLink('Brown'));
*/

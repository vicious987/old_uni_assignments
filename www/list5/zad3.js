window.onload = function load() {
	setInterval(change, 10);
}

var firstframe = 0;
var lastframe = 20;
var frame = 0;

function change(){
	frame = (frame < lastframe) ? frame + 1 : firstframe;
	//frame = frame + 1;
	var timestamp = new Date().getTime();     
	document.getElementById("img").src = "gifframes/" + frame + ".gif?t=" + timestamp; 
}

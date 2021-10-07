window.onload = function load() {
	draw();
}

function draw(){
	var canvas = document.getElementById("canvas");
	var w = canvas.width - 100, h = canvas.height - 100;

	var a = {x : 0, y : 0};
	var b = {x : w, y : 0};
	var c = {
		x : Math.round(w/2),
		y : Math.round(w * Math.sqrt(3) / 2)};
	var middlepoint = {	
		x : c.x,
		y : Math.round(1/3 * c.y) };
	var corners = [a,b,c];
	
	var ctx = canvas.getContext("2d");
	var z = 10; 
	ctx.fillStyle = "black";
/*
	ctx.fillRect(a.x, a.y,z,z);
	ctx.fillRect(b.x, b.y,z,z);
	ctx.fillRect(c.x, c.y,z,z);
*/

	var randomCorner;
	for(var i = 0; i < 1000000; i++){
		randomCorner = corners[Math.floor(Math.random() * corners.length)];
		middlepoint = findmiddle(middlepoint, randomCorner);
		ctx.fillRect(middlepoint.x, middlepoint.y, 3, 3);
	}
}

function findmiddle(pointa, pointb){
	return {	x : Math.round((pointa.x + pointb.x) / 2),
				y : Math.round((pointa.y + pointb.y) / 2)
	};
}

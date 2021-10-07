connection(wroclaw, warszawa).
connection(wroclaw, krakow).
connection(wroclaw, szczecin).
connection(szczecin, lublin).
connection(szczecin, gniezno).
connection(warszawa, katowice).
connection(gniezno, gliwice).
connection(lublin, gliwice).

fconn(X, Y) :- 
	connection(X, Y);
	fconn(X, Z), connection(Z, Y).
	

%jesli miasto nie istnieje w zadnej 'lini komunikacyjnej' to program wpadnie w nieskoczona petle zamiast zwrocic "false".
% connection(wroclaw, lublin).
% connection(wroclaw, X).
% connection(X, Z); connection(Z, gliwice).
% bezposrednio + jedna + dwie.

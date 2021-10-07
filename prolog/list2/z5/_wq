%4V , 5V, 6X, 7V

%--------------------5-------------------
rev([],[]).
rev([H|T],L) :- rev(T,R), append(R,[H],L).


head(H,[H|_]).
%head(H,L) :- L = [H|_].

tail(T,[_|T]).
%tail(T,L) :- L = [_|T].

prefix([],_).
prefix([H|T1],[H|T2]) :- prefix(T1,T2).

last([H],H).
last([_|T],X) :- last(T,X).

init(L,T) :- last(L,X), select(X,L,T).

suffix(L,L).
suffix(X ,[_|TL]) :- suffix(X,TL).

%suffix(L,S) :- rev(L,RL), rev(S,RS), prefix(RS, RL).
% ??? czemu sie petli
%po daniu wszystkich wynikow? :(


%-----------------4----------------
%rev([H|T],L) :- rev(T,R), append(R,[H],L).

even(L) :- length(L,Len), 0 is mod(Len,2).

singleton([_]).

palindrom(L) :- rev(L,L). 

	

%----------------7--------------------


perm([],[]).
perm(L,[HP|TP]) :- select(HP,L,Y), perm(Y,TP). 
%erm(Xs,[Z|Zs]) :- select(Z,Xs,Ys), perm(Ys,Zs).

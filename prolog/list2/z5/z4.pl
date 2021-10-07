
rev([H|T],L) :- rev(T,R), append(R,[H],L).

even(L) :- length(L,Len), 0 is mod(Len,2).

singleton([_]).

rev([],[]).
rev([H|T],L) :- rev(T,R), append(R,[H],L).

palindrom(L) :- rev(L,L).


%---------------------------zad1
hinsert(X,L,[X|L]). 
hinsert(X,[H|T],[H|U]) :- hinsert(X,T,U).

permute([],[]). 
permute([H|T],L) :- permute(T,U), hinsert(H,U,L). 

%---------------------------zad2-------------------------------
count(_,[],0). % bazowa
count(X,[X|T],N) :- count(X,T,N2), N is N2 + 1. % jesli X jest na poczatku
count(X,[Y|T],N) :- X \= Y, count(X,T,N).	% jestli X nie jest na poczatku

exp(_,0,1).
exp(X,Y,Z) :- 	Y >= 1,
		Y1 is Y - 1, 
		exp(X,Y1,Z1),
		Z is Z1 * X.

filter([],[]).
filter([H|NT], [H|PT]) :- H > 0, filter(NT, PT).
filter([_|NT], PT) :- filter(NT, PT).
%------------------------zad3-----------------------------------
%????????????????????????????????????????? (1)
factorial(0,1).
factorial(1,1).
factorial(N,M) :- 	N1 is N - 1, 
			factorial(N1,M1),
			M is M1 * N. 

fac(N,F) :- 	fac(N,1,F).
fac(N,T,F) :- 	N > 0, 
		T1 is T * N, 
		N1 is N - 1, 
		fac(N1,T1,F).
fac(0,F,F).

concat_num(List, Num) :- concat_num(0, List, Num).
concat_num(Num, [], Num).
concat_num(N, [A|As], Num) :- 	N1 is N * 10 + A, 
				concat_num(N1, As, Num).

decimal(0, []).
decimal(N, [DH|DT]) :- 	N1 is floor(N/10), 
			DH is N mod 10, 
			decimal(N1,DT), !.

% czemu wiecej wynikow????????

%----------------------------zad4


%select_min([X],X,[]).
%select_min([H|T],Min,Rest) :- Min2 is H

min_in_list([M],M).             
min_in_list([H1,H2|T],M) :-
    H1 =< H2,                             
    min_in_list([H1|T],M).               
min_in_list([H1,H2|T],M) :-
    H1 > H2,                              
    min_in_list([H2|T],M).               


select_min(List,Min,Rest) :- 	min_in_list(List,Min),
				select(Min,List,Rest), !.


sel_sort([],[]).
sel_sort(L,[HS|TS]) :- select_min(L,HS,Rest), sel_sort(Rest,TS).

%----------------------------zad5

insert([],E,[E]).
insert([H|T], E, [E,H|T]) :- E =< H, !.
insert([H|T], E, [H|RT]) :- insert(T,E,RT).

ins_sort([],[]).
ins_sort([HL|TL],SL) :-ins_sort(TL,SL1), insert(SL1,HL,SL).
%--------------------------------zad6
%append_dl(Xs-Ys, Ys-Zs, Xs-Zs).


reverse(Xs, Ys) :-	reverse(Xs, [], Ys, Ys).
reverse([], Ys, Ys, []).
reverse([X|Xs], Rs, Ys, [_|Bound]) :- reverse(Xs, [X|Rs], Ys, Bound).



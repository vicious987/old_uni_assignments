/*deleteone(X,L1,L2) :- 	append(L3,[X|L2],L),
			append(L3,L2,L1).

insert(X,L1,L) :- delete(X,L,L1).

perm([],[]).
perm([X],[X]).
perm([HL|TL],P) :- perm(TL,PT), insert(HL,PT,P).

*/
/*
 concatenate([],L,L).
    
    concatenate([X|L1],L2,[X|L3]) :-
        concatenate(L1,L2,L3).
        
    delete(X,L,L1) :-
        concatenate(L3,[X|L2],L),
        concatenate(L3,L2,L1).
        
    insert(X,L1,L) :-
        delete(X,L,L1).
        
    permutation([X],[X]).
    
    permutation([X|T],L) :-
        permutation(T,T1),
        insert(X,T1,L).
*/

%---------------------------zad2-------------------------------
count(_,[],0). % bazowa
count(X,[X|T],N) :- count(X,T,N2), N is N2 + 1. % jesli X jest na poczatku
count(X,[Y|T],N) :- X \= Y, count(X,T,N).	% jestli X nie jest na poczatku
% dziala, ale daje 2 takie same wyniki a potem petli, ?  (1)
exp(_,0,1).
exp(X,Y,Z) :- 	Y1 is Y - 1, 
		exp(X,Y1,Z1),
		Z is Z1 * X.

filter([],[]).
filter([H|NT], [H|PT]) :- H > 0, filter(NT, PT).
%filter([_|NT], PT) :- filter(NT, PT).

%------------------------zad3-----------------------------------
%????????????????????????????????????????? (1)
factorial(0,1).
factorial(1,1).
factorial(N,M) :- 	N1 is N - 1, 
			factorial(N1,M1),
			M is M1 * N. 
%concant_num([],0).
%concant_num([HD|TD],Num) :- concat_num(TD,Num2), Num is Num2 + HD/Decimal_place.

%decimal(0,[]).
%decimal(N,[DH|DT]) :- N1 is N*10, DH is N, decimal(N1,DT).

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


























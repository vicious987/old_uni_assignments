%doprawic 4
%--------------------------------------------- zad1
appn([X],X). %jesli mamy jeden element, to naszym wynikiem bedzie ten element
appn([H1,H2|T],X):- % dodajmy do siebie dwa pierwsze elementy
	append(H1,H2,H),
	appn([H|T],X). % wsadzmy sume tych dwoch przed ogon, a potem dodajmy do siebie ta liste


%------------------------------------ 2
%double recursion - 165
%aby splaszczyc liste, najpierw splaszczmy jego pierwszy element, a potem jej ogon.

flat([],[]). %przypadek bazowy
flat([X|Xs],Ys):-
	flat(X,Ys1), %splaszczmy pierwszy.
	flat(Xs,Ys2), %splaszczmy ogon
	append(Ys1,Ys2,Ys). %polaczmy splaszczona glowe i ogon.

flat(X,[X]):-  %jesli mamy tylko jeden element do splaszczenia to przerobmy go na  
	atomic(X), % liste jednoelementowa ktora potem zappendujemy
	X \= []. % odroznijmy go od przypadku bazowego
% rozwiazanie proste, ale wolne
% using a stack - 166
constant(X) :- atomic(X).
flatten(Xs,Ys) :- flatten(Xs,[],Ys).
flatten([X|Xs],S,Ys) :- 
	list(X),
	flatten(X,[Xs|S],Ys).

flatten([X|Xs],S,[X|Ys]) :- 
	constant(X), 
	X \= [],
	flatten(Xs,S,Ys).

flatten([],[X|S],Ys) :-
	flatten(X,S,Ys).

flatten([],[],[]).

list([X|Xs]).


%--------------------------------------------- zad 3
halve(List, Left, Right):-
	halve(List, List, Left, Right).

halve([Head|Tail], [_,_|Bound], [Head|Left], Right):- % w kazdym kroku "usuwamy" 2 elementy z listy
	halve(Tail, Bound, Left, Right). % dodajac glowe do L

% gdy usunelismy wszystkie lub jeden ( parzyssta ilosc elementow lub nieparzysta)
halve(Right, [], [], Right):-  
	!.
% to wiemy ze przeszlismy przez polowe listy, wiec mozemy druga polowe przeniesc do Right
halve(Right, [_], [], Right):-
	!.

%------------------------------------------- zad 4
merge([], List, List):-
	!.
merge(List, [], List):-
	!.
merge([Head1|Tail1], [Head2|Tail2], [Head1|Merged]):- %jesli pierwszy element z L1 jest mniejszarowny drugiemu, to dodajemy do wyniku
	Head1 =< Head2,
	!, %???????????????????????? sprobujmy bez !
	merge(Tail1, [Head2|Tail2], Merged). % i mergujemy dalej, pamijajac ten element ktory dodalismy
merge([Head1|Tail1], [Head2|Tail2], [Head2|Merged]):-  %jesli pierrwszy element L1 jest mniejszy,to dajemy pierwszy z L2 i 
	merge([Head1|Tail1], Tail2, Merged). % mergujemy dalej, pomijajac ten ktory dodalismy

% mergesort(List, Sorted).
mergeSort([X],[X]):- !. %przypadek bazowy // sprobujmy bez !
mergeSort(List,Sorted):-
	halve(List,Left,Right), % podzielmy ja na dwie polowki
	mergeSort(Left, SortedLeft),  % posortujmy lewa
	mergeSort(Right,SortedRight), % posortujmy prawa
	merge(SortedLeft, SortedRight,Sorted). % polaczmy te dwie posortowane polowki





%------------------------------------- zad 7
%split(+List, +Med, -Small, -Big)
split([], _, [], []). %przypadek bazowy
split([H|Tail], Pivot, [H|Small], Big) :- 
	H < M,  % jesli H mniejsze niz M, to dodajemy do Small
	!, %?
	split(Tail, Pivot, Small, Big). %lecimy z reszta listy

split([H|Tail], Pivot, Small, [H|Big]) :- % WPP H dodajemy do Big
	split(Tail, Pivot, Small, Big).

qsort(List, Sorted) :-
	qsort(List, Sorted, []).
qsort([], A, A).
qsort([H|Tail], Sorted, Acc) :-
	split(Tail, H, Left, Right), 	% rozdzielmy liste na 2 podlisty, jedna < H, druga >= H 
	qsort(Left, Sorted, [H|Acc1]),	%
	qsort(Right, Acc1, Acc). 	%

quick_sort2(List,Sorted):-q_sort(List,[],Sorted).
q_sort([],Acc,Acc).
q_sort([H|T],Acc,Sorted):-
	pivoting(H,T,L1,L2),
	q_sort(L1,Acc,Sorted1),q_sort(L2,[H|Sorted1],Sorted)
%	CZYTAJ STRONE 90 

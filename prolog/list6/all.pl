% fixnij 2,4
%--1

% Stos w Prologu
put_S(E, L, [E|L]).	% dodajemy nowy element na poczatek listy
get_S([H|T], H, T).	% usuwamy pierwszy element z listy
empty_S([]).

addall_S(E, G, S, R):-
	findall(E, G, L),	% znajdz wszystkie takie E, żę spełnia G i umieść w L
	append(L, S, R). 	% dodaj L na początek S - dostajemy nowy stos R

% Kolejka w Prologu (na listach różnicowych)

empty(X-X).
get([H|T]-X,H,T-X).

snoc(X-[E|Y],E,X-Y).
put(L, E, S) :- 
	snoc(L, E, S).

addAll(E,G,X-Y,X-Z):-
	findall(E,G,Y,Z).

/*
--2
dla stosu
put(E,S,[E|S]).
get([H|T],H,T).
empty([]).

addall(Element, Goal, Stack, Rest):-
  findall(Element, Goal, List),
  putall(List, Stack, Rest).

putall([],Rest,Rest).
putall([Head|Tail],Stack,Rest):-
  put(Head,Stack,NewStack),
  putall(Tail,NewStack,Rest).


%graph
droga(_, _, Res,[], Res).
droga(Poczatek, Koniec, Bylem, Sasiedzi, Res):- %dokoncz
	

	*/
%--3
/*
insert(leaf, Value, node(leaf, Value, leaf)).
insert(node(Left, NValue, Right), Value, node(Left, NValue, InsertedRight)):-
	Value > NValue,
	insert(Right, Value, InsertedRight).
insert(node(Left, NValue, Right), Value, node(InsertedLeft, NValue, Right)):-
	Value < NValue,
	insert(Left, Value, InsertedLeft).
*/

% zadanie 3!
insert(Value,leaf, node(leaf,Value,leaf)).
insert(NewValue, node(Left,Value,Right), node(NewLeft, Value, Right)) :-
	NewValue < Value,
	insert(NewValue, Left, NewLeft).
insert(NewValue, node(Left,Value,Right), node(Left, Value, NewRight)) :-
	NewValue > Value,
	insert(NewValue, Right, NewRight).
	


find(Element, node(_, Value, _)):-
	Element == Value.
find(Element, node(Left, Value, _)):-
	Element < Value,
	find(Element, Left).
find(Element, node(_, Value, Right)):-
	Element > Value,
	find(Element, Right).

findmax(node(_, Value, leaf), Value).
findmax(node(_,_,Right), Max) :-
	findmax(Right,Max).

findmin(node(leaf, Value, _), Value).
findmin(node(Left,_,_), Min) :-
	findmin(Left,Min).

emptytree(leaf).

delete(_, leaf, leaf). %usuniecie czegos z pustego drzewa da nam drzewo puste
delete(Value,node(leaf,Value,leaf), leaf):-!. % usuwanie z drzewa 1 elementowego
delete(Value,node(Left,Value,leaf), Left):-!. % usuwanie korzenia
delete(Value,node(leaf,Value,Right),Right):-!.% usuwanie korzenia
delete(Value, node(Left,Value,Right), node(Left,RightMin,RightWithoutMin)):-
	findmin(Right, RightMin),
	delete(RightMin,Right,RightWithoutMin),	
	!.
%gdy usuwamy z korzen z drzewa ktory ma lewe i prawe podrzewo niepuste, to zamieniamy korzen
%za min z Right, usuwamy min z Right
%
%
delete(Element,node(Left,Value,Right),node(ResLeft,Value,Right)):-
	Element < Value,
	delete(Element,Left,ResLeft).

delete(Element,node(Left,Value,Right),node(Left,Value,ResRight)):-
	Element > Value,
	delete(Element,Right,ResRight).

/*
wariacje(Len,List,Acc,[H|Acc]):-
	Len=1,!,
	member(H, List).
wariacje(Len,List,Acc,Res):-
	member(H,List),
	Len1 is Len-1,
	wariacje(Len1, List, [H|Acc], Res).

wariacje(Len, List, Res):-
	wariacje(Len, List, [], Res).

decimal(L,W):-
	decimal(L,[],W).
decimal(0, Acc, Res):-
  !,
  Acc = Res.
decimal(Num, Acc, Res):-
  CurrentDigit is Num mod 10,
  NewNum is Num // 10,
  decimal(NewNum, [CurrentDigit|Acc], Res).

cn(D,N):-
	cn(D,0,X),
	N is X.
cn([],X,X).
cn([H|T],Acc,Res):-
	Acc1=10*Acc+H,
	cn(T,Acc1,Res).



zgodneZeSchematem([Cyfra],[c]):-
	member(Cyfra,[1,3,5,7,9]),!.
zgodneZeSchematem([Cyfra],[s]):-
	member(Cyfra,[0,2,4,6,8]),!.

zgodneZeSchematem([Cyfra|Reszta],[c|T]):-
	member(Cyfra,[1,3,5,7,9]),
	zgodneZeSchematem(Reszta,T),!.

zgodneZeSchematem([Cyfra|Reszta],[s|T]):-

	    member(Cyfra,[0,2,4,6,8]),
	    zgodneZeSchematem(Reszta,T),!.

zgodne(Liczba,Wzor):-
	decimal(Liczba,Lista),
	zgodneZeSchematem(Lista,Wzor).


program([P,D|T], Wynik):-
	length(P,LenP),
	length(D, LenD),
	wariacja(LenP). %asd 

*/




	
	


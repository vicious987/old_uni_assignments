male(adam).
male(john).
male(mark).
male(joshua).
male(david).

female(eve).
female(helen).
female(ivonne).
female(anna).

parent(adam,helen).
parent(adam,ivonne).
parent(adam,anna).

parent(eve,helen).
parent(eve,ivonne).
parent(eve,anna).

parent(john,joshua).
parent(helen,joshua).

parent(ivonne,david).
parent(mark,david).

sibling(X,Y) :-
	(male(F), parent(F,X), parent(F,Y)), % F jak Father
	(female(M), parent(M,X), parent(M,Y)),
	X \= Y.

sister(X,Y) :-
	female(X),
	sibling(X,Y).

grandson(X,Y) :-
	male(X),
	parent(X,Z), parent(Z,Y).

descendant(X,Y) :-
	parent(Y,X);
	parent(Z,X), descendant(Z,Y). 

is_mother(X) :-
	female(X),
	parent(X,_).

is_father(X) :-
	male(X),
	parent(X,_).

cousin(X,Y) :-
	male(X), parent(Z,X),
	sibling(Z,A), parent(A,Y).

% descendant(john, mark).
% descendant(X, adam).
% sister(ivonne, X).
% cousin(X,Y).
% NARYSUJ DRZEWA POSZUKIWAN!


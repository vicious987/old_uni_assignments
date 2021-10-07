%-----------------------1--------------------------
bird(b1).
bird(b2).
worm(w1).
worm(w2).
fish(f1).
fish(f2).
cat(my_cat).

likes(X,Y) :-
	bird(X),
	worm(Y).

likes(X,Y) :-
	cat(X),
	fish(Y).

%przyjaciele lubia sie nawzajem!
likes(X,Y) :- 
	friends(X, Y),
	friends(Y, X).

friends(me,my_cat).
friends(my_cat,me).

eats(my_cat, X) :-
	likes(my_cat,X).

%eats(my_cat, X).

%-----------------------2---------------------------

unhappy(X):-
	dragon(X),
	lives_at(X,zoo).

happy(X):-
	meets(H),
	human(H), 
	nice(H).

nice(X) :-
	human(X),
	visits(X,zoo).

meets(X,Y) :-
	animal(X),
	human(Y),
	lives_at(X,zoo),
	visits(Y,zoo).

		
%zaden smok nie mieszkaw  w zoo:
% animal(X) :- dragon(X).
% human(wojtek). ??
% happy(X) :- not unhappy(X).
% smok jest zwierzem. istnieje czlowiek ktory chodzi do zoo, wiec
% smok spotyka czlowieka ktory jest nice( bo chodzi do zoo), zatem smok jest happy
% zatem smok jest happy i unhappy (sprzecznosc)

%------------------------------3--------------------------------

mortal(X) :- human(X).

human(socrates).
% ?- mortal(socrates).


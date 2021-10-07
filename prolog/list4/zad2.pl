%
/*
edge(a,b).
edge(a,c).
edge(a,d).
edge(a,e).
edge(d,j).
edge(c,f).
edge(c,g).
edge(f,h).
edge(e,k).
edge(f,i).
edge(x,y).
edge(y,z).
edge(z,x).
edge(y,u).
edge(z,v).
*/


edge(a,b).
edge(b,c).
edge(c,e).
edge(c,d).
edge(d,e).
edge(b,f).
edge(f,g).
edge(g,h).
edge(h,i).
edge(i,f).

%------------------------------------------zad 2
bedge(Y,X) :- edge(X,Y).

path(From,To,Path) :- path_h(To,From,Path).

%aby odnalezc droge z From do To, przejdzmy przez ten graf wglab
%do tego bedziemy potrzebowac liste Visited - z From -V- na samym poczatku
path_h(From, To, Path) :-	travel(From, To, [From], Path). 

% edge(To, From), edge(X,From).
travel(From, To, Visited, [To|Visited]) :- bedge(From, To). 	%jezeli sa polaczane krawedzia, poprostu dodamy cel do tego co juz przeszlismy 
 
travel(From, To, Visited, Path) :-	bedge(From, X), 	%WPP, jest sobie jaki X ktory jest sasiadem From           
					X \== To,		% X to nie jest To!
					\+member(X, Visited), 	% X jest czyms czego jeszcze nie odwiedzilismy
					travel(X, To, [X|Visited], Path). %znajdzmy droge z X do To, dodajmy X do odwiedzonych



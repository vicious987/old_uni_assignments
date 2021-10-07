%
%--------------------------------------zad 1			
len([], 0).
len([_|T], N) :- 	integer(N),	%abysmy mogli porownac z 0  // to znaczy ze argument np X 3
			N > 0,		%bo jesli damy -3 to bedziemy schodzic do -4 -5 -6 i tak w nieskonczosc 
			len(T, X),  
			N is 1 + X,!. 	% bo chcemy uzyskac jeden wynik 

len([_|T], N) :- len(T,X), N is 1 + X.

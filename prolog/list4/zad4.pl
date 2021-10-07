%

%node(T1,N,T2).
%------------------------------------zad  4

%kazde dwa poddrzewa zamieniamy miejscami
mirror(leaf,leaf).
mirror(node(Left, X, Right), node(Left_Mirror, X, Right_Mirror)) :- 	mirror(Left, Right_Mirror),
									mirror(Right, Left_Mirror).
flatten(leaf, []).
flatten(node(Left, X, Right) , Tree_list) :- 	flatten(Left, Left_subtree_list),
						flatten(Right, Right_subtree_list),
						append(Left_subtree_list, [X|Right_subtree_list] , Tree_list).

%------------------------------------zad 5
add(X, leaf, node(leaf,X,leaf)).					%przypadek bazowy
add(X, node(L,Root,R), node(L1,Root,R)) :- X =< Root, add(X,L,L1).	%jesli mniejszrowny, to do lewego poddrzewa
add(X, node(L,Root,R), node(L,Root,R1)) :- X > Root, add(X,R,R1).	% wpp prawe

%dodajmy glowe listy do drzewa base_tree (inicjowanego drzewem pustym),
%dopoki lista jest pusta
list_to_bst(L,T) :- list_to_bst(L,leaf,T).
list_to_bst([],T,T).
list_to_bst([H|Tail], Base_t, Tree) :- 	add(H, Base_t, New_base_t),
					list_to_bst(Tail, New_base_t, Tree).

tree_sort(List, Sorted_list) :- list_to_bst(List,BST), flatten(BST,Sorted_list). 


% COMP3071 - LA4

/********************************************
** define your three predicates below here **
********************************************/
/* Using predicates married/2, sibling/2, and male/1, write a rule brotherInLaw/2 to tell if someone is a brother-in-law. A person is your brother in law either if they are a brother of someone you are married to, or if they are male and married to one of your siblings. See the following knowledge base for argument ordering: */
sibling(jeff, tina). 
married(jeff, mark).
married(mitch, tina).
male(mark).
male(mitch).
male(jeff).


% brotherInLaw(mark, tina). will be true

% I implemented these backwards if youre wondering why its y, x
% Brother of someone you are married to 
brotherInLaw(Y, X) :- male(Y), (sibling(X, Z); sibling(Z, X)), (married(Y, Z); married(Z, Y)).
% if they are male and married to one of your siblings.
brotherInLaw(Y, X) :- male(Y), (married(Y, Z); married(Z, Y)), (sibling(Z, X); sibling(X, Z)).

% member predicate that is from the notes
member(X, [X|_]).
member(X, [_|T]) :- member(X,T).
/* Write a uniques/2 rule that finds all of the unique elements in a list. The first argument should be an input list and the second argument is the return value. The query uniques([4, 2, ana, 5, 2, cat, ana], L). should result in L = [4, 5, cat]. */ 
uniques([],[]).
uniques([H|T], R) :- member(H, T), remove(T, H, X), uniques(X, R).
uniques([H|T], [H|R]) :- uniques(T, R).

% Helper to remove all elements E from the list returned in R
remove([], _,[]).
remove([E|T], E, R) :- remove(T, E, R).
remove([H|T], E, [H|R]) :- remove(T, E, R). 

/* The holes/2 rule should have an input as the first argument that is a list of integers, and an output that is all of the holes in the list. The built-in predicate sort/2 will probably be very handy. As some examples, holes([1, 3, 5], X). should yield X = [2, 4]. holes([5, 1], Y). should be Y = [2, 3, 4]. */
holes([], []).
holes(L, R) :- sort(L, [H|T]), holes_(H, T, R). 

holes_(_, [], []).
holes_(H, [C|T], R) :- succ(H, C), holes([C|T], R). 
holes_(H, [C|T], [X|R]) :- succ(H, X), holes_(X, [C|T], R).

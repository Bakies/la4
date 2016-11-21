% COMP3071 - LA4

/********************************************
** define your three predicates below here **
********************************************/
/* Using predicates married/2, sibling/2, and male/1, write a rule brotherInLaw/2 to tell if someone is a brother-in-law. A person is your brother in law either if they are a brother of someone you are married to, or if they are male and married to one of your siblings. See the following knowledge base for argument ordering: */
sibling(jeff, tina). 
married(jeff, mark).
male(mark).
% brotherInLaw(mark, tina). will be true

% I implemented these backwards if youre wondering why its y, x
% Brother of someone you are married to 
brotherInLaw(X, Y) :- male(Y), (sibling(X, Z); sibling(Z, X)), (married(Y, Z); married(Z, Y)).
% if they are male and married to one of your siblings.
brotherInLaw(X, Y) :- male(Y), (married(Y, Z); married(Z, Y)), (sibling(Z, X); sibling(X, Z)).

/* Write a uniques/2 rule that finds all of the unique elements in a list. The first argument should be an input list and the second argument is the return value. The query uniques([4, 2, ana, 5, 2, cat, ana], L). should result in L = [4, 5, cat]. */ 
uniques(X, Y) :- Z



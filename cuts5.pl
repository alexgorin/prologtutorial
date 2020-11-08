/**
Define a predicate unifiable(List1,Term,List2)
where List2 is the list of all members of List1 that unify with Term.

unifiable([X,b,t(Y)],t(a),List)
should yield
           List  =  [X,t(Y)].

*/
unifiable(List, Term, Result) :-
  /**reverse(Result, ReversedResult),*/
  accUnifiable(List, Term, Result, []).

accUnifiable([], _, Acc, Acc).
accUnifiable([H|T], Term, R, Acc) :- \+ H = Term, !, accUnifiable(T, Term, R, Acc).
accUnifiable([H|T], Term, R, Acc) :- \+ \+ H = Term, !, accUnifiable(T, Term, R, [H|Acc]).

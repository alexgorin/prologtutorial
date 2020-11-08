/**is_member(_, []) :- fail.*/
is_member(Elem, [Elem|_]).
is_member(Elem, [_|T]) :- \+T=[],is_member(Elem, T).

subsetAcc([], _, _).
/**subsetAcc([H|[]], List) :-
  is_member(H, List).
*/

subsetAcc([H|T], List, AlreadyAdded) :-
  is_member(H, List),
  not(is_member(H, AlreadyAdded)),
  subsetAcc(T, List, [H|AlreadyAdded]).

subset(X, List) :- subsetAcc(X, List, []).

powerset(List, PowerSet) :- findall(X, subset(X, List), PowerSet).

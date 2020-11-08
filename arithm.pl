inc(A, B) :- B is A+1.
sum(A, B, Sum) :- Sum is A + B.

addone([], []).
addone([H|T], [H1|T1]) :- H1 is H+1, addone(T, T1).

accScalarmul(_, [], Acc, Acc).
accScalarmul(Num, [H|T], Acc, R) :-
  NewElem is H * Num,
  append(Acc, [NewElem], NewAcc),
  accScalarmul(Num, T, NewAcc, R).

scalarmul(Num, Vec, R) :- accScalarmul(Num, Vec, [], R).

accDot([], [], Acc, Acc).
accDot([H1|T1], [H2|T2], Acc, R) :-
  NewAcc is Acc + H1 * H2,
  accDot(T1, T2, NewAcc, R).

dot(Vec1, Vec2, R) :- accDot(Vec1, Vec2, 0, R).

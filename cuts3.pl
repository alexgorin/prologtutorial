directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

hasTrain(X, Y) :- directTrain(X, Y);directTrain(Y, X).

accRoute(T1, T2, [T1, T2], _) :- hasTrain(T1, T2).
accRoute(T1, T2, [T1,H|T], Visited) :-
  hasTrain(T1, H),
  \+ member(H, Visited),
  accRoute(H, T2, [H|T], [T1|Visited]).

route(T1, T2, Path) :- accRoute(T1, T2, Path, [T2]).

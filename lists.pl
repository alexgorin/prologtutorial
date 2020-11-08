member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

second(X, [_,X|_]).

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([], []).
listtran([H1|T1],[H2|T2]) :-
  tran(H1, H2),listtran(T1, T2);
  tran(H2, H1),listtran(T2, T1).

twice([], []).
twice([H1|T1],[H1,H1|T2]) :- twice(T1, T2).

combine1(X, [], X).
combine1([], X, X).
combine1([H1|T1], [H2|T2], [H1,H2|T3]) :- combine1(T1, T2, T3).

combine2(_, [], []).
combine2([], _, []).
combine2([H1|T1], [H2|T2], [[H1,H2]|T3]) :- combine2(T1, T2, T3).

combine3(_, [], []).
combine3([], _, []).
combine3([H1|T1], [H2|T2], [j(H1,H2)|T3]) :- combine3(T1, T2, T3).

len([], 0).
len([_|T], L) :- len(T, L_tail), L is L_tail+1.

accLen([], Acc, Acc).
accLen([_|T], Acc, L) :-  Acc_tail is Acc+1, accLen(T, Acc_tail, L).

accMax([], Max, Max).
accMax([H|T], MaxSoFar, Max) :- H =< MaxSoFar, accMax(T, MaxSoFar, Max).
accMax([H|T], MaxSoFar, Max) :- H > MaxSoFar, accMax(T, H, Max).
max(L, M) :- L = [_|_], accMax(L, 0, M).

accReverse([], A, A).
accReverse([H|T], A, R) :- accReverse(T, [H|A], R).
reverse(L, R) :- accReverse(L, [], R).

/*
accSplit(L, 0, A, R1, L) :- R1 = reverse(A).
accSplit([H|T], N, A, R1, R2) :- Nnext is N-1, accSplit(T, Nnext, [H|A], R1, R2).
split(L, N, R1, R2) :- accSplit(L, N, [], R1, R2).
*/
split(L, N, R1, R2) :- len(R1, N), append(R1, R2, L).

doubled(L) :- append(FirstHalf, SecondHalf, L), FirstHalf = SecondHalf.

palindrome(L) :- reverse(L, L).

toptail([_|T], R) :- append(R, [_], T).

last(L, X) :- reverse(L, [X|_]).

swapfl([H1|T1], [H2|T2]) :-
  toptail([H1|T1], X),
  toptail([H2|T2], X),
  last(T2, H1),
  last(T1, H2).

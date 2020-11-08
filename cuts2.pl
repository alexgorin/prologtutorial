accSplit([], P, N, P, N).
accSplit([H|T], P, N, Acc1, Acc2) :- H >= 0, !, accSplit(T, P, N, [H|Acc1], Acc2).
accSplit([H|T], P, N, Acc1, Acc2) :- H < 0, !, accSplit(T, P, N, Acc1, [H|Acc2]).

split(X, P, N) :- reverse(X, XR),accSplit(XR, P, N, [], []).

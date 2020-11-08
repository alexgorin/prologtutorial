/** sum 1 to n with caching */

:- dynamic sigmaCache(_, _).
sigmaAcc(1, Sum, Acc) :- Sum is Acc + 1,!.
sigmaAcc(N, Sum, Acc) :- sigmaCache(N, CachedSum),!,Sum is Acc + CachedSum.
sigmaAcc(N, Sum, Acc) :-
  NewAcc is N + Acc,
  PrevN is N - 1,
  sigmaAcc(PrevN, Sum, NewAcc).

sigma(N, Sum) :- sigmaAcc(N, Sum, 0), assert(sigmaCache(N, Sum)).

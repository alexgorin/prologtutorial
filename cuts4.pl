/**
# 'nu' - non-unifiable
nu(X, Y) :- \+ X = Y.

nu(X, Y) :- X = Y, !, fail.
nu(X, Y).

*/
nu(X, X) :- !,fail.
nu(X, Y).

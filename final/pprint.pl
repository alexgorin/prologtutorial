:- module(pprint, [pprint/1, pprint/2]).

pprint_each(_, [], _).

pprint_each(OutStream, [H|[]], Prefix) :- pprintAcc(OutStream, H, Prefix).

pprint_each(OutStream, [H|T], Prefix) :-
  pprintAcc(OutStream, H, Prefix),
  write(OutStream, ','),nl(OutStream),
  pprint_each(OutStream, T, Prefix).

pprintAcc(OutStream, X, Prefix) :-
  (atomic(X);is_list(X)),
  write(OutStream, Prefix),
  write(OutStream, X).

pprintAcc(OutStream, X, Prefix) :-
  functor(X, _, _),
  X  =..  [F|Args],
  concat(Prefix, '  ', NewPrefix),
  write(OutStream, Prefix),write(OutStream, F),write(OutStream, '('),nl(OutStream),
  pprint_each(OutStream, Args, NewPrefix),nl(OutStream),
  write(OutStream, Prefix),write(OutStream, ')').

pprint(OutStream, X) :- pprintAcc(OutStream, X, '').

pprint(X) :- pprint(user_output, X).

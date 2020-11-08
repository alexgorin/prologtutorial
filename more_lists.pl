

accSet([], Acc, Acc).
accSet([H|T], S, Acc) :- member(H, Acc), accSet(T, S, Acc).
accSet([H|T], S, Acc) :-
  not(member(H, Acc)),
  append(Acc, [H], NewAcc),
  accSet(T, S, NewAcc).
set(L, S) :- accSet(L, S, []).

flattenAcc([], Acc, Acc).
flattenAcc([HL|TL], Flat, Acc) :-
  is_list(HL),
  flattenAcc(HL, FlattenedElem, []),
  append(Acc, FlattenedElem, NewAcc),
  flattenAcc(TL, Flat, NewAcc).
flattenAcc([HL|TL], Flat, Acc) :-
  not(is_list(HL)),
  append(Acc, [HL], NewAcc),
  flattenAcc(TL, Flat, NewAcc).

flatten(List, Flat) :- flattenAcc(List, Flat, []).

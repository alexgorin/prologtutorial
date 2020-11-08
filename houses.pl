color(red).
color(blue).
color(green).

nationality(english).
nationality(spanish).
nationality(japanese).

pet(jaguar).
pet(snail).
pet(zebra).

has_all_different_elements(L) :- list_to_set(L, S),length(L) == length(S).

consists_of_colors([H|[]]) :- color(H).
consists_of_colors([H|T]) :- color(H),consists_of_colors(T).

consists_of_nationalities([]).
consists_of_nationalities([H|T]) :- nationality(H),consists_of_nationalities(T).

consists_of_pets([]).
consists_of_pets([H|T]) :- pet(H),consists_of_pets(T).

colors(C) :- length(C, 3),consists_of_colors(C),has_all_different_elements(C).
nationalities(N) :- length(N, 3),consists_of_nationalities(N),has_all_different_elements(N).
pets(P) :- length(P, 3),consists_of_pets(P),has_all_different_elements(P).

acc_list_index(E, [E|_], Acc, Acc).
acc_list_index(E, [_|T], Acc, Index) :- NewAcc is Acc+1, acc_list_index(E, T, NewAcc, Index).
index_of(E, L, Index) :- acc_list_index(E, L, 0, Index).

same_index(E1, L1, E2, L2) :- index_of(E1, L1, Index),index_of(E2, L2, Index).
left_of(E1, L1, E2, L2) :- index_of(E1, L1, I1),index_of(E2, L2, I2),I1 < I2.
right_of(E1, L1, E2, L2) :- left_of(E2, L2, E1, L1).

solution(C, N, P) :-
  colors(C),nationalities(N),pets(P),
  same_index(red, C, english, N),
  same_index(jaguar, P, spanish, N),
  left_of(snail, P, blue, C),
  right_of(japanese, N, snail, P).

has_zebra(Nationality) :- solution(_, N, P), same_index(zebra, P, Nationality, N).

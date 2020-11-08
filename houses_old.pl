nth([H|_], 0, H).
nth([_|T], N, E) :- NNext is N - 1, nth(T, NNext, E).

equal_elements(List1, List2) :-
    sort(List1, Sorted1),
    sort(List2, Sorted2),
    Sorted1 == Sorted2.

/**
houses([h1, h2, h3]).
house(H) :- houses(Houses), member(H, Houses).
*/

colors([red, blue, green]).
color(C) :- colors(Colors), member(C, Colors).

nationalities([english, spanish, japanese]).
nationality(N) :- nationalities(Nationalities), member(N, Nationalities).

pets([jaguar, snail, zebra]).
pet(P) :- pets(Pets), member(P, Pets).


house([C, N, P]) :- color(C),nationality(N),pet(P).

color(H, C) :- house(H),color(C),nth(H, 0, C).
nationality(H, N) :- house(H),nationality(N),nth(H, 1, N).
pet(H, P) :- house(H),pet(P),nth(H, 2, P).

houses([H1, H2, H3]) :- house(H1),house(H2),house(H3).

/** different_colors(Houses) :-  */

leftOfInList(X, Y, [X|_]) :- Y \== X.
leftOfInList(X, Y, [H|T]) :-
  Y \== H,
  leftOfInList(X, Y, T).

leftOf(X, Y) :- houses(Houses),leftOfInList(X, Y, Houses).
rightOf(X, Y) :- leftOf(Y, X).

member([red, english, _], Houses) :- houses(Houses).

/**
color(H, red) :- nationality(H, english).
pet(H, jaguar) :- nationality(H, spanish).
pet(H, snail) :- leftOf(H, H2), color(H2, blue).
nationality(H, japanese) :- rightOf(H, H2), pet(H2, snail).
*/

/**zebra(H) :-  */

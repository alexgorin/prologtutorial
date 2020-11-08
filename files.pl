houses() :-
  open('houses.txt', write, F),
  tab(F, 5),write(F, gryffindor),nl(F),
  write(F, hufflepuff),tab(F, 5),write(F, ravenclaw),nl(F),
  tab(F, 5),write(F, slytherin),nl(F),
  close(F).

readWord(InStream,W):-
         get_code(InStream,Char),
         checkCharAndReadRest(Char,Chars,InStream),
         atom_codes(W,Chars).
checkCharAndReadRest(10,[],_):-  !.
checkCharAndReadRest(32,[],_):-  !.
checkCharAndReadRest(-1,[],_):-  !.
checkCharAndReadRest(end_of_file,[],_):-  !.
checkCharAndReadRest(Char,[Char|Chars],InStream):-
     get_code(InStream,NextChar),
     checkCharAndReadRest(NextChar,Chars,InStream).

:- dynamic wordCount/2.

addWord(W) :-
  wordCount(W, Count),!,
  NewCount is Count + 1,
  retract(wordCount(W, Count)),
  assert(wordCount(W, NewCount)).

addWord(W) :-
  \+ wordCount(W, _),
  assert(wordCount(W, 1)).


readWords(F) :- at_end_of_stream(F),!.
readWords(F) :-
  readWord(F, W),
  addWord(W),
  readWords(F).

wordCounts(FileName) :-
  open(FileName, read, F),
  readWords(F),
  close(F).

getWordCounts(Counts) :- findall(
  [W, Count],
  bagof(X, wordCount(W, Count), R),
  Counts
).

:-[pprint,dcg,read_words].

recordsSeparator("=======").

strip(Str, Result) :- split_string(Str, "", " \s\t\n", Result).

parseSentence(SentenceStr, AST) :-
  split_string(Sentence, " ", " \s\t\n", Words),
  s(AST, [], Sentence).

parseTestFile() :-at_end_of_stream(F),!.

parseSentenceFromFile(InStream, AST) :-
  read_line_to_string(InStream, SentenceStr),
  parseSentence(SentenceStr, AST).

parseASTFromFileAcc(InStream, ASTStr, Acc) :-
  read_line_to_string(InStream, ASTLine),
  recordsSeparator(ASTLine),
  atomics_to_string(Acc, '', ASTStr).

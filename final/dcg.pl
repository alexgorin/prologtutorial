:- module(dcg, [s/3]).

s(s(NP, VP))  -->  np(NP, SP, _),vp(VP, SP).

/**
SP - singular or plural
SO - subject or object
prep - preposition
pp - prepositional phrase
*/

adj_noun(adj_noun(N), SP) --> n(N, SP).
adj_noun(adj_noun(ADJ, ADJ_NOUN), SP) -->
  adj(ADJ),adj_noun(ADJ_NOUN, SP).

simple_np(simple_np(ADJ_NOUN), SP, _)  -->  adj_noun(ADJ_NOUN, SP).
simple_np(simple_np(DET, ADJ_NOUN), SP, _)  -->  det(DET),adj_noun(ADJ_NOUN, SP).
simple_np(simple_np(PRO), SP, SO)  -->  pro(PRO, SP, SO).

pp(pp(P, PRO)) --> prep(P),pro(PRO, _, object).
pp(pp(P, SIMPLE_NP)) --> prep(P),simple_np(SIMPLE_NP, _, SO),{not(SO == subject)}.

np(np(SIMPLE_NP), SP, SO) --> simple_np(SIMPLE_NP, SP, SO).
np(np(SIMPLE_NP, PP), SP, SO) --> simple_np(SIMPLE_NP, SP, SO),pp(PP).

vp(vp(V, NP), SP)  -->  v(V, SP),np(NP, _, _).
vp(vp(V), SP)  -->  v(V, SP).


det(det(Word))  -->  [Word],{lex(Word, det, _, _, _)}.
n(n(Word), SP)  -->  [Word],{lex(Word, n, SP, _, _)}.
v(v(Word), SP)  -->  [Word],{lex(Word, v, SP, _, _)}.
pro(pro(Word), SP, SO)  -->  [Word],{lex(Word, pro, SP, SO, _)}.
adj(adj(Word))  -->  [Word],{lex(Word, adj, _, _, _)}.
prep(prep(Word))  -->  [Word],{lex(Word, prep, _, _, _)}.

lex(a, det, _, _, _).
lex(the, det, _, _, _).

lex(woman, n, singilar, _, _).
lex(man, n, singilar, _, _).
lex(men, n, plural, _, _).
lex(apple, n, singilar, _, _).
lex(pear, n, singilar, _, _).

lex(eat, v, plural, _, _).
lex(eats, v, singilar, _, _).

lex(he, pro, singilar, subject, third_person).
lex(him, pro, singilar, object, third_person).
lex(she, pro, singilar, subject, third_person).
lex(her, pro, singilar, object, third_person).
lex(they, pro, plural, subject, third_person).
lex(them, pro, plural, object, third_person).

lex('I', pro, singilar, subject, first_person).
lex(we, pro, plural, subject, first_person).
lex(me, pro, singilar, object, first_person).
lex(us, pro, plural, object, first_person).

lex(you, pro, singilar, subject, second_person).
lex(you, pro, singilar, object, second_person).

lex(big, adj, _, _, _).
lex(small, adj, _, _, _, _).

lex(on, prep, _, _, _, _).
lex(under, prep, _, _, _, _).

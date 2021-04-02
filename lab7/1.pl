readStr(A) :-
  get0(X),
  readS(X, A, []).
readS(10, A, A) :- !.
readS(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  readS(X1, A, B1).

writeStr([]):-!.
writeStr([H|T]):-write(H),writeStr(T).

countN([], Count, Count) :- !.
countN([_|T], CurCount, Count) :-
  CurCount1 is CurCount + 1,
  countN(T, CurCount1, Count).
countN(List, Count) :- countN(List, 0, Count).


% 1.Дана строка. Вывести ее три раза через запятую и показать количество
% символов в ней.

pr1:-
	readStr(A),
	writeStr(A),nl,writeStr(A),nl,writeStr(A).



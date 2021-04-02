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



% 1.Дана строка. Вывести ее три раза через запятую и показать количество
% символов в ней.

pr1:-
	readStr(A),
	writeStr(A),nl,writeStr(A),nl,writeStr(A).
%2 Дана строка. Найти количество слов.
numbWords([],_,Count):-Count is 1,!.

numbWords([H|T],CurCount,Count):-(H =:= 32 -> CurCount is 1, numbWords(T,CurCount1,Count1), Count is (Count1 + CurCount);
                                   numbWords(T,CurCount,Count)).
numbWordsN([],Count):-Count is 0,!.
numbWordsN(S,Count):-numbWords(S,CurCount,Count).


pr2:-write("Enter str: "),
     readStr(S),nl,
     numbWordsN(S,Count),
     write("Count: "),
     write(Count).
%3 Дана строка, определить самое частое слово



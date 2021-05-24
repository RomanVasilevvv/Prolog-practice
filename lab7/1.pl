
%1 Дана строка. Вывести ее три раза через запятую и показать количе-
%ство символов в ней.

write_list([]):-!.
write_list([H/T]):-write(H),write_list(T).

readStr(A) :-
  get0(X),
  readS(X, A, []).
readS(10, A, A) :- !.
readS(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  readS(X1, A, B1).



countN([], Count, Count) :- !.
countN([_|T], CurCount, Count) :-
  CurCount1 is CurCount + 1,
  countN(T, CurCount1, Count).
countN(List, Count) :- countN(List, 0, Count).



writeStr([]) :- !.
writeStr([H|T]):-
  put(H),
  writeStr(T).


numStr([], _, _, _) :- write("There's no element with this num"), !.
numStr([_], CurNum, Num, _) :-
  CurNum1 is CurNum + 1,
  CurNum1 < Num,
  write("Such element isn\'t found"), !.
numStr([H|T], CurNum, Num, El) :-
  CurNum1 is CurNum + 1,
  ((CurNum1 is Num) ->
  El is H;
  numStr(T, CurNum1, Num, El)).
numStr([H|T], Num, El) :- numStr([H|T], 0, Num, El).

pr1:-write("Enter your str: "),
     readStr(S),nl,
     write("1: "),
     writeStr(S),nl,
     write("2: "),
     writeStr(S),nl,
     write("3: "),
     writeStr(S),nl,
     write("Count of numbers: "),
     countN(S,C),
     write(C).

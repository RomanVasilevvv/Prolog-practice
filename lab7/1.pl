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


%4 Дана строка. Вывести первые три символа и последний три символа,
%если длина строки больше 5 Иначе вывести первый символ столько
%раз, какова 4 Дана строка.

countV(S,-1,S1):-!.
countV(S,C,S1):-C >= 0,S = [H|T],S1 = [H1|T1],H1 is H,C1 is (C - 1),countV(S,C1,T1).

newStr3(T,3,T1):-T1 = T,!.
newStr3(T,CN,T1):-T = [H|TT],countN(TT,CCN),newStr3(TT,CCN,T1).

sec(S,C,S1):-[H1|[H2|[H3|T]]] = S,newStr3(T,C,T1),append([H1,H2,H3],T1,S1).

viv(S,C,S1):-(C > 5 ->(C =:= 6 ->S1 = S;sec(S,C,S1));countV(S,C,S1)).


pr4:-write("Enter  str: "),
     readStr(S),nl,
     countN(S,C),
     viv(S,C,S1),
     writeStr(S1).

%5 Дана строка. Показать номера символов, совпадающих с последним
%символом строки.

lastNumb(S,1,IND):-IND = S,!.
lastNumb(S,C,IND):-C > 0,C1 is (C - 1),S = [H|T],lastNumb(T,C1,IND).

strInd(S,0,Index,S1):-!.
strInd(S,C,Index,S1):-C > 0,S = [H|T],(H =:= Index -> S1 = [H1|T1],CurC is (C - 1),H1 is C,strInd(T,CurC,Index,T1);CurC is (C - 1),strInd(T,CurC,Index,S1)).



pr5:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C),
     lastNumb(S,C,IND),
     C1 is (C-1),
     strInd(S,C1,IND,S1),
     writeStr(S1).

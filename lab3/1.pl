max(X,Y,Z):-X>=Y, Z is X ; Y>=X, Z is Y;write(Z).
max(X,Y,U,Z):- X>Y,X>U, Z is X ,write(Z); Y>X,Y>U, Z is Y,write(Z); U>X,U>Y, Z is U, write(Z).

fact(0,1).
fact(N,X):-N>0,N1 is N-1,fact(N1,X1), X is X1*N.

fact(1,Z,Z):-!.
fact(N,Z,X):-Z1 is Z*N, N1 is N-1, fact(N1,Z1,X).
factorial(N,X):-fact(N,1,X).

fib(1,1).
fib(0,0).
fib(X,Y):-X>1,X1 is X-1, X2 is X-2, fib(X1,Y1),fib(X2,Y2),Y is Y1+Y2.

fib(1, _, CurX2, CurX2) :- !.
fib(2, _, CurX2, CurX2) :- !.
fib(N, CurX1, CurX2, X) :- CurX3 is CurX1 + CurX2, N1 is N - 1, fib(N1, CurX2, CurX3, X).
fibN(N, X) :- fib(N, 1, 1, X).


summ(0,0):-!.
summ(X,Y):-X>0, X1 is (X mod 10),X2 is (X div 10), summ(X2,Y1), Y is Y1+X1.

summ(0, CurX, CurX) :- !.
summ(Y, CurX, X) :- Mod is Y mod 10, Y1 is Y div 10, CurX1 is CurX + Mod, numbers(Y1, CurX1, X).
summdown(Y, X) :- summ(Y, 0, X).

maxNum(X, X) :- X div 10 =:= 0, !.
maxNum(Y, X) :- X2 is (Y mod 10), Y1 is (Y div 10), maxNum(Y1, X1), (X1 > X2 -> X is X1; X is X2).

maxNum(0, 10, 0) :- !.
maxNum(0, CurX, CurX) :- !.
maxNum(Y, CurX, X) :- CurX1 is (Y mod 10), Y1 is (Y div 10), (CurX1 > CurX -> CurX2 is CurX1; CurX2 is CurX), maxNum(Y1, CurX2, X).
maxNum1(Num, Min) :- maxNum(Num, 10, Min).

divNum(Y, X) :- Y =:= 0,X is 0 ,!.
divNum(Y, X) :- Ost is (Y mod 10), Y1 is (Y div 10), divNum(Y1, X1), (Ost == 3 -> X is (X1 + Ost); X is X1).

divNum(Num, Div, Div) :- Num = 0,Div is CurDiv,!.
divNum(Num, CurDiv, Div) :- Mod is (Num mod 10), Num1 is (Num div 10), (Mod == 3 -> CurDiv1 is (CurDiv + Mod); CurDiv1 is CurDiv), divNum(Num1, CurDiv1, Div).
divNumN(Num, Div) :- divNum(Num, 0, Div), Div is Div.

nodNums(X,Y,NOD):- X =:= 0,NOD is Y, !; Y =:= 0,NOD is X, !.
nodNums(X,Y,NOD):- (X > Y -> X1 is X mod Y,nodNums(Y,X1,NOD);Y1 is Y mod X, nodNums(X,Y1,NOD)).
nodNumsN(X,Y,NOD):- nodNums(X,Y,NOD), NOD is NOD.


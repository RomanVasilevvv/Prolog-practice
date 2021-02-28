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

fib(N, CurX1, CurX2, X) :- CurX3 is CurX1 + CurX2, N1 is N - 1, fib(N1, CurX2, CurX3, X).
fibN(N, X) :- fib(N, 1, 1, X).


summ(0,0):-!.
summ(X,Y):-X>0, X1 is (X mod 10),X2 is (X div 10), summ(X2,Y1), Y is Y1+X1.

summ(0, CurX, CurX) :- !.
summ(Y, CurX, X) :- Mod is Y mod 10, Y1 is Y div 10, CurX1 is CurX + Mod, numbers(Y1, CurX1, X).
summdown(Y, X) :- summ(Y, 0, X).

max(0,0):-!.
max1(X,Y):-X>0, X1 is (X mod 10),X2 is (X div 10),max1(X2,Y1), Y1 is (X mod 10), Y1>X1,Y1 is X1.

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



summ(0,0):-!.
summ(X,Y):-X>0, X1 is (X mod 10),X2 is (X div 10), summ(X2,Y1), Y is Y1+X1.

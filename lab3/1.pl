max(X,Y,Z):-X>=Y, Z is X ; Y>=X, Z is Y;write(Z).
max(X,Y,U,Z):- X>Y,X>U, Z is X ,write(Z); Y>X,Y>U, Z is Y,write(Z); U>X,U>Y, Z is U, write(Z).

fact(0,1).
fact(N,X):-N>0,N1 is N-1,fact(N1,X1), X is X1*N.

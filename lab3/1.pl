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
summ(Y, CurX, X) :- Mod is Y mod 10, Y1 is Y div 10, CurX1 is CurX + Mod, summ(Y1, CurX1, X).
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

%nodNums(X,Y,NOD):- X =:= 0,NOD is Y, !; Y =:= 0,NOD is X, !.
% nodNums(X,Y,NOD):- (X > Y -> X1 is X mod Y,nodNums(Y,X1,NOD);Y1 is Y
% mod X, nodNums(X,Y1,NOD)).
%nodNumsN(X,Y,NOD):- nodNums(X,Y,NOD), NOD is NOD.



nodNums(Num1, Num1, Num1, Num1) :- !.
nodNums(_, _, 1, 1) :- !.
nodNumsN(0, _, -1) :- !.
nodNumsN(_, 0, -1) :- !.
nodNumsN(0, 0, -1) :- !.
nodNums(Num1, Num2, CurNod, Nod) :- Num1 mod CurNod =:= 0, Num2 mod CurNod =:= 0, Nod is CurNod, !.
nodNums(Num1, Num2, CurNod, Nod) :- CurNod1 is CurNod - 1, nodNums(Num1, Num2, CurNod1, Nod).
nodNumsN(Num1, Num2, Nod) :- (Num1 > Num2 -> nodNums(Num1, Num2, Num2, Nod); nodNums(Num1, Num2, Num1, Nod)).


simpNumFalse():-false,!.
simpNum(X,DEL):-DEL =:= 1,!.
simpNum(X,DEL):-(X mod DEL =:= 0 -> simpNumFalse(); DEL1 is (DEL - 1),simpNum(X,DEL1)).
simpNumN(X):-DEL is (X - 1),simpNum(X,DEL).

countSum(Count1):-Count1 = Count + 1.
countDels(X,0,Count1):-!.
countDels(X,DEL,Count1):-DEL =:= 1,Count1 is 0,!.
countDels(X,DEL,Count1):-(X mod DEL =:= 0 -> DEL1 is (DEL - 1),countDels(X,DEL1,Count1), Count1 is (Count + 1); DEL1 is (DEL - 1),countDels(X,DEL1,Count1), Count1 is Count).
countDelsN(X,Count1):-DEL is (X - 1),countDels(X,DEL,Count1).





%13
col(1,1):-!.
col(2,2):-!.
col(X,N):-X>2,X mod 2 =:= 0,X1 is (X//2),X=\=1,col(X1,Z),N is Z+1.
col(X,N):-X>2,X mod 2 =\= 0,X1 is (3*X+1),X=\=1,col(X1,Z),N is Z+1.

colN(Max,Max,100000):-!.
colN(Max,MaxN,Num):-Num1 is (Num + 1),col(Num1,N),(N > Max -> Max1 is N,colN(Max1,MaxN,Num1);colN(Max,MaxN,Num1)).
colN1(Max,MaxN,Num):- colN(Max,MaxN,Num),write(MaxN).


%14
colprost(Num,Num,Count,Count):-!.
colprost(Num,CurNum,CurCount,Count):-CurNum1 is CurNum + 1,((nodNumsN(Num,CurNum,Nod), Nod=1) ->CurCount1 is CurCount+1;CurCount1 is CurCount),colprost(Num,CurNum1,CurCount1,Count).
%colprost(Num,Count):-colprost(Num,1,0,Count).


colprost(Num,Num,0):-!.
colprost(Num,CurNum,Count):-CurNum1 is CurNum + 1, ((nodNumsN(Num,CurNum,Nod), Nod=1) ->Flag is 1;Flag is 0),colprost(Num,CurNum1,Count1),Count is Count1 + Flag.
colprost(Num,Count):-colprost(Num,1,Count).



%15
prostdel(_,0,_,Count, Count):-!.
prostdel(N,CurN,Del,CurCount,Count):-Mod is CurN mod 10, CurN1 is CurN div 10,((nodNumsN(Del,Mod,X),X=1) -> CurCount1 is CurCount + 1; CurCount1 is CurCount), prostdel(N,CurN1,Del,CurCount1,Count).
prostdel(N,Del,Count):-prostdel(N,N,Del,0,Count).


maxdel(N,N1,Max,Max):-N1 is N+1,!.


maxdel(N,Del,CurMax, Max):-(0 is N mod Del -> prostdel(N,Del,Count);Count is CurMax),(Count > CurMax -> CurMax1 is Count;CurMax1 is CurMax),Del1 is Del + 1,maxdel(N,Del1,CurMax1,Max).
maxdel(N,Max):-maxdel(N,1,0,Max).


man(nikolay).
man(fedor).
man(anatoliy).
man(moisei).
man(sergey).
man(grigory).
man(artem).
man(konstantin).
man(mikhail).
man(dmitriy).
man(alan).
man(gleb).
man(andrey).
man(arsen).
man(vasiliy).

woman(maria).
woman(glasha).
woman(lubov).
woman(anna).
woman(ekaterina).
woman(darya).
woman(rosa).
woman(marina).
woman(sophia).
woman(valentina).
woman(alina).
woman(vera).
woman(karina).
woman(viktoria).
woman(tanya).

parent(nikolay,fedor).
parent(nikolay,anatoliy).
parent(maria,fedor).
parent(maria,anatoliy).

parent(fedor,moisey).
parent(glasha,moisey).

parent(anatoliy,sergey).
parent(anatoliy,ekaterina).
parent(anatoliy,darya).
parent(lubov,sergey).
parent(lubov,ekaterina).
parent(lubov,darya).

parent(sergey,rosa).
parent(sergey,konstantin).
parent(anna,rosa).
parent(anna,konstantin).

parent(grigory,sophia).
parent(grigory,mikhail).
parent(darya,sophia).
parent(darya,mikhail).

parent(artem,dmitriy).
parent(rosa,dmitriy).

parent(konstantin,valentina).
parent(marina,valentina).

showman:-man(X),write(X),write(", "),fail.
showwoman:-woman(X),write(X),write(", "),fail.


children(X):-parent(X,Y),write(Y),write(","),fail.

mother(X,Y):-woman(X),parent(X,Y),write("явл€етс€ мамой").
mother2(X):-parent(Y,X),woman(Y),write(Y).

son(X,Y):-man(X),man(Y), parent(Y,X).
son(X):- man(X),parent(X,Y),man(Y),write(Y),write(" "), fail.

brother(X,Y):-man(X),man(Y), parent(Z,X),parent(Z,Y).
brother(X):-parent(Z,X),parent(Z,Y),man(Y),not(X=Y),write(Y),write(","),fail.

sister(X,Y):-woman(X),woman(Y), parent(Z,X),parent(Z,Y).
sister(X):-parent(Z,X),parent(Z,Y),woman(Y),not(X=Y),write(Y),write(","),fail.

b_s(X,Y):-parent(Z,X),parent(Z,Y).
b_s(X):-parent(Z,X),parent(Z,Y),man(Z),not(X=Y),write(Y),write(" "),fail.

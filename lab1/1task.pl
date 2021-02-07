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






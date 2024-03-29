:- dynamic  offroad/2.
:- dynamic travel_family/2.
:- dynamic fuel/2.
:- dynamic foreingh/2.
:- dynamic spec/2.
:- dynamic price/2.
read_str(A) :-
  get0(X),
  r_str(X, A, []).
r_str(10, A, A) :- !.
r_str(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  r_str(X1, A, B1).

offroad_r(X, Y) :-
  repeat,
  ( offroad(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract( offroad(X, Y)));
  X = nil, Y = nil).

travel_family_r(X, Y) :-
  repeat,
  (travel_family(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(travel_family(X, Y)));
  X = nil, Y = nil).

fuel_r(X, Y) :-
  repeat,
  (fuel(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(fuel(X, Y)));
  X = nil, Y = nil).

foreingh_r(X, Y) :-
  repeat,
  (foreingh(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(foreingh(X, Y)));
  X = nil, Y = nil).

spec_r(X, Y) :-
  repeat,
  (spec(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(spec(X, Y)));
  X = nil, Y = nil).

price_r(X, Y) :-
  repeat,
  (price(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(price(X, Y)));
  X = nil, Y = nil).

prTell :-
  tell('D:/Prolog-practice/lab11/offroad.txt'), offroad_r(X1, _), X1 = nil, told,
  tell('D:/Prolog-practice/lab11/travel_family.txt'),  travel_family_r(X2, _),  X2 = nil, told,
  tell('D:/Prolog-practice/lab11/fuel.txt'),  fuel_r(X3, _),  X3 = nil, told,
  tell('D:/Prolog-practice/lab11/foreingh.txt'),  foreingh_r(X4, _),  X4 = nil, told,
  tell('D:/Prolog-practice/lab11/spec.txt'), spec_r(X5, _), X5 = nil, told,
  tell('D:/Prolog-practice/lab11/price.txt'), price_r(X6, _), X6 = nil, told.

prSee :-
  see('D:/Prolog-practice/lab11/offroad.txt'), get0(Sym1), read_data(Sym1, 1), seen,
  see('D:/Prolog-practice/lab11/travel_family.txt'),  get0(Sym2), read_data(Sym2, 2), seen,
  see('D:/Prolog-practice/lab11/fuel.txt'),  get0(Sym3), read_data(Sym3, 3), seen,
  see('D:/Prolog-practice/lab11/foreingh.txt'),  get0(Sym4), read_data(Sym4, 4), seen,
  see('D:/Prolog-practice/lab11/spec.txt'), get0(Sym5), read_data(Sym5, 5), seen,
  see('D:/Prolog-practice/lab11/price.txt'), get0(Sym6), read_data(Sym6, 6), seen.

read_data(-1, _) :- !.
read_data(_, Flag) :-
  read_str(Lang),
  name(X, Lang),
  read(Y),
  (
    Flag = 1 ->
    asserta( offroad(X, Y));
    (
      Flag = 2 ->
      asserta(travel_family(X, Y));
      (
        Flag = 3 ->
        asserta(fuel(X, Y));
        (
          Flag = 4 ->
          asserta(foreingh(X, Y));
            (
              Flag = 5->
          asserta(spec(X, Y));
          asserta(price(X,Y)))
        )
      )
    )
  ),
  get0(Sym),
  read_data(Sym, Flag).


question1(X1):-	write("Какой класс машины вас интересует?"),nl,
				write("1. Внедорожник "),nl,
				write("2. Городская-междугородняя"),nl,
				read(X1).

question2(X2):-	write("Какой компанией собираетесь путешествовать?"),nl,
				write("0. Большой (5-7 чел.)"),nl,
				write("1. Средней(3-5) чел."),nl,
                                write("2. Малой(1-2) чел."),nl,
				read(X2).


question3(X3):-	write("Важен ли расход топлива?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X3).
question4(X4):-	write("Предпочитаете иномарку или отечественную?"),nl,
				write("0. Иномарка"),nl,
				write("1. Отечественная"),nl,
				read(X4).

question5(X5):-	write("На какие компромиссы готовы пойти?"),nl,
                                write("3. Хорошее качество"),nl,
				write("2. Качество и комфорт"),nl,
				write("1. Хороший комфорт"),nl,
				write("0. Зато не пешком)"),nl,
				read(X5).
question6(X6):-	write("Самый важный вопрос...Цена...?"),nl,
				write("2. Относительно недорогие, до 1млн руб."),nl,
				write("1. Средняя цена, 1.5-3млн.руб"),nl,
				write("0. Дорогие, выше 3 млн. руб."),nl,
				read(X6).


addCar(Car, X1, X2, X3, X4, X5,X6) :-
  append('D:/Prolog-practice/lab11/offroad.txt'),
  nl, write(Car), nl, write(X1), write("."), told,

  append('D:/Prolog-practice/lab11/travel_family.txt'),
  nl, write(Car), nl, write(X2), write("."), told,

  append('D:/Prolog-practice/lab11/fuel.txt'),
  nl, write(Car), nl, write(X3), write("."), told,

  append('D:/Prolog-practice/lab11/foreingh.txt'),
  nl, write(Car), nl, write(X4), write("."), told,

  append('D:/Prolog-practice/lab11/spec.txt'),
  nl, write(Car), nl, write(X5), write("."), told,

  append('D:/Prolog-practice/lab11/price.txt'),
  nl, write(Car), nl, write(X6), write("."), told.

pr :-
  prSee,
  question1(X1),
  question2(X2),
  question3(X3),
  question4(X4),
  question5(X5),
  question6(X6),
  ( offroad(X, X1),
  travel_family(X, X2),
  fuel(X, X3),
  foreingh(X, X4),
  spec(X, X5),
    price(X,X6),
  write(X);
  (write("Car -> "),
  read(Car),
  asserta(offroad(Car, X1)),
  asserta(travel_family(Car, X2)),
  asserta(fuel(Car, X3)),
  asserta(foreingh(Car, X4)),
  asserta(spec(Car, X5)),
   asserta(price(Car, X6)),
  prTell, nl,
  write("Car was added!")
  )).

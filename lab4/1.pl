append_ls([], X, X).
append_ls([H|T1], X, [H|T2]) :- append_ls(T1, X, T2).
%1
% вывод
read_ls(N, L) :- read_ls(N, 0, [], L), !.
read_ls(N, N, L, L) :- !.
read_ls(N, CurN, CurL, L) :-
  CurN1 is CurN + 1,
  read(X),
  append_ls(CurL, [X], CurL1),
  read_ls(N, CurN1, CurL1, L).

% чтение
write_ls([]) :- !.
write_ls([H|T]) :-
  write(H),
  write(" "),
  write_ls(T).
%2
sum_ls_down([], Sum, Sum) :- !.
sum_ls_down([H|T], CurSum, Sum) :-
  CurSum1 is CurSum + H,
  sum_ls_down(T, CurSum1, Sum).
sum_ls_down([H|T], Sum) :- sum_ls_down([H|T], 0, Sum).


%3
sum_ls_up([], 0) :- !.
sum_ls_up([H|T], Sum) :-
  sum_ls_up(T, Sum1),
  Sum is Sum1 + H.


%4
ls_num_el([H], El, CurNum, Num) :-
  ((H = El) ->
  Num is CurNum + 1;
  write("Such element isn\'t found")), !.
ls_num_el([H|T], El, CurNum, Num) :-
  CurNum1 is CurNum + 1,
  ((El = H) ->
  Num is CurNum1;
  ls_num_el(T, El, CurNum1, Num)).
ls_num_el([H|T], El, Num) :- ls_num_el([H|T], El, -1, Num).



%5
ls_el_at_num([], _, _, _) :- write("Such element isn\'t found"), !.
ls_el_at_num([_], CurNum, Num, _) :-
  CurNum1 is CurNum + 1,
  CurNum1 < Num,
  write("Such element isn\'t found"), !.
ls_el_at_num([H|T], CurNum, Num, El) :-
  CurNum1 is CurNum + 1,
  ((CurNum1 is Num) ->
  El is H;
  ls_el_at_num(T, CurNum1, Num, El)).
ls_el_at_num([H|T], Num, El) :- ls_el_at_num([H|T], -1, Num, El).

%6
min_up([H],CurMin,Min):-
  (H < CurMin ->
   Min is H;
   Min is CurMin),!.
min_up([H|T], CurMin,Min):-(H<CurMin -> CurMin is H; CurMin is CurMin),
  min_up(T,CurMin1,Min),Min is CurMin1.
min_up([],_):-write("Не существует"), fail,!.
min_up([H],Min):-Min is H.
min_up([H|T],Min):-min_up(T,H,Min).



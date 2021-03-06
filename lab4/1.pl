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

list_el_numb([H|_],H,N,N):-!.
list_el_numb([_|T],L,X,N):-X1 is X+1,list_el_numb(T,L,X1,N).
list_el_numb(List,L,N):-list_el_numb(List,L,0,N).
%4
ls_num_el([H], El, CurNum, Num) :-
  ((H = El) ->
  Num is CurNum + 1;
  write("Net takogo elementa")), !.
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
min_up([H], H):-!.
min_up([H|T], Min):-min_up(T,Min1),(H < Min1 -> Min is H;Min is Min1).
%7
min_down(_,Min,Min):-!.
min_down([H|T],CurMin,Min):-(H<CurMin -> CurMin1 is H; CurMin1 is CurMin), min_down(T,CurMin1,Min).
min_down([H|T],Min):-min_down(T,H,Min).

%8
pr8 :-
  write("Введите список -> "),
  read(X), X =\= 0,
  write("Ñïèñîê -> "),
  read_ls(X, List),
  min_down(List, Min),
  write("Минимальный элемент => "),
  write(Min), !.
pr8 :-
  write("Ñïèñîê ïóñòîé").

%9
in_list([H|_], H) :- !.
in_list([_|T], El) :- in_list(T, El).

%10
reverse([], InvList, InvList) :- !.
reverse([H|T], CurList, InvList) :- reverse(T, [H|CurList], InvList).
reverse(List, InvList) :- reverse(List, [], InvList).

%11
p([], _) :- !.
p([SubH|SubT], [H|T]) :-(SubH = H -> p(SubT, T); p([SubH|SubT], T)).


%12
dn_elem([_|T], CurList, Num, Num, NewList) :- append_ls(CurList, T, NewList), !.
dn_elem([H|T], CurList, CurNum, Num, NewList) :-
  append_ls(CurList, [H], CurList1),
  CurNum1 is CurNum + 1,
  dn_elem(T, CurList1, CurNum1, Num, NewList).
dn_elem(List, Num, NewList) :- dn_elem(List, [], 1, Num, NewList).


%13
del_equals(List, El, List) :- not(in_list(List, El)), !.
del_equals(List, El, NewList) :- ls_num_el(List, El, Num), dn_elem(List, Num, List1), del_equals(List1, El, NewList).


%14
one_els([]) :- !.
one_els([H|T]) :- not(in_list(T, H)),one_els(T).


%15
one_list([], []) :- !.
one_list([H|T], List) :-del_equals(T, H, RList),one_list(RList, List1),
  append_ls([H], List1, List).

%16
counter_equals([], _, Count, Count) :- !.
counter_equals([H|T], El, CurCount, Count) :-
  (H = El ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  counter_equals(T, El, CurCount1, Count).
counter_equals(List, El, Count) :- counter_equals(List, El, 0, Count).

%17
counter_list([], Count, Count) :- !.
counter_list([_|T], CurCount, Count) :-
  CurCount1 is CurCount + 1,
  counter_list(T, CurCount1, Count).
counter_list(List, Count) :- counter_list(List, 0, Count).

%18
%1
lenght([],0).
lenght([_|T],X):-lenght(T,X1),X is (X1 + 1).
max_down(_,Max,Max):-!.
max_down([H|T],CurMax,Max):-(H>CurMax -> CurMax1 is H; CurMax1 is CurMax), max_down(T,CurMax1,Max).
max_down([H|T],Min):-max_down(T,H,Min).

last_max(L,El):-max_down(L,Max),list_el_numb(L,Max,CurMax),lenght(L,X1),El is X1 -CurMax -2.

%2

number_min(L,Num):-min_up(L,Min),list_el_numb(L,Min,Num).

%14
a_b_count(L,A,B,Count):-list_el_numb(L,A,A1),list_el_numb(L,B,B1),(A1 > B1 -> Count is A1 - B1 - 1; Count is B1 - A1 - 1).

%16
prohod([],Max,Min,X1):-X1 is Min,!.
prohod([H|T],Max,Min,X1):- (H < Max,H > Min -> Min1 is H, prohod(T,Max,Min1,X1);prohod(t,Max,Min,X1)).
first_second_max(L,L2):-max_down(L,Max1),min_up(L,Min), Min1 is Min - 1.

%38
a_b_view(L,A,B,Count):-list_el_numb(L,A,A1),list_el_numb(L,B,B1),(A1 > B1 -> Count is A1 - B1 ; Count is B1 - A1).





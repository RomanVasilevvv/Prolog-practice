% ������ ������ ������������� ����� (���� �� �������� enter)
read_str_fix(A, N) :-
  get0(X),
  r_str_fix(X, A, [], N, 0).
r_str_fix(10, A, A, N, N) :- !.
r_str_fix(X, A, B, N, K) :-
  K1 is K + 1,
  append(B, [X], B1),
  get0(X1),
  r_str_fix(X1, A, B1, N, K1).

% ������� ������
write_str([]) :- !.
write_str([H|Tail]):-
  put(H),
  write_str(Tail).

% ������ ������ ��������������� ����� (���� �� �������� enter)
read_str_nofix(A) :-
  get0(X),
  r_str_nofix(X, A, []).
r_str_nofix(10, A, A) :- !.
r_str_nofix(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  r_str_nofix(X1, A, B1).

% ���������� ��������� � ������
count_els([], Count, Count) :- !.
count_els([_|T], CurCount, Count) :-
  CurCount1 is CurCount + 1,
  count_els(T, CurCount1, Count).
count_els(List, Count) :- count_els(List, 0, Count).

% ���������� �������� � ������
count_chrs([], Count, Count) :- !.
count_chrs([H|T], CurCount, Count) :-
  (H = 32 ->
  CurCount1 is CurCount;
  CurCount1 is CurCount + 1),
  count_chrs(T, CurCount1, Count).
count_chrs(List, Count) :- count_chrs(List, 0, Count).

% ������� 1
task1 :-
  write("Str -> "),
  read_str_nofix(S),
  write("["),
  write_str(S),
  write("], ["),
  write_str(S),
  write("], ["),
  write_str(S),
  write("]"), nl,
  write("Elements => "),
  count_els(S, Count),
  write(Count).

% ������� 2
% �������� ������ ��� ������ ��������
list_nofirstspaces([], []) :- !.
list_nofirstspaces([H|T], [H|T]) :- H \= 32, !.
list_nofirstspaces([_|T], NewList) :- list_nofirstspaces(T, NewList).

% �������� ����� �� ������� ������� (��������, ���� � ������ ��� ��������)
firstword([], Word, Word) :- !.
firstword([H|_], Word, Word) :- H = 32, !.
firstword([H|T], CurWord, NewWord) :-
  append(CurWord, [H], CurWord1),
  firstword(T, CurWord1, NewWord).
firstword(List, Word) :- firstword(List, [], Word).

% ������� ���������� ����
% ������� ������ �������
% ���� ����� ������ �� ������, ������� �����, ������� + 1
% ����� ���� �� ��������, ������ �� �������
% ������ ����� ListNoFirstWord ��� � (��������� + �������), ��� ������
count_words([], Count, Count) :- !.
count_words(List, CurCount, Count) :-
  list_nofirstspaces(List, ListNoFirstSpaces),
  (ListNoFirstSpaces \= [] ->
  (firstword(ListNoFirstSpaces, FirstWord),
  append(FirstWord, ListNoFirstWord, ListNoFirstSpaces),
  CurCount1 is CurCount + 1);
  (ListNoFirstWord = [],
  CurCount1 is CurCount)),
  count_words(ListNoFirstWord, CurCount1, Count).
count_words(List, Count) :- count_words(List, 0, Count).

task2 :-
  write("Str -> "),
  read_str_nofix(S),
  write("Count of words => "),
  count_words(S, Count),
  write(Count).

% ������� 3
% �������� ������ ����� �������� �� �������
firstword_nfs(List, Word) :-
  list_nofirstspaces(List, ListNFS),
  firstword(ListNFS, Word).

% �������� ������ ����
list_of_words(List, LW, LW) :-
  list_nofirstspaces(List, ListNFS),
  ListNFS = [], !.
list_of_words(Str, CurLW, LW) :-
  list_nofirstspaces(Str, StrNFS),
  firstword(StrNFS, Word),
  append(Word, StrNoWord, StrNFS),
  append(CurLW, [Word], CurLW1),
  list_of_words(StrNoWord, CurLW1, LW).
list_of_words(Str, LW) :- list_of_words(Str, [], LW).

% ���������� �� ������
lists_equals([], []) :- !.
lists_equals([H|T1], [H|T2]) :- lists_equals(T1, T2).

% ����� ���, ������� ����������� �������� ������� � ������
count_equals([], _, Count, Count) :- !.
count_equals([H|T], El, CurCount, Count) :-
  (H = El ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_equals(T, El, CurCount1, Count).
count_equals(List, El, Count) :- count_equals(List, El, 0, Count).

% �����, ������� ����������� ���� �����
regular_word([], _, Word, Word) :- !.
regular_word([H|T], Count, CurWord, Word) :-
  count_equals([H|T], H, Count1),
  (Count1 > Count ->
  (CurWord1 = H,
  Count2 = Count1);
  (CurWord1 = CurWord,
  Count2 = Count)),
  regular_word(T, Count2, CurWord1, Word).
regular_word(List, Word) :- regular_word(List, 0, [], Word).

task3 :-
  write("Str -> "),
  read_str_nofix(S),
  list_of_words(S, LW),
  regular_word(LW, Word),
  write("Regular word => ["),
  write_str(Word),
  write("]").

% ������� 4
% �������� ������ �� ��������� ��� ���������
list_with3els(List, List) :- count_els(List, 3), !.
list_with3els([_|T], NewList) :- list_with3els(T, NewList).

% ������ �� ������ ������� �������� ���������� ���
list_with1el(_, 0, List, List) :- !.
list_with1el(El, N, CurList, List) :-
  N1 is N - 1,
  append(CurList, [El], CurList1),
  list_with1el(El, N1, CurList1, List).
list_with1el(El, N, List) :- list_with1el(El, N, [], List).

task4 :-
  write("Str -> "),
  read_str_nofix(S),
  count_els(S, Count),
  (Count > 5 ->
  ([H1|[H2|[H3|T]]] = S,
  list_with3els(T, T3),
  append([H1, H2, H3], T3, NewS));
  ([H1|_] = S,
  list_with1el(H1, Count, NewS))),
  write("New Str => ["),
  write_str(NewS),
  write("]").

% ������� 5
% ����� �������� � ������
ls_num_el([H], El, CurNum, Num) :-
  ((H = El) ->
  Num is CurNum + 1;
  write("Such element isn\'t found")), !.
ls_num_el([H|T], El, CurNum, Num) :-
  CurNum1 is CurNum + 1,
  ((El = H) ->
  Num is CurNum1;
  ls_num_el(T, El, CurNum1, Num)).
ls_num_el([H|T], El, Num) :- ls_num_el([H|T], El, 0, Num).

% ��������� �������� �� ������ � ������
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
ls_el_at_num([H|T], Num, El) :- ls_el_at_num([H|T], 0, Num, El).

% ��������� ������ �� ������� ��������, ����������� � �������� ��������
ls_with_nums([], _, _, _, List, List) :- !.
ls_with_nums([H|T], El, CurNum, Count, CurList, NewList) :-
  CurNum1 is CurNum + 1,
  (El = H ->
  append(CurList, [CurNum1], CurList1);
  append(CurList, [], CurList1)),
  ls_with_nums(T, El, CurNum1, Count, CurList1, NewList).
ls_with_nums(List, El, NewList) :-
  count_els(List, Count),
  ls_with_nums(List, El, 0, Count, [], NewList).

task5 :-
  write("Str -> "),
  read_str_nofix(S),
  count_els(S, Count),
  ls_el_at_num(S, Count, El),
  ls_with_nums(S, El, Nums),
  write("El at "),
  write(Count),
  write(" position => ["),
  write_str([El]),
  write("]"), nl,
  write("Nums of el => "),
  write(Nums).

% ������� 6
% �������� ������� � ��������, ������� ������ 3
list_mod3els(_, Num, Count, List, List) :- Num > Count, !.
list_mod3els(List, Num, Count, CurList, NewList) :-
  Num1 is Num + 3,
  ls_el_at_num(List, Num, El),
  append(CurList, [El], CurList1),
  list_mod3els(List, Num1, Count, CurList1, NewList).
list_mod3els(List, NewList) :-
  count_els(List, Count),
  list_mod3els(List, 3, Count, [], NewList).

task6 :-
  write("Str -> "),
  read_str_nofix(S),
  list_mod3els(S, Mod3),
  write("Chrs, where num mod 3 => ["),
  write_str(Mod3),
  write("]").

% ������� 7
% ������� ���������� ������ � �������
count_pm([], Count, Count) :- !.
count_pm([H|T], CurCount, Count) :-
  ((H = 43 | H = 45) ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_pm(T, CurCount1, Count).
count_pm(List, Count) :- count_pm(List, 0, Count).

% ������� ���������� ���������, ����� ������� ��� 0
count_afterthat0([_], Count, Count) :- !.
count_afterthat0([_|[H2|T]], CurCount, Count) :-
  (H2 = 48 ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_afterthat0([H2|T], CurCount1, Count).
count_afterthat0(List, Count) :- count_afterthat0(List, 0, Count).

task7 :-
  write("Str -> "),
  read_str_nofix(S),
  count_pm(S, CountPM),
  write("Count [+] and [-] => "),
  write(CountPM), nl,
  count_afterthat0(S, Count0),
  write("Count els, after which [0] => "),
  write(Count0).

% ������� 8
% ���� �� ������� � ������
in_ls([H|_], H) :- !.
in_ls([_|T], El) :- in_ls(T, El).

task8 :-
  write("Str -> "),
  read_str_nofix(S),
  (
    not(
      (in_ls(S, 119),
      in_ls(S, 120))
    ) ->
    write("w or x isn\'t exist");
    (
      ls_num_el(S, 119, N119),
      ls_num_el(S, 120, N120),
      (
        N119 < N120 ->
        write("index of [w] is less than [x]");
        write("index of [x] is less than [w]")
      )
    )
  ).

% ������� 9
% ������� ������ �������� ���������� ���
write_str_n(_, 0) :- !.
write_str_n(Str, N) :-
  N1 is N - 1,
  write("["),
  write_str(Str),
  write("] "),
  write_str_n(Str, N1).

task9 :-
  write("Str1 -> "),
  read_str_nofix(S1),
  write("Str2 -> "),
  read_str_nofix(S2),
  count_els(S1, Count1),
  count_els(S2, Count2),
  (
    Count1 > Count2 ->
    (
      CountD is Count1 - Count2,
      write_str_n(S1, CountD)
    );
    (
      Count2 > Count1 ->
      (
        CountD is Count2 - Count1,
        write_str_n(S2, CountD)
      );
      write("Strs are equals")
    )
  ).

% ������� 10
% �������� ������ �� ������ (������ � �������)
get_ls_before(_, Num, Num, List, List) :- !.
get_ls_before([H|T], CurNum, Num, CurList, NewList) :-
  append(CurList, [H], CurList1),
  CurNum1 is CurNum + 1,
  get_ls_before(T, CurNum1, Num, CurList1, NewList).
get_ls_before(List, Num, NewList) :- get_ls_before(List, 0, Num, [], NewList).

% �������� ������ ����� ������ (������ � �������)
get_ls_after(List, Num, ListAfter) :-
  Num1 is Num - 1,
  get_ls_before(List, Num1, ListBefore),
  append(ListBefore, ListAfter, List).

% �������� ������ ����� �������� (��� ���)
get_ls_between(List, Num1, Num2, ListBetween) :-
  get_ls_before(List, Num1, ListBefore),
  append(ListBefore, ListAfter, List),
  Num22 is Num2 - Num1 - 1,
  get_ls_before(ListAfter, Num22, ListBetween).

% ������ ��� 'abc' �� 'www'
rpc_abc_to_www([H1, H2], CurList, List) :- append(CurList, [H1, H2], List), !.
rpc_abc_to_www([H1], CurList, List) :- append(CurList, [H1], List), !.
rpc_abc_to_www([], List, List) :- !.
rpc_abc_to_www([H1|[H2|[H3|T]]], CurList, List) :-
  ((H1 = 97, H2 = 98, H3 = 99) ->
  (append(CurList, [119, 119, 119], CurList1),
  rpc_abc_to_www(T, CurList1, List));
  (append(CurList, [H1], CurList1),
  rpc_abc_to_www([H2|[H3|T]], CurList1, List))).
rpc_abc_to_www(List, NewList) :- rpc_abc_to_www(List, [], NewList).

% ������� 11
% �������� ������ �������� �������� �� �������� �����
list_rsz(_, N, N, List, List) :- !.
list_rsz(El, CurN, N, CurList, List) :-
  CurN1 is CurN + 1,
  append(CurList, [El], CurList1),
  list_rsz(El, CurN1, N, CurList1, List).

task11 :-
  write("Str -> "),
  read_str_nofix(S),
  count_els(S, Count),
  (Count > 10 ->
  get_ls_before(S, 6, NewS);
  list_rsz(111, Count, 12, S, NewS)),
  write("New Str => ["),
  write_str(NewS),
  write("]").
% ������� 12
% �������� ������ �� ���� �� 3 ��������
list_words3chrs([_, _], List, List) :- !.
list_words3chrs([_], List, List) :- !.
list_words3chrs([], List, List) :- !.
list_words3chrs(Str, CurListWords, ListWords) :-
  get_ls_before(Str, 3, BeforeStr),
  append(BeforeStr, AfterStr, Str),
  append(CurListWords, [BeforeStr], CurListWords1),
  list_words3chrs(AfterStr, CurListWords1, ListWords).
list_words3chrs(Str, ListWords) :- list_words3chrs(Str, [], ListWords).

% �������� �� ��� ��������� ������
max_of_ls([H1, H2, H3], H1) :- H1 >= H2, H1 >= H3, !.
max_of_ls([_, H2, H3], H2) :- H2 >= H3, !.
max_of_ls([_, _, H3], H3) :- !.

% ������ � ������ ����� ������ ������� ������� �� ������ (max + 1)
rpc_mid_el_to_anr([], List, List) :- !.
rpc_mid_el_to_anr([H|T], CurList, List) :-
  max_of_ls(H, Max),
  Max1 is Max + 1,
  [H1, _, H2] = H,
  append(CurList, [[H1, Max1, H2]], CurList1),
  rpc_mid_el_to_anr(T, CurList1, List).
rpc_mid_el_to_anr(Str, List) :- rpc_mid_el_to_anr(Str, [], List).

% ������� ������ �����
write_list_str([]) :- !.
write_list_str([H|T]) :-
  write("["),
  write_str(H),
  write("]"), nl,
  write_list_str(T).

% �������� ������ �� ��� ��������� "��-�����������"
check_asc([H1, H2, H3]) :- H1 =< H2, H2 =< H3, !.

% ������, � ������� ������� ���� � ������� �����������
list_of_asc_strs([], List, List) :- !.
list_of_asc_strs([H|T], CurList, List) :-
  (check_asc(H) ->
  append(CurList, [H], CurList1);
  CurList1 = CurList),
  list_of_asc_strs(T, CurList1, List).
list_of_asc_strs(List, NewList) :- list_of_asc_strs(List, [], NewList).

task12 :-
  write("Str -> "),
  read_str_nofix(S), nl,
  write("Original => "), nl,
  list_words3chrs(S, Words),
  write_list_str(Words), nl,
  write("Modified => "), nl,
  rpc_mid_el_to_anr(Words, WordsRPC),
  write_list_str(WordsRPC), nl,
  write("Ascinated => "), nl,
  list_of_asc_strs(Words, WordsASC),
  write_list_str(WordsASC).
% ������� 13
% ������ ������ ������ ������ �� ������
rpc_mod2el([H1], CurList, List) :- append(CurList, [H1], List), !.
rpc_mod2el([], List, List) :- !.
rpc_mod2el([H1|[H2|T]], CurList, List) :-
  ((H2 = 97 | H2 = 98) ->
  append(CurList, [H1, 99], CurList1);
  append(CurList, [H1, 97], CurList1)),
  rpc_mod2el(T, CurList1, List).
rpc_mod2el(List, NewList) :- rpc_mod2el(List, [], NewList).

task13 :-
  write("Str -> "),
  read_str_nofix(S),
  rpc_mod2el(S, NewS),
  write("["),
  write_str(NewS),
  write("]").

% ������� 14
% ���� ���������� ���� � ������
list_count_digits([], Count, Count) :- !.
list_count_digits([H|T], CurCount, Count) :-
  ((H >= 48, H =< 57) ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  list_count_digits(T, CurCount1, Count).
list_count_digits(List, Count) :- list_count_digits(List, 0, Count).

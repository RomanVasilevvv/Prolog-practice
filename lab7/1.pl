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
  r_str_not_fixx(X, A, []).
r_str_not_fixx(10, A, A) :- !.
r_str_not_fixx(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  r_str_not_fixx(X1, A, B1).

% ���������� ��������� � ������
count_elements([], Count, Count) :- !.
count_elements([_|T], CurCount, Count) :-
  CurCount1 is CurCount + 1,
  count_elements(T, CurCount1, Count).
count_elements(List, Count) :- count_elements(List, 0, Count).

% ���������� �������� � ������
count_ch([], Count, Count) :- !.
count_ch([H|T], CurCount, Count) :-
  (H = 32 ->
  CurCount1 is CurCount;
  CurCount1 is CurCount + 1),
  count_ch(T, CurCount1, Count).
count_ch(List, Count) :- count_ch(List, 0, Count).

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
  count_elements(S, Count),
  write(Count).

% ������� 2
% �������� ������ ��� ������ ��������
list_noprobel([], []) :- !.
list_noprobel([H|T], [H|T]) :- H \= 32, !.
list_noprobel([_|T], NewList) :- list_noprobel(T, NewList).

% �������� ����� �� ������� ������� (��������, ���� � ������ ��� ��������)
f_word([], Word, Word) :- !.
f_word([H|_], Word, Word) :- H = 32, !.
f_word([H|T], CurWord, NewWord) :-
  append(CurWord, [H], CurWord1),
  f_word(T, CurWord1, NewWord).
f_word(List, Word) :- f_word(List, [], Word).

% ������� ���������� ����
% ������� ������ �������
% ���� ����� ������ �� ������, ������� �����, ������� + 1
% ����� ���� �� ��������, ������ �� �������
% ������ ����� ListNof_word ��� � (��������� + �������), ��� ������
count_words([], Count, Count) :- !.
count_words(List, CurCount, Count) :-
  list_noprobel(List, ListNoFirstSpaces),
  (ListNoFirstSpaces \= [] ->
  (f_word(ListNoFirstSpaces, f_word),
  append(f_word, ListNof_word, ListNoFirstSpaces),
  CurCount1 is CurCount + 1);
  (ListNof_word = [],
  CurCount1 is CurCount)),
  count_words(ListNof_word, CurCount1, Count).
count_words(List, Count) :- count_words(List, 0, Count).

task2 :-
  write("Str -> "),
  read_str_nofix(S),
  write("Count of words => "),
  count_words(S, Count),
  write(Count).

% ������� 3
% �������� ������ ����� �������� �� �������
f_word_nfs(List, Word) :-
  list_noprobel(List, ListNFS),
  f_word(ListNFS, Word).

% �������� ������ ����
list_of_words(List, LW, LW) :-
  list_noprobel(List, ListNFS),
  ListNFS = [], !.
list_of_words(Str, CurLW, LW) :-
  list_noprobel(Str, StrNFS),
  f_word(StrNFS, Word),
  append(Word, StrNoWord, StrNFS),
  append(CurLW, [Word], CurLW1),
  list_of_words(StrNoWord, CurLW1, LW).
list_of_words(Str, LW) :- list_of_words(Str, [], LW).

% ���������� �� ������
lists_equals_l([], []) :- !.
lists_equals_l([H|T1], [H|T2]) :- lists_equals_l(T1, T2).

% ����� ���, ������� ����������� �������� ������� � ������
count_equals([], _, Count, Count) :- !.
count_equals([H|T], El, CurCount, Count) :-
  (H = El ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_equals(T, El, CurCount1, Count).
count_equals(List, El, Count) :- count_equals(List, El, 0, Count).

% �����, ������� ����������� ���� �����
chastoe_word([], _, Word, Word) :- !.
chastoe_word([H|T], Count, CurWord, Word) :-
  count_equals([H|T], H, Count1),
  (Count1 > Count ->
  (CurWord1 = H,
  Count2 = Count1);
  (CurWord1 = CurWord,
  Count2 = Count)),
  chastoe_word(T, Count2, CurWord1, Word).
chastoe_word(List, Word) :- chastoe_word(List, 0, [], Word).

task3 :-
  write("Str -> "),
  read_str_nofix(S),
  list_of_words(S, LW),
  chastoe_word(LW, Word),
  write("Regular word => ["),
  write_str(Word),
  write("]").

% ������� 4
% �������� ������ �� ��������� ��� ���������
list_with3els(List, List) :- count_elements(List, 3), !.
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
  count_elements(S, Count),
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
  count_elements(List, Count),
  ls_with_nums(List, El, 0, Count, [], NewList).

task5 :-
  write("Str -> "),
  read_str_nofix(S),
  count_elements(S, Count),
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
  count_elements(List, Count),
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
count_posle0([_], Count, Count) :- !.
count_posle0([_|[H2|T]], CurCount, Count) :-
  (H2 = 48 ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_posle0([H2|T], CurCount1, Count).
count_posle0(List, Count) :- count_posle0(List, 0, Count).

task7 :-
  write("Str -> "),
  read_str_nofix(S),
  count_pm(S, CountPM),
  write("Count [+] and [-] => "),
  write(CountPM), nl,
  count_posle0(S, Count0),
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
  count_elements(S1, Count1),
  count_elements(S2, Count2),
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
get_before_numbers(_, Num, Num, List, List) :- !.
get_before_numbers([H|T], CurNum, Num, CurList, NewList) :-
  append(CurList, [H], CurList1),
  CurNum1 is CurNum + 1,
  get_before_numbers(T, CurNum1, Num, CurList1, NewList).
get_before_numbers(List, Num, NewList) :- get_before_numbers(List, 0, Num, [], NewList).

% �������� ������ ����� ������ (������ � �������)
get_ls_after(List, Num, ListAfter) :-
  Num1 is Num - 1,
  get_before_numbers(List, Num1, ListBefore),
  append(ListBefore, ListAfter, List).

% �������� ������ ����� �������� (��� ���)
get_ls_between(List, Num1, Num2, ListBetween) :-
  get_before_numbers(List, Num1, ListBefore),
  append(ListBefore, ListAfter, List),
  Num22 is Num2 - Num1 - 1,
  get_before_numbers(ListAfter, Num22, ListBetween).

% ������ ��� 'abc' �� 'www'
abc_to_www([H1, H2], CurList, List) :- append(CurList, [H1, H2], List), !.
abc_to_www([H1], CurList, List) :- append(CurList, [H1], List), !.
abc_to_www([], List, List) :- !.
abc_to_www([H1|[H2|[H3|T]]], CurList, List) :-
  ((H1 = 97, H2 = 98, H3 = 99) ->
  (append(CurList, [119, 119, 119], CurList1),
  abc_to_www(T, CurList1, List));
  (append(CurList, [H1], CurList1),
  abc_to_www([H2|[H3|T]], CurList1, List))).
abc_to_www(List, NewList) :- abc_to_www(List, [], NewList).
task10 :-
  write("Str -> "),
  read_str_nofix(S),
  [H1|[H2|[H3|_]]] = S,
  ((H1 = 97, H2 = 98, H3 = 99) ->
  abc_to_www(S, NewS);
  append(S, [122, 122, 122], NewS)),
  write("New Str => ["),
  write_str(NewS),
  write("]").

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
  count_elements(S, Count),
  (Count > 10 ->
  get_before_numbers(S, 6, NewS);
  list_rsz(111, Count, 12, S, NewS)),
  write("New Str => ["),
  write_str(NewS),
  write("]").
% ������� 12
% �������� ������ �� ���� �� 3 ��������
list_words3simbol([_, _], List, List) :- !.
list_words3simbol([_], List, List) :- !.
list_words3simbol([], List, List) :- !.
list_words3simbol(Str, CurListWords, ListWords) :-
  get_before_numbers(Str, 3, BeforeStr),
  append(BeforeStr, AfterStr, Str),
  append(CurListWords, [BeforeStr], CurListWords1),
  list_words3simbol(AfterStr, CurListWords1, ListWords).
list_words3simbol(Str, ListWords) :- list_words3simbol(Str, [], ListWords).

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
  list_words3simbol(S, Words),
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

% ������� 15
% �������� �� ������ ������� a, b, c
% ����� � �� ��������, �������� �� ������ ��� 3 �������
% ��������� ��������, ��� ������ ����� �������� �� ���� ��� ��������
% �� �� ����������� ������ �� ���
list_onlyabc([]) :- !.
list_onlyabc([H|T]) :-
  ((H = 97 | H = 98 | H = 99) ->
  list_onlyabc(T); fail).

task15 :-
  write("Str -> "),
  read_str_nofix(S),
  ((list_onlyabc(S)) ->
  write("Str has ONLY a, b ,c");
  write("Str has NOT ONLY a, b, c")).

% ������� 16
% ������ � ������ ����� word �� letter
rpc_word_to_letter([H1, H2, H3], CurList, List) :- append(CurList, [H1, H2, H3], List), !.
rpc_word_to_letter([H1, H2], CurList, List) :- append(CurList, [H1, H2], List), !.
rpc_word_to_letter([H1], CurList, List) :- append(CurList, [H1], List), !.
rpc_word_to_letter([], List, List) :- !.
rpc_word_to_letter([H1|[H2|[H3|[H4|T]]]], CurList, List) :-
  ((H1 = 119, H2 = 111, H3 = 114, H4 = 100) ->
  (append(CurList, [108, 101, 116, 116, 101, 114], CurList1),
  rpc_word_to_letter(T, CurList1, List));
  (append(CurList, [H1], CurList1),
  rpc_word_to_letter([H2|[H3|[H4|T]]], CurList1, List))).
rpc_word_to_letter(List, NewList) :- rpc_word_to_letter(List, [], NewList).

task16 :-
  write("Str -> "),
  read_str_nofix(S),
  rpc_word_to_letter(S, NewS),
  write("New Str => ["),
  write_str(NewS),
  write("]").
% ������� 17
% ������� x, �� �������� ��� abc
rm_x_afterwhich_abc([H1, H2, H3], CurList, List) :- append(CurList, [H1, H2, H3], List), !.
rm_x_afterwhich_abc([H1, H2], CurList, List) :- append(CurList, [H1, H2], List), !.
rm_x_afterwhich_abc([H1], CurList, List) :- append(CurList, [H1], List), !.
rm_x_afterwhich_abc([], List, List) :- !.
rm_x_afterwhich_abc([H1|[H2|[H3|[H4|T]]]], CurList, List) :-
  ((H1 = 120, H2 = 97, H3 = 98, H4 = 99) ->
  (append(CurList, [H2, H3, H4], CurList1),
  rm_x_afterwhich_abc(T, CurList1, List));
  (append(CurList, [H1], CurList1),
  rm_x_afterwhich_abc([H2|[H3|[H4|T]]], CurList1, List))).
rm_x_afterwhich_abc(List, NewList) :- rm_x_afterwhich_abc(List, [], NewList).

task17 :-
  write("Str -> "),
  read_str_nofix(S),
  rm_x_afterwhich_abc(S, NewS),
  write("New Str => ["),
  write_str(NewS),
  write("]").

% ������� 18
% ������� abc, �� �������� ��� �����
rm_abc_afterwhich_digit([H1, H2, H3], CurList, List) :- append(CurList, [H1, H2, H3], List), !.
rm_abc_afterwhich_digit([H1, H2], CurList, List) :- append(CurList, [H1, H2], List), !.
rm_abc_afterwhich_digit([H1], CurList, List) :- append(CurList, [H1], List), !.
rm_abc_afterwhich_digit([], List, List) :- !.
rm_abc_afterwhich_digit([H1|[H2|[H3|[H4|T]]]], CurList, List) :-
  ((H1 = 97, H2 = 98, H3 = 99, H4 >= 48, H4 =< 57) ->
  (append(CurList, [H4], CurList1),
  rm_abc_afterwhich_digit(T, CurList1, List));
  (append(CurList, [H1], CurList1),
  rm_abc_afterwhich_digit([H2|[H3|[H4|T]]], CurList1, List))).
rm_abc_afterwhich_digit(List, NewList) :- rm_abc_afterwhich_digit(List, [], NewList).

task18 :-
  write("Str -> "),
  read_str_nofix(S),
  rm_abc_afterwhich_digit(S, NewS),
  write("New Str => ["),
  write_str(NewS),
  write("]").
% ������� 19
% ���������� ��������� aba � ������
count_aba_in_str([_, _], Count, Count) :- !.
count_aba_in_str([_], Count, Count) :- !.
count_aba_in_str([], Count, Count) :- !.
count_aba_in_str([H1|[H2|[H3|T]]], CurCount, Count) :-
  ((H1 = 97, H2 = 98, H3 = 97) ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_aba_in_str([H2|[H3|T]], CurCount1, Count).
count_aba_in_str(List, Count) :- count_aba_in_str(List, 0, Count).

task19 :-
  write("Str -> "),
  read_str_nofix(S),
  count_aba_in_str(S, Count),
  write("Count \'aba\' in str => "),
  write(Count).

% ������� 20
% �������� ������ ����
% ����� ����� ����������� ����� �� ������ � ������� ����� ���� ������
% ����� ���������� ����� ������ ������ �� ������
str_with1space([], Str, Str) :- write("Str hasn\'t words"), !.
str_with1space([H], CurStr, Str) :- append(CurStr, H, Str), !.
str_with1space([H|T], CurStr, Str) :-
  append(H, [32], H1),
  append(CurStr, H1, CurStr1),
  str_with1space(T, CurStr1, Str).
str_with1space(List, Str) :- str_with1space(List, [], Str).

task20 :-
  write("Str -> "),
  read_str_nofix(S),
  list_of_words(S, Words),
  str_with1space(Words, NewS),
  write("New Str => ["),
  write_str(NewS),
  write("]").

% ������� 21
% � ������ ������ �����
% �� ������ ����������� �������
% ���� ������ ������ �����������, ������ ��� - ������ ����� � ������� ����
% ���� ������ �����������, ������ ��� - ������ ������ � ������� ����
% ������ � �����:
% ���� ������� �� �����, �� ������ ������ �� S1 � �����
% ����� �������� ����� � ������ � ������, ���� ��� ��������
read_words_which_split_by_chrs1([], _, Word, CurList, List) :- append(CurList, [Word], List), !.
read_words_which_split_by_chrs1(SubStr, [], _, CurList, List) :- append(CurList, [SubStr], List), !.
read_words_which_split_by_chrs1([H1|T1], [H2|T2], Word, CurList, List) :-
  (H1 = H2 ->
  ((Word \= [] ->
  (append(CurList, [Word], CurList1),
  Word1 = []);
  (CurList1 = CurList,
  Word1 = [])), Flag = 0);
  (append(Word, [H1], Word1),
  CurList1 = CurList,
  Flag = 1)),
  (Flag = 0 ->
  read_words_which_split_by_chrs1(T1, T2, Word1, CurList1, List);
  read_words_which_split_by_chrs1(T1, [H2|T2], Word1, CurList1, List)).
read_words_which_split_by_chrs1(S1, S2, List) :- read_words_which_split_by_chrs1(S1, S2, [], [], List).

% ������ ���������� (� ������� ������� ����� ����� �������������)
read_splitwords_which([], _, Word, CurList, List) :- append(CurList, [Word], List), !.
read_splitwords_which(SubStr, [], _, CurList, List) :- append(CurList, [SubStr], List), !.
read_splitwords_which([H1|T1], [H2|T2], Word, CurList, List) :-
  (H1 = H2 ->
  (append(CurList, [Word], CurList1),
  Flag = 0, Word1 = []);
  (append(Word, [H1], Word1),
  CurList1 = CurList,
  Flag = 1)),
  (Flag = 0 ->
  read_splitwords_which(T1, T2, Word1, CurList1, List);
  read_splitwords_which(T1, [H2|T2], Word1, CurList1, List)).
read_splitwords_which(S1, S2, List) :- read_splitwords_which(S1, S2, [], [], List).

task21 :-
  write("Str1 -> "),
  read_str_nofix(S1),
  write("Str2 -> "),
  read_str_nofix(S2),
  read_splitwords_which(S1, S2, List),
  write_list_str(List).

% ������� 22
% ������� ������, ��������� � ������� (���� �� ����) �������
task22 :-
  write("Str -> "),
  read_str_nofix(S),
  count_elements(S, Count),
  ((0 is Count mod 2) ->
  (Flag = 0);
  (MidN is (1 + Count) / 2,
  ls_el_at_num(S, MidN, ElMid),
  Flag = 1)),
  ls_el_at_num(S, 1, Left),
  ls_el_at_num(S, Count, Right),
  (Flag = 1 ->
  NewS = [Left, Right, ElMid];
  NewS = [Left, Right]),
  write("New Str => ["),
  write_str(NewS),
  write("]").

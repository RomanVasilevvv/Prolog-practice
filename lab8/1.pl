% ÷èòàåì ñòðîêó íåôèêñèðîâàííîé äëèíû (ïîêà íå âñòðåòèì enter)
read_str_nofix(A) :-
  get0(X),
  r_str_nofix(X, A, []).
r_str_nofix(10, A, A) :- !.
r_str_nofix(-1, A, A) :- !.
r_str_nofix(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  r_str_nofix(X1, A, B1).

% ÷èòàåì ñòðîêó
read_str(A, N, Flag) :-
  get0(X),
  r_str(X, A, [], N, 0, Flag).
r_str(-1, A, A, N, N, 1) :- !.
r_str(10, A, A, N, N, 0) :- !.
r_str(X, A, B, N, K, Flag) :-
  K1 is K + 1,
  append(B, [X], B1),
  get0(X1),
  r_str(X1, A, B1, N, K1, Flag).

% âûâîäèì ñòðîêó
write_str([]) :- !.
write_str([H|Tail]) :-
  put(H),
  write_str(Tail).

% ÷èòàåì íàáîð ñòðîê
read_str_list(List) :-
  read_str(A, _, Flag),
  read_str_list([A], List, Flag).
read_str_list(List, List, 1) :- !.
read_str_list(Cur_list, List, 0):-
  read_str(A, _, Flag),
  append(Cur_list, [A], C_l),
  read_str_list(C_l, List, Flag).

% âûâîäèì íàáîð ñòðîê
writestr_list([]) :- !.
writestr_list([H|T]) :-
  write_str(H), nl,
  writestr_list(T).


see0 :- see('D:/Prolog-practice/lab8/1.txt').
tell0 :- tell('D:/Prolog-practice/lab8/2.txt').

% êîëè÷åñòâî ýëåìåíòîâ â ñïèñêå
count_els([], Count, Count) :- !.
count_els([_|T], CurCount, Count) :-
  CurCount1 is CurCount + 1,
  count_els(T, CurCount1, Count).
count_els(List, Count) :- count_els(List, 0, Count).

% äëèíà ìàêñèìàëüíîé ñòðîêè
max_line([], Max, Max) :- !.
max_line([BigH|BigT], CurMax, Max) :-
  count_els(BigH, Count),
  (Count > CurMax ->
  CurMax1 is Count;
  CurMax1 is CurMax),
  max_line(BigT, CurMax1, Max).
max_line(BigList, Max) :- max_line(BigList, 0, Max).

% êîëè÷åñòâî ïðîáåëîâ â ñòðîêå
count_probel([], Count, Count) :- !.
count_probel([H|T], CurCount, Count) :-
  (H = 32 ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_probel(T, CurCount1, Count).

% êîëè÷åñòâî ñòðîê áåç ïðîáåëîâ
count_lines_without_probel([], Count, Count) :- !.
count_lines_without_probel([BigH|BigT], CurCount, Count) :-
  ((count_probel(BigH, 0, C), C = 0) ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_lines_without_probel(BigT, CurCount1, Count).

% Çàäàíèå 1.1
t1_1 :-
  see0, read_str_list(List),
  max_line(List, Max),
  seen, write("Max length => "), write(Max).

% Çàäàíèå 1.2
t1_2 :-
  see0, read_str_list(List),
  count_lines_without_probel(List, 0, Count),
  seen, write("Count => "), write(Count).

% Çàäàíèå 1.3
% ôàéë â âèäå ëèñòà èç ñèìâîëîâ (ñîñòàâëÿåì èç íàáîðà ñòðîê)
file_list([], List, List) :- !.
file_list([H|T], CurList, List) :-
  append(CurList, H, CurList1),
  file_list(T, CurList1, List).
file_list(ListString, List) :- file_list(ListString, [], List).

% êîëè÷åñòâî çàäàííûõ ñèìâîëîâ â ëèñòå (çäåñü áóêâà A)
count_ch([], _, Count, Count) :- !.
count_ch([H|T], Chr, CurCount, Count) :-
  (H = Chr ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_ch(T, Chr, CurCount1, Count).
count_ch(List, Chr, Count) :- count_ch(List, Chr, 0, Count).
count_ch(List, Count) :- count_ch(List, 65, Count).

% ëèñò èç ñòðîê, ãäå êîë-âî áóêâ A áîëüøå ñðåäíåãî íà ôàéë
list_where_A_more_than_AVG([], _, List, List) :- !.
list_where_A_more_than_AVG([H|T], Count, CurList, List) :-
  count_ch(H, CurCount),
  (CurCount > Count ->
  append(CurList, [H], CurList1);
  CurList1 = CurList),
  list_where_A_more_than_AVG(T, Count, CurList1, List).
list_where_A_more_than_AVG(ListString, Count, List) :- list_where_A_more_than_AVG(ListString, Count, [], List).

t1_3 :-
  see0, read_str_list(ListString),
  file_list(ListString, List),
  count_ch(List, CountChr),
  count_els(ListString, CountString),
  (CountString \= 0 ->
  AVG is CountChr / CountString;
  fail),
  list_where_A_more_than_AVG(ListString, AVG, ListWhere),
  writestr_list(ListWhere), seen.

% Çàäàíèå 1.4
% ïîëó÷àåì ñòðîêó áåç ïåðâûõ ïðîáåëîâ
list_nofirstspaces([], []) :- !.
list_nofirstspaces([H|T], [H|T]) :- H \= 32, !.
list_nofirstspaces([_|T], NewList) :- list_nofirstspaces(T, NewList).

% ïîëó÷àåì ñëîâî äî ïåðâîãî ïðîáåëà (ðàáîòàåò, åñëè â íà÷àëå íåò ïðîáåëîâ)
firstword([], Word, Word) :- !.
firstword([H|_], Word, Word) :- H = 32, !.
firstword([H|T], CurWord, NewWord) :-
  append(CurWord, [H], CurWord1),
  firstword(T, CurWord1, NewWord).
firstword(List, Word) :- firstword(List, [], Word).

% ïîëó÷àåì ïåðâîå ñëîâî íåñìîòðÿ íà ïðîáåëû
firstword_nfs(List, Word) :-
  list_nofirstspaces(List, ListNFS),
  firstword(ListNFS, Word).

% ïîëó÷àåì ñïèñîê ñëîâ èç ñòðîêè
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

% ïîëó÷àåì ñïèñîê ñëîâ èç ôàéëà
list_of_words_file([], LWF, LWF) :- !.
list_of_words_file([H|T], CurLWF, LWF) :-
  list_of_words(H, LW),
  append(CurLWF, LW, CurLWF1),
  list_of_words_file(T, CurLWF1, LWF).
list_of_words_file(ListOfLines, LWF) :- list_of_words_file(ListOfLines, [], LWF).

% ÷èñëî ðàç, êîòîðîå ïîâòîðÿåòñÿ çàäàííûé ýëåìåíò â ñïèñêå
count_equals([], _, Count, Count) :- !.
count_equals([H|T], El, CurCount, Count) :-
  (H = El ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_equals(T, El, CurCount1, Count).
count_equals(List, El, Count) :- count_equals(List, El, 0, Count).

% ñëîâî, êîòîðîå âñòðå÷àåòñÿ ÷àùå âñåãî
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

t1_4 :-
  see0, read_str_list(List),
  list_of_words_file(List, LWF),
  regular_word(LWF, Word),
  write("Regular word => ["),
  write_str(Word),
  write("]"), seen.

% Çàäàíèå 1.5
% íîìåð ïåðâîãî âõîæäåíèÿ ýëåìåíòà
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

% íîìåð ýëåìåíòà â ñïèñêå
ls_el_at_num([], _, _, _) :- write("Such element isn\'t found"), !.
ls_el_at_num([_], CurNum, Num, _) :-
  CurNum1 is CurNum + 1,
  CurNum1 < Num,
  write("Such element isn\'t found"), !.
ls_el_at_num([H|T], CurNum, Num, El) :-
  CurNum1 is CurNum + 1,
  ((CurNum1 is Num) ->
  El = H;
  ls_el_at_num(T, CurNum1, Num, El)).
ls_el_at_num([H|T], Num, El) :- ls_el_at_num([H|T], 0, Num, El).

% åñòü ëè ýëåìåíò â ñïèñêå
in_ls([H|_], H) :- !.
in_ls([_|T], El) :- in_ls(T, El).

% ïîëó÷àåì ëèñò áåç ýëåìåíòà
rm_el([_|T], CurList, Num, Num, NewList) :- append(CurList, T, NewList), !.
rm_el([H|T], CurList, CurNum, Num, NewList) :-
  append(CurList, [H], CurList1),
  CurNum1 is CurNum + 1,
  rm_el(T, CurList1, CurNum1, Num, NewList).
rm_el(List, Num, NewList) :- rm_el(List, [], 1, Num, NewList).

% óäàëåíèå îäèíàêîâûõ ñ çàäàííûì ýëåìåíòîâ
rm_equals(List, El, List) :- not(in_ls(List, El)), !.
rm_equals(List, El, NewList) :-
  ls_num_el(List, El, Num),
  rm_el(List, Num, List1),
  rm_equals(List1, El, NewList).

% ïîëó÷àåì ëèñò èç óíèêàëüíûõ ýëåìåíòîâ
uni_list([], []) :- !.
uni_list([H|T], List) :-
  rm_equals(T, H, RmList),
  uni_list(RmList, List1),
  append([H], List1, List).

% ëèñò èç íåïîâòîðÿþùèõñÿ ýëåìåíòîâ
list_norepeat(_, [], List, List) :- !.
list_norepeat(BigList, [UniH|UniT], CurList, NewList) :-
  count_equals(BigList, UniH, Count),
  (Count = 1 ->
  append(CurList, [UniH], CurList1);
  CurList1 = CurList),
  list_norepeat(BigList, UniT, CurList1, NewList).
list_norepeat(BigList, UniList, NewList) :- list_norepeat(BigList, UniList, [], NewList).

t1_5 :-
  see0,
  read_str_list(ListStr),
  list_of_words_file(ListStr, LWF),
  uni_list(LWF, LWFUNI),
  list_norepeat(LWF, LWFUNI, LWFNR),
  seen,
  tell0,
  writestr_list(LWFNR),
  told.

% Çàäàíèå 3
% ïåðåâîäèì list â ãîä
list_to_year([X1, X2, X3, X4], Year) :-
  X11 is X1 - 48,
  X21 is X2 - 48,
  X31 is X3 - 48,
  X41 is X4 - 48,
  Year is (X11 * 1000 + X21 * 100 + X31 * 10 + X41).

% ñíà÷àëà ôàêòû (ìåñÿöû â ôîðìàòå: ÿíâàðÿ, ôåâðàëÿ, è ò ä)
month(1, L) :- L = [1113, 1085, 1074, 1072, 1088, 1103], !.
month(2, L) :- L = [1052, 1077, 1074, 1088, 1072, 1083, 1103], !.
month(3, L) :- L = [1084, 1072, 1088, 1090, 1072], !.
month(4, L) :- L = [1072, 1087, 1088, 1077, 1083, 1103], !.
month(5, L) :- L = [1084, 1072, 1103], !.
month(6, L) :- L = [1080, 1102, 1085, 1103], !.
month(7, L) :- L = [1080, 1102, 1083, 1103], !.
month(8, L) :- L = [1072, 1074, 1075, 1091, 1089, 1090, 1072], !.
month(9, L) :- L = [1089, 1077, 1085, 1090, 1103, 1073, 1088, 1103], !.
month(10, L) :- L = [1086, 1082, 1090, 1103, 1073, 1088, 1103], !.
month(11, L) :- L = [1085, 1086, 1103, 1073, 1088, 1103], !.
month(12, L) :- L = [1076, 1077, 1082, 1072, 1073, 1088, 1103], !.

% ôàêòû (äíè - äåíü/ìåñÿö/ãîä)
day([X1, X2], _, _) :- (X1 = 48, X2 >= 49, X2 =< 57), !.
day([X1, X2], _, _) :- (X1 = 49, X2 >= 48, X2 =< 57), !.
day([X1, X2], _, _) :- (X1 = 50, X2 >= 48, X2 =< 56), !.
day([X1, X2], M, Y) :- (X1 = 50, X2 = 57, M = 2, 0 is Y mod 4), !.
day([X1, X2], M, _) :- (X1 = 50, X2 = 57, M \= 2), !.
day([X1, X2], M, _) :- (X1 = 51, X2 = 48, M \= 2), !.
day([X1, X2], M, _) :- (X1 = 51, X2 = 49, (M = 1 | M = 3 | M = 5 | M = 7 | M = 8 | M = 10 | M = 12)), !.

% ãîä
year([X1, X2, X3, X4]) :- (X1 >= 48, X1 =< 57, X2 >= 48, X2 =< 57, X3 >= 48, X3 =< 57, X4 >= 48, X4 =< 57).

% ñîñòîèò ëè ñïèñîê òîëüêî èç ïðîáåëîâ
only_spaces([]) :- !.
only_spaces([H|T]) :-
  (H = 32 ->
  only_spaces(T);
  fail).

% ÷èòàåì ñïèñîê è èùåì ñîâïàäåíèå "28 ôåâðàëÿ 2005"
find_date_in_str([], Dates, Dates) :- !.
find_date_in_str(List, Dates, Dates) :- only_spaces(List), !.
find_date_in_str(List, Dates, Dates) :-
  list_of_words(List, Words),
  count_els(Words, Count),
  Count < 3, !.
find_date_in_str([D1|DT], CurDates, Dates) :-
  (([_|[D2|[32|ListNoDay]]] = [D1|DT],
  [D1, D2] = WordDay,
  firstword(ListNoDay, WordMonth),
  month(Month, WordMonth),
  append(WordMonth, ListNoMonth1, ListNoDay),
  append([32], ListNoMonth, ListNoMonth1),
  [Y1|[Y2|[Y3|[Y4|_]]]] = ListNoMonth,
  [Y1, Y2, Y3, Y4] = WordYear,
  year(WordYear),
  list_to_year(WordYear, Year),
  day(WordDay, Month, Year)
  ) ->
  (append(WordDay, [32], DS),
  append(DS, WordMonth, DSM),
  append(DSM, [32], DSMS),
  append(DSMS, WordYear, DSMSY),
  append(CurDates, [DSMSY], CurDates1),
  append([Y1, Y2], NewT, ListNoMonth),
  find_date_in_str(NewT, CurDates1, Dates));
  (find_date_in_str(DT, CurDates, Dates))).
find_date_in_str(Str, Dates) :- find_date_in_str(Str, [], Dates).

t3 :-
  write("Str -> "),
  read_str_nofix(S),
  find_date_in_str(S, Dates),
  write("Dates =>"), nl,
  writestr_list(Dates).

% Çàäàíèå 5
% ïîëó÷àåì ñïèñîê äëèí ñòðîê
list_lengths([], List, List) :- !.
list_lengths([H|T], CurList, List) :-
  count_els(H, Count),
  append(CurList, [Count], CurList1),
  list_lengths(T, CurList1, List).
list_lengths(ListStrs, ListLengths) :- list_lengths(ListStrs, [], ListLengths).

% ìèíèìàëüíûé ýëåìåíò â ñïèñêå
min_down([], Min, Min) :- !.
min_down([H|T], CurMin, Min) :-
  (H < CurMin ->
  CurMin1 is H;
  CurMin1 is CurMin),
  min_down(T, CurMin1, Min).
min_down([H|T], Min) :- min_down(T, H, Min).

% óïîðÿäî÷èâàåì ñïèñîê ñòðîê ïî èõ äëèíå
sort_strs_by_length([], [], List, List) :- !.
sort_strs_by_length(ListStrs, ListLengths, CurList, List) :-
  min_down(ListLengths, Min),
  ls_num_el(ListLengths, Min, Num),
  ls_el_at_num(ListStrs, Num, El),
  append(CurList, [El], CurList1),
  rm_el(ListStrs, Num, ListStrs1),
  rm_el(ListLengths, Num, ListLengths1),
  sort_strs_by_length(ListStrs1, ListLengths1, CurList1, List).
sort_strs_by_length(ListStrs, NewListStrs) :-
  list_lengths(ListStrs, ListLengths),
  sort_strs_by_length(ListStrs, ListLengths, [], NewListStrs).

% Êîäèðîâêà ANSI âåçäå
t5 :-
  see0,
  read_str_list(ListStr),
  sort_strs_by_length(ListStr, NewListStr),
  seen,
  tell0,
  writestr_list(NewListStr),
  told.

% Çàäàíèå 6
% ñ÷èòàåì êîëè÷åñòâî ñëîâ
% óáèðàåì ïåðâûå ïðîáåëû
% åñëè íîâûé ñïèñîê íå ïóñòîé, óáèðàåì ñëîâî, ñ÷èòàåì + 1
% èíà÷å ñëîâ íå îñòàëîñü, íè÷åãî íå ñ÷èòàåì
% êèäàåì íîâûé ListNoFirstWord èëè ñ (ïðîáåëàìè + ñëîâàìè), èëè ïóñòîé
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

% ïîëó÷àåì ñïèñîê êîëè÷åñòâà ñëîâ â êàæäîé ñòðîêå
list_of_count_words([], List, List) :- !.
list_of_count_words([H|T], CurList, List) :-
  count_words(H, Count),
  append(CurList, [Count], CurList1),
  list_of_count_words(T, CurList1, List).
list_of_count_words(ListStrs, ListCounts) :- list_of_count_words(ListStrs, [], ListCounts).

% ñîðòèðóåì ïî êîëè÷åñòâó ñëîâ
sort_strs_by_count(ListStrs, NewListStrs) :-
  list_of_count_words(ListStrs, ListCounts),
  sort_strs_by_length(ListStrs, ListCounts, [], NewListStrs).

t6 :-
  see0,
  read_str_list(ListStr),
  sort_strs_by_count(ListStr, NewListStr),
  seen,
  tell0,
  writestr_list(NewListStr),
  told.

% Çàäàíèå 7
% ïðîâåðêà ñëîâà íà ÷èñëî
check_for_num([]) :- !.
check_for_num([H|T]) :-
  (H >= 48, H =< 57),
  check_for_num(T).

% êîëè÷åñòâî ñëîâ, èäóùèõ ïîñëå ÷èñåë â ñïèñêå
count_words_after_num([_], Count, Count) :- !.
count_words_after_num([], Count, Count) :- !.
count_words_after_num([H|T], CurCount, Count) :-
  ((check_for_num(H)) ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_words_after_num(T, CurCount1, Count).
count_words_after_num(List, Count) :-
  list_of_words(List, Words),
  count_words_after_num(Words, 0, Count).

% ïîëó÷àåì ñïèñîê êîëè÷åñòâà ñëîâ, èäóùèõ ïîñëå ÷èñåë â êàæäîì ñïèñêå
list_count_after_num([], List, List) :- !.
list_count_after_num([H|T], CurList, List) :-
  count_words_after_num(H, Count),
  append(CurList, [Count], CurList1),
  list_count_after_num(T, CurList1, List).
list_count_after_num(ListStrs, ListCounts) :- list_count_after_num(ListStrs, [], ListCounts).

% ñîðòèðóåì ïî êîëè÷åñòâó ñëîâ, èäóùèõ ïîñëå ÷èñåë â êàæäîì ñïèñêå
sort_strs_by_count_words_after_num(ListStrs, NewListStrs) :-
  list_count_after_num(ListStrs, ListCounts),
  sort_strs_by_length(ListStrs, ListCounts, [], NewListStrs).

t7 :-
  see0,
  read_str_list(ListStr),
  list_count_after_num(ListStr, Counts),
  write(Counts),
  sort_strs_by_count_words_after_num(ListStr, NewListStr),
  seen,
  tell0,
  writestr_list(NewListStr),
  told.

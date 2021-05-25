read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

append1([],List2,List2).
append1([H1|T1],List2,[H1|T3]):-append1(T1,List2,T3).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-read_str(A,_,Flag),append(Cur_list,[A],C_l),
								read_list_str(C_l,List,Flag).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).


%Задание 1 Решить 6 задач. Результат записывать в файл.
%Дано множество. Построить все размещения с повторениями по k
%элементов.
%Дано множество. Построить все перестановки.
%Дано множество. Построить все размещения по k элементов.
%Дано множество. Построить все подмножества.
%Дано множество. Построить все сочетания по k элементов.
%Дано множество. Построить все сочетания с повторениями.

razm_pov:-read_str(A,_),read(K),tell('D:/Prolog-practice/lab9/111.txt'),
				  not(b_a_rp(A,K,[])),told.

b_a_rp(_,0,Perm1):-write_str(Perm1),nl,!,false.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

perestanovki:-read_str(A,_),tell('D:/Prolog-practice/lab9/111.txt'),
				not(b_a_p(A,[])),told.

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_p([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p(A,Perm):-in_list_exlude(A,El,A1),b_a_p(A1,[El|Perm]).

razm:-read_str(A,_),read(K),tell('D:/Prolog-practice/lab9/111.txt'),
				not(b_a_r(A,K,[])),told.

b_a_r(_,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,N,Perm):-in_list_exlude(A,El,A1),N1 is N-1,b_a_r(A1,N1,[El|Perm]).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).
pr_subset(A):-sub_set(B,A),write_str(B),nl,fail.
all_subset:-read_str(A,_),tell('D:/Prolog-practice/lab9/111.txt'),
				not(pr_subset(A)),told.

sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).
pr_sochet(A,K):-sochet(B,K,A),write_str(B),nl,fail.
all_sochet:-read_str(A,_),read(K),tell('D:/Prolog-practice/lab9/111.txt'),
				not(pr_sochet(A,K)),told.

sochet_p([],0,_):-!.
sochet_p([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet_p(Sub_set,K1,[H|Set]).
sochet_p(Sub_set,K,[_|Set]):-sochet_p(Sub_set,K,Set).
pr_sochet_p(A,K):-sochet_p(B,K,A),write_str(B),nl,fail.
all_sochet_povtor:-read_str(A,_),read(K),tell('D:/Prolog-practice/lab9/111.txt'),
			not(pr_sochet_p(A,K)),told.

%Задание 2 Дано множество {a,b,c,d,e,f}. Построить все слова длины 5, в
%которых ровно две буквы a. Вывод в файл.

make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).

razm_p:-tell('D:/Prolog-practice/lab9/111.txt'),not(razm_P),told.
razm_P:-make_ar(5,Pos),sochet(Pos_a,2,Pos),put_p(Word,Pos_a,[97]),
in_list([98,99,100,101,102],S1), in_free_p(Word,S1), in_list([98,99,100,101,102],S2),in_free_p(Word,S2),in_list([98,99,100,101,102],S3),in_free_p(Word,S3),
write_str(Word),nl,fail.

put_p(Word,[Head1,Head2],[Sim]):-select_p(Word,Head1,Sim),
select_p(Word,Head2,Sim).

select_p(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_],!);
(Head is 2->Word=[_,Sim,_,_,_],!);(Head is 3->Word=[_,_,Sim,_,_],!);(Head is 4->Word=[_,_,_,Sim,_],!);(Head is 5->Word=[_,_,_,_,Sim]).

in_free_p([H1,H2,H3,H4,H5],Sim):-(var(H1)->H1 is Sim),!;
(var(H2)->H2 is Sim),!;(var(H3)->H3 is Sim),!; (var(H4)->H4 is Sim),!;(var(H5)->H5 is Sim).

%Задание 3 Дано множество {a,b,c,d,e,f}. Построить все слова длины 5, в
%которых ровно 2 буквы a, остальные буквы не повторяются. Вывод в файл.
razmeshchen:-tell('D:/Prolog-practice/lab9/111.txt'),not(razmeshchen_1),told.
razmeshchen_1:-make_ar(5,Pos),sochet(Pos_a,2,Pos),put_p(Word,Pos_a,[97]),
		 in_list_exlude([98,99,100,101,102],S1,NList),
		 in_free_p(Word,S1),
		 in_list_exlude(NList,S2,NList1),
		 in_free_p(Word,S2),
		 in_list_exlude(NList1,S3,_),
		 in_free_p(Word,S3),
		 write_str(Word),nl,fail.

%Задание 4 Дано множество {a,b,c,d,e,f}. Построить все слова длины 5, в
%которых ровно одна буква повторяется 2 раза, остальные буквы не
%повторяются. Вывод в файл.

one_character_2_times:-tell('D:/Prolog-practice/lab9/111.txt'),not(one_character_2_times_),told.
one_character_2_times_:-make_ar(5,Pos),sochet(Pos_simb,2,Pos),in_list([97,98,99,100,101,102],Simbol),
		 put_p(Word,Pos_simb,[Simbol]),in_list_exlude([97,98,99,100,101,102],Simbol,List),
		 in_list_exlude(List,S1,NList),
		 in_free_p(Word,S1),
		 in_list_exlude(NList,S2,NList1),
		 in_free_p(Word,S2),
		 in_list_exlude(NList1,S3,_),
		 in_free_p(Word,S3),
		 write_str(Word),nl,fail.

%Задание 5 Дано множество {a,b,c,d,e,f}. Построить все слова длины 6, в
%которых ровно 2 буквы повторяются 2 раза, остальные буквы не
%повторяются. Вывод в файл.

two_characters_2_times:-tell('D:/Prolog-practice/lab9/111.txt'),not(two_characters_2_times_),told.
two_characters_2_times_:-make_ar(6,Pos),sochet([H1,H2],2,Pos),in_list([97,98,99,100,101,102],Simbol1),
		 put_pos(Word,[H1,H2],[Simbol1]),in_list_exlude([97,98,99,100,101,102],Simbol1,NList),
		 in_list_exlude(Pos,H1,NPos),in_list_exlude(NPos,H2,NNPos),
		 sochet(Pos_,2,NNPos),in_list(NList,Simbol2),put_pos(Word,Pos_,[Simbol2]),
		 in_list_exlude(NList,Simbol2,LastSimbol),
		 in_list_exlude(LastSimbol,S1,LastSimbol1),
		 in_free_p6(Word,S1),
		 in_list_exlude(LastSimbol1,S2,_),
		 in_free_p6(Word,S2),
		 write_str(Word),nl,fail.

put_pos(Word,[Head1,Head2],[Sim]):-select_pos(Word,Head1,Sim),
select_pos(Word,Head2,Sim).

select_pos(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_],!);
(Head is 2->Word=[_,Sim,_,_,_,_],!);
(Head is 3->Word=[_,_,Sim,_,_,_],!);
(Head is 4->Word=[_,_,_,Sim,_,_],!);
(Head is 5->Word=[_,_,_,_,Sim,_],!);
(Head is 6->Word=[_,_,_,_,_,Sim]).

in_free_p6([H1,H2,H3,H4,H5,H6],Sim):-(var(H1)->H1 is Sim),!;
(var(H2)->H2 is Sim),!;
(var(H3)->H3 is Sim),!;
(var(H4)->H4 is Sim),!;
(var(H5)->H5 is Sim),!;
(var(H6)->H6 is Sim).
%Задание 6 Дано множество {a,b,c,d,e,f}. Построить все слова длины 7, в
%которых ровно 1 буква повторяются 2 раза, ровно одна буква повторяется
%3 раза остальные буквы не повторяются. Вывод в файл.

length_7_1_letter_2_times:-tell('D:/Prolog-practice/lab9/111.txt'),not(length_7_1_letter_2_times_),told.
length_7_1_letter_2_times_:-make_ar(7,Pos),sochet([H1,H2],2,Pos),in_list([97,98,99,100,101,102],Simbol1), %выбрали 2 позиции в слове и символ на эту позицию
put_pos7(Word,[H1,H2],[Simbol1]), %put pos  ставит на выбранные позиции символ,
in_list_exlude([97,98,99,100,101,102],Simbol1,NList),in_list_exlude(Pos,H1,NPos),in_list_exlude(NPos,H2,NNPos),% убрали сивол из списка символов и из списка мест убрали 2 позиции из предыдущего шага
sochet(Pos_,3,NNPos),in_list(NList,Simbol2),put_pos73(Word,Pos_,[Simbol2]),% выбрали 2 места под второй символб выбрали второй символ и поставили его на эти 2 места
		 in_list_exlude(NList,Simbol2,LastSimbol),%убрали второй сивол из списка
		 in_list_exlude(LastSimbol,S1,LastSimbol1),%выбрали и убрали третий символ
		 in_free_pos7(Word,S1),% поставили третий символ
		 in_list_exlude(LastSimbol1,S2,_),%выбрали и убрали четвертый символ
		 in_free_pos7(Word,S2),% поставили четвертый символ
		 write_str(Word),nl,fail.

put_pos7(Word,[Head1,Head2],[Sim]):-select_pos7(Word,Head1,Sim),select_pos7(Word,Head2,Sim).
select_pos7(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_],!);
							(Head is 2->Word=[_,Sim,_,_,_,_,_],!);
							(Head is 3->Word=[_,_,Sim,_,_,_,_],!);
							(Head is 4->Word=[_,_,_,Sim,_,_,_],!);
							(Head is 5->Word=[_,_,_,_,Sim,_,_],!);
							(Head is 6->Word=[_,_,_,_,_,Sim,_],!);
							(Head is 7->Word=[_,_,_,_,_,_,Sim]).

put_pos73(Word,[Head1,Head2, Head3],[Sim]):-select_pos7(Word,Head1,Sim),select_pos7(Word,Head2,Sim), select_pos7(Word,Head3,Sim).
select_pos7(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_],!);
							(Head is 2->Word=[_,Sim,_,_,_,_,_],!);
							(Head is 3->Word=[_,_,Sim,_,_,_,_],!);
							(Head is 4->Word=[_,_,_,Sim,_,_,_],!);
							(Head is 5->Word=[_,_,_,_,Sim,_,_],!);
							(Head is 6->Word=[_,_,_,_,_,Sim,_],!);
							(Head is 7->Word=[_,_,_,_,_,_,Sim]).

in_free_pos7([H1,H2,H3,H4,H5,H6,H7],Sim):-(var(H1)->H1 is Sim),!;
				  (var(H2)->H2 is Sim),!;
				  (var(H3)->H3 is Sim),!;
				  (var(H4)->H4 is Sim),!;
				  (var(H5)->H5 is Sim),!;
				  (var(H6)->H6 is Sim),!;
				  (var(H7)->H7 is Sim).


%Задание 7 Дано множество {a,b,c,d,e,f}. Построить все слова длины 9, в
%которых ровно 2 буквы повторяются 2 раза, ровно одна буква повторяется
%три раза, остальные буквы не повторяются. Вывод в файл.

length_9_2_letter_2_times:-tell('D:/Prolog-practice/lab9/111.txt'),not(length_9_2_letter_2_times_),told.
length_9_2_letter_2_times_:-make_ar(9,Pos),sochet([H1,H2],2,Pos),in_list([97,98,99,100,101,102],Simbol1), %выбрали 2 позиции в слове и символ на эту позицию
put_pos9(Word,[H1,H2],[Simbol1]), %put pos  ставит на выбранные позиции символ,

in_list_exlude([97,98,99,100,101,102],Simbol1,NList),in_list_exlude(Pos,H1,NPos),in_list_exlude(NPos,H2,NNPos),% убрали сивол из списка символов и из списка мест убрали 2 позиции из предыдущего шага

sochet([H3, H4],2,NNPos),in_list(NList,Simbol2),put_pos9(Word,[H3,H4],[Simbol2]),% выбрали 2 места под второй символ выбрали второй символ и поставили его на эти 2 места

in_list_exlude(NList,Simbol2,NList_),in_list_exlude(NNPos,H3,EPos),in_list_exlude(EPos,H4,Pos_),% убрали второй символ и места из под него

sochet(Pos1_,3,Pos_),in_list_exlude(NList_,Simbol3, LastSimbol),put_pos93(Word,Pos1_,[Simbol3]),%выбрали 3 места под третий символ и поставили его
		 in_list_exlude(LastSimbol,S1,LastSimbol1),%выбрали и убрали 4 третий символ
		 in_free_pos9(Word,S1),% поставили 4 символ
		 in_list_exlude(LastSimbol1,S2,_),%выбрали и убрали 5 символ
		 in_free_pos9(Word,S2),% поставили 5 символ
		 write_str(Word),nl,fail.

put_pos9(Word,[Head1,Head2],[Sim]):-select_pos9(Word,Head1,Sim),select_pos9(Word,Head2,Sim).
select_pos9(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_,_,_],!);
							(Head is 2->Word=[_,Sim,_,_,_,_,_,_,_],!);
							(Head is 3->Word=[_,_,Sim,_,_,_,_,_,_],!);
							(Head is 4->Word=[_,_,_,Sim,_,_,_,_,_],!);
							(Head is 5->Word=[_,_,_,_,Sim,_,_,_,_],!);
							(Head is 6->Word=[_,_,_,_,_,Sim,_,_,_],!);
							(Head is 7->Word=[_,_,_,_,_,_,Sim,_,_],!);
							(Head is 8->Word=[_,_,_,_,_,_,_,Sim,_],!);
							(Head is 9->Word=[_,_,_,_,_,_,_,_,Sim]).

put_pos93(Word,[Head1,Head2,Head3],[Sim]):-select_pos9(Word,Head1,Sim),select_pos9(Word,Head2,Sim), select_pos9(Word,Head3,Sim).
select_pos9(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_,_,_],!);
							(Head is 2->Word=[_,Sim,_,_,_,_,_,_,_],!);
							(Head is 3->Word=[_,_,Sim,_,_,_,_,_,_],!);
							(Head is 4->Word=[_,_,_,Sim,_,_,_,_,_],!);
							(Head is 5->Word=[_,_,_,_,Sim,_,_,_,_],!);
							(Head is 6->Word=[_,_,_,_,_,Sim,_,_,_],!);
							(Head is 7->Word=[_,_,_,_,_,_,Sim,_,_],!);
							(Head is 8->Word=[_,_,_,_,_,_,_,Sim,_],!);
							(Head is 9->Word=[_,_,_,_,_,_,_,_,Sim]).

in_free_pos9([H1,H2,H3,H4,H5,H6,H7,H8,H9],Sim):-(var(H1)->H1 is Sim),!;
				  (var(H2)->H2 is Sim),!;
				  (var(H3)->H3 is Sim),!;
				  (var(H4)->H4 is Sim),!;
				  (var(H5)->H5 is Sim),!;
				  (var(H6)->H6 is Sim),!;
				  (var(H7)->H7 is Sim),!;
				  (var(H8)->H8 is Sim),!;
				  (var(H9)->H9 is Sim).
%Задание 9 Дано множество {a,b,c,d,e,f}. Построить все слова длины 7, в
%которых больше двух букв а. Вывод в файл.

length_4_is_greater_than_2_a:-tell('D:/Prolog-practice/lab9/111.txt'),not(length_4_is_greater_than_2_a_),nl,told.
length_4_is_greater_than_2_a_:-make_ar(7,Pos),sochet(Pos_a,3,Pos),put_pos73(Word,Pos_a,[97]),
		 in_list([97,98,99,100,101,102],S1),
		 in_free_pos7(Word,S1),
		 in_list([97,98,99,100,101,102],S2),
		 in_free_pos7(Word,S2),
		 in_list([97,98,99,100,101,102],S3),
		 in_free_pos7(Word,S3),
		 in_list([97,98,99,100,101,102],S3),
		 in_free_pos7(Word,S3),
		 write_str(Word),nl,fail.

number_7:-tell('D:/Prolog-practice/lab9/111.txt'),not(number_7_),told.
number_7_:-make_ar(9,Pos),sochet([H1,H2],2,Pos),in_list([97,98,99,100,101,102],Simbol1), %выбрали 2 позиции в слове и символ на эту позицию
put_pos9(Word,[H1,H2],[Simbol1]), %put pos  ставит на выбранные позиции символ,

in_list_exlude([97,98,99,100,101,102],Simbol1,NList),in_list_exlude(Pos,H1,NPos),in_list_exlude(NPos,H2,NNPos),% убрали сивол из списка символов и из списка мест убрали 2 позиции из предыдущего шага

sochet([H3, H4],2,NNPos),in_list(NList,Simbol2),put_pos9(Word,[H3,H4],[Simbol2]),% выбрали 2 места под второй символ выбрали второй символ и поставили его на эти 2 места

in_list_exlude(NList,Simbol2,NList_),in_list_exlude(NNPos,H3,EPos),in_list_exlude(EPos,H4,Pos_),% убрали второй символ и места из под него

sochet(Pos1_,3,Pos_),in_list_exlude(NList_,Simbol3, LastSimbol),put_pos93(Word,Pos1_,[Simbol3]),%выбрали 3 места под третий символ и поставили его
		 in_list_exlude(LastSimbol,S1,LastSimbol1),%выбрали и убрали 4 третий символ
		 in_free_pos9(Word,S1),% поставили 4 символ
		 in_list_exlude(LastSimbol1,S2,_),%выбрали и убрали 5 символ
		 in_free_pos9(Word,S2),% поставили 5 символ
		 write_str(Word),nl,fail.

put_pos9(Word,[Head1,Head2],[Sim]):-select_pos9(Word,Head1,Sim),select_pos9(Word,Head2,Sim).
select_pos9(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_,_,_],!);
							(Head is 2->Word=[_,Sim,_,_,_,_,_,_,_],!);
							(Head is 3->Word=[_,_,Sim,_,_,_,_,_,_],!);
							(Head is 4->Word=[_,_,_,Sim,_,_,_,_,_],!);
							(Head is 5->Word=[_,_,_,_,Sim,_,_,_,_],!);
							(Head is 6->Word=[_,_,_,_,_,Sim,_,_,_],!);
							(Head is 7->Word=[_,_,_,_,_,_,Sim,_,_],!);
							(Head is 8->Word=[_,_,_,_,_,_,_,Sim,_],!);
							(Head is 9->Word=[_,_,_,_,_,_,_,_,Sim]).

put_pos93(Word,[Head1,Head2,Head3],[Sim]):-select_pos9(Word,Head1,Sim),select_pos9(Word,Head2,Sim), select_pos9(Word,Head3,Sim).
select_pos9(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_,_,_],!);
							(Head is 2->Word=[_,Sim,_,_,_,_,_,_,_],!);
							(Head is 3->Word=[_,_,Sim,_,_,_,_,_,_],!);
							(Head is 4->Word=[_,_,_,Sim,_,_,_,_,_],!);
							(Head is 5->Word=[_,_,_,_,Sim,_,_,_,_],!);
							(Head is 6->Word=[_,_,_,_,_,Sim,_,_,_],!);
							(Head is 7->Word=[_,_,_,_,_,_,Sim,_,_],!);
							(Head is 8->Word=[_,_,_,_,_,_,_,Sim,_],!);
							(Head is 9->Word=[_,_,_,_,_,_,_,_,Sim]).

in_free_pos9([H1,H2,H3,H4,H5,H6,H7,H8,H9],Sim):-(var(H1)->H1 is Sim),!;
				  (var(H2)->H2 is Sim),!;
				  (var(H3)->H3 is Sim),!;
				  (var(H4)->H4 is Sim),!;
				  (var(H5)->H5 is Sim),!;
				  (var(H6)->H6 is Sim),!;
				  (var(H7)->H7 is Sim),!;
				  (var(H8)->H8 is Sim),!;
				  (var(H9)->H9 is Sim).


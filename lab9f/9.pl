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



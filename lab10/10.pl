read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

% 1 Äàíî äâà ñìåøàííûõ ãğàôà, äëÿ êîòîğûõ îáÿçàòåëüíî óêàçàíîìíîæåñòâî
% âåğøèí. Ïîñòğîèòü îáúåäèíåíèå, ïåğåñå÷åíèå è ñóììó ïî ìîäóëş äâà ıòèõ
% ãğàôîâ.
ob_per_sum:-write("1 ãğàô"),nl,get_Ver(V1),nl,get_edges(V1,E1),write("2 ãğàô"),nl,get_Ver(V2),nl,get_edges(V2,E2),write("1 ãğàô: "),write(V1),write(E1),nl,write("2 2 Ãğàô: "),write(V2),write(E2),nl,nl,write("îáúåäèíåíèå:"),nl,union(V1,V2,E1,E2),nl,write("Ïåğåñå÷åíèå:"),nl,intersection(V1,V2,E1,E2),nl,write("ñóììà ïî ìîäóëş 2:"),nl,sum(V1,V2,E1,E2).

get_Ver(V):-nl,write("êîëè÷åñòâî âåğøèí = "),read(N),nl,write("âåğøèíû: "),nl,N1 is N+1,get_Ver([_|V],N1).
get_Ver([],0):-!.
get_Ver([H|T],N):-read_str(X,_),name(H,X),N1 is N-1,get_Ver(T,N1).

get_edges(V,E):-nl,write("êîëè÷åñòâî ğåáåğ = "),read(M),nl,write("Íà÷àëî ğåáğà: "),nl,get0(X),get_edges(V,E,[],M,0).
get_edges(_,E,E,M,M):-!.
get_edges(V,E,Edges,M,Count):-get_edge(V,Edge),append(Edges,[Edge],E1),Count1 is Count+1,get_edges(V,E,E1,M,Count1).

get_edge(V,[V1,V2]):-write("êîíåö ğåáğà:"),nl,read_str(X,_),name(V1,X),check_ver(V,V1),read_str(Y,_),name(V2,Y),check_ver(V,V2).

check_ver([V1|_],V1):-!.
check_ver([_|T],V1):-check_ver(T,V1).

in_list([El|_],El):-!.
in_list([_|L],El):-in_list(L,El),!.

union(V1,V2,E1,E2):-u_vertexes(V1,V2,V3),u_edges(E1,E2,E3),write("âåğøèíû:"),write(V3),nl,write("ğåáğà:"),nl,write(E3),nl.

u_vertexes(V,[],V):-!.
u_vertexes(V1,[H|V2],V3):-not(in_list(V1,H))->append(V1,[H],V),u_vertexes(V,V2,V3),!.
u_vertexes(V1,[_|V2],V3):-u_vertexes(V1,V2,V3),!.

u_edges(E,[],E):-!.
u_edges(E1,[H|E2],E3):-not(in_list(E1,H))->append(E1,[H],E),u_edges(E,E2,E3),!.
u_edges(E1,[_|E2],E3):-u_edges(E1,E2,E3),!.

intersection(V1,V2,E1,E2):-i_vertexes(V1,V2,V3),i_edges(E1,E2,E3),write("Ğ²ĞµÑ€ÑˆĞ¸Ğ½Ñ‹:"),write(V3),nl,write("Ñ€ĞµĞ±Ñ€Ğ°:"),nl,write(E3),nl.

i_vertexes(_,[],[]):-!.
i_vertexes(V1,[H|V2],[H|V3]):-in_list(V1,H)->i_vertexes(V1,V2,V3),!.
i_vertexes(V1,[_|V2],V3):-i_vertexes(V1,V2,V3),!.

i_edges(_,[],[]):-!.
i_edges(E1,[H|E2],[H|E3]):-in_list(E1,H)->i_edges(E1,E2,E3),!.
i_edges(E1,[_|E2],E3):-i_edges(E1,E2,E3),!.

sum(V1,V2,E1,E2):-s_vertexes(V1,V2,V3),s_edges(E1,E2,E3),write("âåğøèíû:"),write(V3),nl,write("ğåáğà:"),nl,write(E3).

s_vertexes(V1,V2,V3):-s_vertexes1(V1,V2,V31),s_vertexes1(V2,V1,V32),append(V31,V32,V3).
s_vertexes1(_,[],[]):-!.
s_vertexes1(V1,[H|V2],[H|V3]):-not(in_list(V1,H))->s_vertexes1(V1,V2,V3),!.
s_vertexes1(V1,[_|V2],V3):-s_vertexes1(V1,V2,V3),!.

s_edges(E1,E2,E3):-s_edges1(E1,E2,E31),s_edges1(E2,E1,E32),append(E31,E32,E3).
s_edges1(_,[],[]):-!.
s_edges1(E1,[H|E2],[H|E3]):-not(in_list(E1,H))->s_edges1(E1,E2,E3),!.
s_edges1(E1,[_|E2],E3):-s_edges1(E1,E2,E3),!.


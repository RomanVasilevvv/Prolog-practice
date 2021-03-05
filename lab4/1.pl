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

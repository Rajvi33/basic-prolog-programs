% File 2 : hanoi.pl

% Solving the Tower of Hanoi puzzle.
% Uses a, b, c as peg names.
% Prints moves like “Move a to b.” using write/nl.
% Goal form: hanoi(X, a, c, b)
% ------------------------------------

% Base case: only one disk — move it directly.
hanoi(1, From, To, _) :-
    write('Move '), write(From), write(' to '), write(To), write('.'), nl.

% Recursive case: move N disks.
hanoi(N, From, To, Aux) :-
    N > 1,
    M is N - 1,
    hanoi(M, From, Aux, To),   % Move top N-1 disks to Aux peg
    hanoi(1, From, To, _),     % Move largest disk to destination
    hanoi(M, Aux, To, From).   % Move N-1 disks from Aux to destination

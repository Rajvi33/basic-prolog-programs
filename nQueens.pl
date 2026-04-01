% File 6: nQueens.pl

% queens(N, Qs): Tail-recursive N-Queens solver.
% Qs is a list of length N where Qs[i] is the row of the queen
% in column i (1-based).
% -------------------------------------------------------------

queens(N, Qs) :-
    integer(N), N >= 1,
    numlist(1, N, Rows),
    place(Rows, [], Qs).

% place(+RemainingRows, +AccReversed, -Solution)
place([], Acc, Qs) :-
    reverse(Acc, Qs).
place(Rows, Acc, Qs) :-
    select(R, Rows, Rest),        % choose a row for the next column
    nq_safe(R, Acc, 1),           % check against already placed queens
    place(Rest, [R|Acc], Qs).

% nq_safe(+Row, +PlacedReversed, +DiagOffset)
nq_safe(_, [], _).
nq_safe(R, [Q|Qs], D) :-
    R =\= Q,                      % not same row
    abs(R - Q) =\= D,             % not same diagonal
    D1 is D + 1,
    nq_safe(R, Qs, D1).



% File 4: combination.pl

% combination(K, List, L)
%  - K: number of elements to choose (K >= 0)
%  - List: source list
%  - L: one K-sized combination (via backtracking)
% ------------------------------------------------

% Base: choose 0 -> empty list.
combination(0, _List, []).

% Include head H, choose K-1 from tail T.
combination(K, [H|T], [H|L]) :-
    K > 0,
    K1 is K - 1,
    combination(K1, T, L).

% Exclude head, still need K from tail.
combination(K, [_|T], L) :-
    K > 0,
    combination(K, T, L).

% File 7 : goldbach.pl

% goldbach(N, L) :
%   Given an even integer N > 2, find two prime numbers that sum to N.
%   Returns pairs through backtracking, e.g.
% ---------------------------------------------

% main predicate
goldbach(N, [P1, P2]) :-
    integer(N), N > 2, 0 is N mod 2,     % even number check
    between(2, N, P1),
    is_prime(P1),
    P2 is N - P1,
    P2 >= P1,                            % avoid reversed duplicates
    is_prime(P2).

% checking for prime
is_prime(2).
is_prime(3).
is_prime(P) :-
    integer(P), P > 3, P mod 2 =\= 0,
    \+ has_factor(P, 3).

% tail-recursive factor check
has_factor(N, F) :-
    F * F =< N,
    (N mod F =:= 0 ;
     F2 is F + 2,
     has_factor(N, F2)).

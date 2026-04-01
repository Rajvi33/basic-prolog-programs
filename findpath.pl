% File 1: findpath.pl

% Finds a path in an UNDIRECTED weighted graph between two nodes.
% Uses edge(A,B,W) facts defined in verifier.pl
% Avoids cyclic paths and prints total weight of each valid path.
% Goal form: findpath(X, Y, Weight, Path)
% ------------------------------------

findpath(R, J, A, Path) :-
    dfs(R, J, [R], 0, A, Rev),
    reverse(Rev, Path),
    % print each result.
    write('Path = '), write(Path), nl,
    write('Weight = '), write(A), nl.

% Base case: reached the destination
dfs(J, J, Acc, A, A, Acc).

% Step case: explore the new neighbor, avoid cycles, accumulate the weight
dfs(Cur, J, Acc, A0, A, Path) :-
    undirected_edge(Cur, Next, W),
    \+ member(Next, Acc),        
    A1 is A0 + W,                
    dfs(Next, J, [Next|Acc], A1, A, Path).

% Treat edge/3 as undirected
undirected_edge(X, Y, W) :- edge(X, Y, W).
undirected_edge(X, Y, W) :- edge(Y, X, W).


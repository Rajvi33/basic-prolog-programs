
% File 5 : map.pl

% color_map(-L)
% Colors the map so that no adjacent regions share the same color.
% -------------------------------------------------------------

% Two regions are adjacent if there is an edge between them.
adjacent(R1, R2) :- edge(R1, R2).
adjacent(R1, R2) :- edge(R2, R1).

% Check that assigning Color to Region R is safe
% (no neighbor already has the same color).
safe(R, Color, Assigned) :-
    \+ (adjacent(R, N), member([N, Color], Assigned)).

% Main predicate: build color list for all regions.
color_map(L) :-
    regionList(Regions),
    assign_colors(Regions, [], L).

% Tail-recursive helper:
assign_colors([], Acc, L) :- reverse(Acc, L).
assign_colors([R|Rs], Acc, L) :-
    color(C),
    safe(R, C, Acc),
    assign_colors(Rs, [[R, C]|Acc], L).

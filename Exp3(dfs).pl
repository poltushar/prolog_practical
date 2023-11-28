% Define the facts about s and goals
s(a, c).
s(b, d).
s(b, e).
s(c, f).
s(c, g).
s(d, h).
s(e, i).
s(e, j).
s(f, k).

goal(f).
goal(j).

% Define the member predicate
member(X, [X | _]).
member(X, [_ | Tail]) :- member(X, Tail).

% Define the solve predicate
solve(Node, Solution) :-
    depthfirst([Node], Node, Solution).

% Define the depthfirst predicate
depthfirst(Path, Node, [Node | Path]) :-
    goal(Node).

depthfirst(Path, Node, Solution) :-
    s(Node, Neighbor),
    \+ member(Neighbor, Path), % Check if Neighbor is not already in the path
    depthfirst([Neighbor | Path], Neighbor, Solution).

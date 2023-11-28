% Define the graph as a set of facts representing connected cities and distances.
% Format: connected(City1, City2, Distance).
connected(city_a, city_b, 10).
connected(city_a, city_c, 15).
connected(city_b, city_d, 12).
connected(city_c, city_d, 5).
connected(city_b, city_e, 5).
connected(city_d, city_f, 20).
connected(city_e, city_f, 7).

% best_first_search/3: Find a path between two cities using Best-First Search.
best_first_search(Start, Goal, Path) :-
    best_first_search(Start, Goal, [Start], Path).

% best_first_search/4: Helper predicate with the main search algorithm.
best_first_search(Goal, Goal, Visited, [Goal|Visited]).
best_first_search(Current, Goal, Visited, Path) :-
    connected(Current, Next, _),          % Find a neighboring city.
    \+ member(Next, Visited),            % Ensure it's not already visited.
    best_first_search(Next, Goal, [Next|Visited], Path).

% best_first/2: Entry point for the search.
best_first(Start, Goal) :-
    best_first_search(Start, Goal, Path),
    reverse(Path, ReversePath),          % Reverse the path for readability.
    write('Path from '), write(Start), write(' to '), write(Goal), write(': '), write(ReversePath), nl.

% Example usage:
% Find a path from city_a to city_f.
?- best_first(city_a, city_f).
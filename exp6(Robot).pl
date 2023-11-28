% Define the initial state
at(robot, location1).

% Define the goal state
at(robot, location3).

% Define the available actions (operators)
move(robot, X, Y) :-
    at(robot, X),
    connected(X, Y),
    assert(at(robot, Y)),
    retract(at(robot, X)).

% Define the locations and connections
connected(location1, location2).
connected(location2, location3).

% Define the goal test
goal_state :-
    at(robot, location3).

% Means-End Analysis to solve the problem
solve :-
    goal_state,
    write('Robot is already at the goal state.').

solve :-
    \+ goal_state,
    achieve_goal.

achieve_goal :-
    at(robot, CurrentLocation),
    goal_state,
    write('Robot is at the goal state.').

achieve_goal :-
    at(robot, CurrentLocation),
    \+ goal_state,
    write('Robot is at '), write(CurrentLocation), nl,
    move(robot, CurrentLocation, NextLocation),
    achieve_goal.

% Example query
% To use, enter `solve.` in the Prolog interpreter.

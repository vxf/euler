-module(euler34).
-author("vxf").
-export([start/0]).

-import(lists, [foldl/3, seq/2]).

fact(0) -> 1;
fact(1) -> 1;
fact(2) -> 2;
fact(X) -> X * fact(X - 1).

curious(N) ->
	N == foldl(
		fun(X, S) ->
			fact(X - 48 ) + S
		end,
		0,
		integer_to_list(N)).

%solve(false, 10) -> false;
%solve(C, X) ->
%	io:fwrite("~w~w~n", [C, X]) and
%	solve(curious(X - 1), X - 1).

%start() -> solve(false, 200).

start() -> io:fwrite("~w~n", [[X || X <- seq(10,200000), curious(X)]]).



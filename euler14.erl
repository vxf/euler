-module(euler14).
-author("vxf").
-export([start/0]).

-import(lists, [max/1, seq/2]).

collatz(S, 1) ->
	S;
collatz(S, X) when X rem 2 == 0 -> % even
	collatz(S + 1, X div 2);
collatz(S, X) -> % odd
	collatz(S + 1, 3 * X + 1).

solve() ->
	lists:max([{collatz(1, X), X } || X <- seq(2, 999999)]).

start() -> io:fwrite("~w~n", [ solve() ]).



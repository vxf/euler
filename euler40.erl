-module(euler40).
-author("vxf").
-export([start/0]).

-import(math, [log10/1]).


walk(X, P, N) when P >= N ->
	lists:nth(N - P + trunc(log10(X)) + 1, integer_to_list(X)) - 48;
walk(X, P, N) ->
	walk(X + 1 , P + trunc(log10(X + 1)) + 1, N). 

solve(10000000) -> 1;
solve(X) -> walk(1, 1, X) * solve(X * 10).

start() -> io:fwrite("~B~n", [solve(1)]).



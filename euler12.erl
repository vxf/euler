-module(euler12).
-author("vxf").
-export([start/0]).

-import(lists, [max/1, seq/2]).

%%% triangle(N, N, _) -> [];
%%% triangle(N, X, A) -> [A | triangle(N, X+1, A + X)].
%%% triangle(N) -> triangle(N+2, 2, 1).

ndivisorsaux(N, N) -> 1;
ndivisorsaux(_, _) -> 2.

ndivisors(_, SN, SN, _) ->
	0;
ndivisors(N, SN, X, 0) ->
	ndivisors(N, SN, X + 1, N rem X ) + ndivisorsaux(N, X*X);
ndivisors(N, SN, X, _) ->
	ndivisors(N, SN, X + 1, N rem X ).
ndivisors(N) ->
	ndivisors(N, trunc(math:sqrt(N))+1, 2, 0).
	
solve(_, A, DN) when DN > 500 -> A;
solve(X, A, DN) -> solve(X+1, A + X, ndivisors(A+ X)).
solve() -> solve(2, 1, 3).

start() -> io:fwrite("~w~n", [ solve() ]).



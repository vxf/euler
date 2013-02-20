-module(euler42).
-author("vxf").
-export([start/0]).
-import(file, [read_line/1, open/2]).
-import(string, [tokens/2]).
-import(lists, [sum/1]).


tri(S, N, T) when T < S -> tri(S, N + 1, ((N+1)*(N+2)) / 2);
tri(S, N, T) when T == S -> true;
tri(S, N, T) when T > S -> false.

triwords(F) ->
	{ok, FD} = open(F, read),
	{ok, S} = read_line(FD),
	length([t ||
		W <- tokens(S, "\",\""),
		tri(sum([L - $A + 1 || L <- W]), 1, 1)]).

start() -> io:fwrite("~w~n", [ triwords("words.txt") ]).


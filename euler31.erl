-module(euler31).
-author("vxf").
-export([start/0]).

coins(200, _, _) ->
	1;
coins(A, _, _) when A > 200 ->
	0;
coins(A, L, C) when A < 200 ->
	lists:sum([coins(A + X, L, X) ||
		X <- L, X =< C]).

coins() -> coins(0, [200,100,50,20,10,5,2,1], 200).

start() -> io:fwrite("~w~n", [ coins() ]).


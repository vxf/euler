-module(euler52).
-author("vxf").
-export([start/0]).
-import(lists, [sort/1]).

permult(N, D, T, Q, K, S) when
	(D == T) and
	(D == Q) and
	(D == K) and
	(D == S)
	-> N -1;
permult(N, _, _, _, _, _) ->
	permult(N + 1,
		sort(integer_to_list(N*2)),
		sort(integer_to_list(N*3)),
		sort(integer_to_list(N*4)),
		sort(integer_to_list(N*5)),
		sort(integer_to_list(N*6))).

permult() -> permult(1,  2, 3, 4, 5, 6).

start() -> io:fwrite("~w~n", [ permult() ]).


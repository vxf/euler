-module(euler15).
-author("vxf").
-export([start/0]).

latice(0, _) -> 1;
latice(_, 0) -> 1;
%% latice(A, B) -> latice(A - 1, B) + latice(A, B - 1).

latice(A, B) -> 
	case erlang:get({'euler15', {A, B}}) of
		undefined ->
			V = latice(A - 1, B) + latice(A, B - 1),
			erlang:put({'euler15', {A, B}}, V),
			V;
		V -> V
	end.

start() -> io:fwrite("~w~n", [ latice(20,20) ]).



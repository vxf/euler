-module(euler45).
-author("vxf").
-export([start/0]).

%%% all Hexagonal numbers are all Triangulars too...

isP(_, H, P) when H == P -> H;
isP(_, H, P) when H < P -> false;
isP(N, H, P) when H > P ->
	isP(N + 1, H, N*(3*N -1)/2).

hex(N, false) ->
	hex(N+1, isP(N, N*(2*N-1), 0));
hex(_, H) -> H.

% hex() -> hex(1, false).
% hex() -> hex(10, false).
hex() -> hex(144, false).

start() -> io:fwrite("~w~n", [ hex() ]).


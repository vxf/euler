-module(euler24).
-author("vxf").
-export([start/0]).

perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].

millionth(L, N)  -> lists:nth(N, perms(L)).

start() -> io:fwrite("~w~n", [ millionth([0,1,2,3,4,5,6,7,8,9], 1000000) ]).


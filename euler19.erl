-module(euler19).
-author("vxf").
-export([start/0]).
-import(calendar, [day_of_the_week/3]).

sundays() -> length([sun ||
		Y <- lists:seq(1901,2000),
		M <- lists:seq(1,12),
		day_of_the_week(Y, M, 1) == 7]).

start() -> io:fwrite("~w~n", [ sundays() ]).


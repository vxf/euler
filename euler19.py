import datetime

c = 0
for y in range(1901, 2001) :
	for m in range(1,13) :
		if datetime.date(y, m, 1).timetuple().tm_wday == 6 :
			c = c + 1
print(c)


wdictionary = [
	{
		0: 0,
		1: len("one"),
		2: len("two"),
		3: len("three"),
		4: len("four"),
		5: len("five"),
		6: len("six"),
		7: len("seven"),
		8: len("eight"),
		9: len("nine"),
		10: len("ten"),
		11: len("eleven"),
		12: len("twelve"),
		13: len("thirteen"),
		14: len("fourteen"),
		15: len("fifteen"),
		16: len("sixteen"),
		17: len("seventen"),
		18: len("eighteen"),
		19: len("nineteen")
	},
	{
		0: 0,
		1: len("ten"),
		2: len("twenty"),
		3: len("thirty"),
		4: len("fourty"),
		5: len("fifty"),
		6: len("sixty"),
		7: len("seventy"),
		8: len("eighty"),
		9: len("ninety")
	},
	{
		0: 0,
		1: len("onehundred"),
		2: len("twohundred"),
		3: len("threehundred"),
		4: len("fourhundred"),
		5: len("fivehundred"),
		6: len("sixhundred"),
		7: len("sevenhundred"),
		8: len("eighthundred"),
		9: len("ninehundred")
	},
	{
		0: 0,
		1: len("onethousand"),
	},
]

def euler17():
	x = 0
	for i in range(1, 20) :
		x = x + wdictionary[0][i]
	total = total + (x * 10)

	x = 0
	for i in range(2, 10) :
		x = x + wdictionary[1][i]
	print(x)

euler17()

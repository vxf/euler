for a in range(1, 500):
	for b in range(1, a):
		c = 1000 - a - b
		if c*c == a*a + b*b :
			print(str(a) + "**2+" + str(b) + "**2=" + str(c) + "**2")
			print(a*b*c)


n = len(set(reduce(lambda x, y: x + y,
	[[a**b for b in range(2,101)]
		for a in range(2,101)])))

print(n)

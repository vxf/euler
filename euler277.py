D, U, d = 0, 1, 2

def parse(f):
	return {
			D: lambda x: x,
			U: lambda x: 4*x + 2,
			d: lambda x: 2*x - 1
		}[f]

def test(a, s):
	for f, g in s:
		if not(a % 3 == g) : return False
		a = f(a)
		if a == 3 : return False # XXX a nao ser que o ultimo seja 1, seq perfeita
		a = a // 3
	return True

def find(j, s):
	s = [(parse(f), f) for f in s]
	i = j + s[0][1] + 2
	while True :
		if test(i, s) :
			return i
		i = i + 3


SEQ = D,d,D,d,d,U,U,d,D,D

print(find(1000000, SEQ))

SEQ = U,D,D,D,U,d,d,d,D,D,U,D,D,d,d,D,d,D,d,d,D,D,U,D,D,d,U,U,D,d

print(find(1000000000000000, SEQ))



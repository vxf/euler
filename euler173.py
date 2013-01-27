import math, cmath
def quadratic(a, b, c=None):
	if c:	# (ax^2 + bx + c = 0)
		a, b = b / float(a), c / float(a)
	t = a / 2.0
	r = t**2 - b
	if r >= 0:	# real roots
		y1 = math.sqrt(r)
	else:	# complex roots
		y1 = cmath.sqrt(r)
	y2 = -y1
	return y1 - t, y2 - t

n=1000000
# n = n / 4
c = 0

y = 1
while 2*2*y+4 <= n :
	c = c + int(quadratic(2*y, -n)[0])/2
	y = y + 1
print(c)

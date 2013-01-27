"""
x^2 + ax + b = 0 (or ax^2 + bx + c = 0)
By substituting x = y-t and t = a/2, the equation reduces to
	y^2 + (b-t^2) = 0
which has easy solution
	y = +/- sqrt(t^2-b)
"""
def quadratic(a, b, c=None):
	import math, cmath
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


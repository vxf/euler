"""
proposition:
a, b, c natural numbers (positive integers)
a + b + c = 1000
a^2 + b^2 = c^2

c = 1000 - a - b
c^2 = (1000 - a - b)^2
a^2 + b^2 = (1000 - a - b)^2
a^2 + b^2 = 1000^2 + a^2 + b^2 + 2*(-1000*a -1000*b + a*b)
0 = 1000^2 + 2*(-1000*a -1000*b + a*b)
b*(-2000 + 2*a) = -1000^2 + 2000*a

b = (-1000^2 + 2000*a) / (-2000 + 2*a) # and still b must be a positive and integer

we don't need to test all 'a' until 1000, just until conditions are met
"""

def fb(a):
    q, r = divmod(-1000**2 + 2000*a, -2000 + 2*a)
    
    return a, q, r

a, b = next((a, b)
    for a, b, r
    in map(fb, range(1,1000))
    if r == 0 and b > 0)

c = 1000 - a - b

print(a*b*c)


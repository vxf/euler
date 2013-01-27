#f(1)=1, f(5)=81, f(12)=271 and f(7780)=111111365.

##def S():
##    i = 1
##    while(True):
##        for c in str(i):
##            yield c
##        i= i + 1
##
##def f(n) :
##    s = str(n)
##    x = 0
##    p = 0
##    while(x < n):
##    for c in S():
##        i

##def f(n) :
##    sn = str(n)
##    x = 0
##    p = 0
##    i = 1
##    si1 = str(i)
##    i = 2
##    while x < n :
##        si2 = str(i)
##        x = x + (si1+si2).count(sn) # non-overlapping!!!
##        #if (si1+si2).count(sn) > 0 : print(si1+si2)
##        p = p + len(si2)
##        si1 = si2[2:]
##        i = i + 1
##    return p

def f(n) :
	sn = str(n)
	l = len(sn)
	i, p, c = 1, 0, 0
	s = ""
	
	while True :
		while not s[l:] :
			s+= str(i)
			i+= 1
		#print(s + "::" + r)

		p+= 1
		if sn == s[:l] :
			n-= 1
			if not n :
				return p
		s = s[1:]

#n = [3**i for i in range(1,14)]
#print(n)

#print(f(1))
#print(f(5))
#print(f(12))
#print(f(7780))

#print(f(1900))
n = [3**i for i in range(1,8)]
for i in n :
	print(i)
	print(f(i))


from functools import reduce

# fast prime number list generator using a sieve algorithm
 
def primes(n):
  """ returns a list of prime numbers from 2 to < n """
  if n < 2:  return []
  if n == 2: return [2]
  # do only odd numbers starting at 3
  s = [z for z in range(3, n, 2)]
  # n**0.5 may be slightly faster than math.sqrt(n)
  mroot = n ** 0.5
  half = len(s)
  i = 0
  m = 3
  while m <= mroot:
    if s[i]:
      j = (m * m - 3)//2
      s[j] = 0
      while j < half:
        s[j] = 0
        j += m
    i = i + 1
    m = 2 * i + 3
  # make exception for 2
  return [2]+[x for x in s if x]
 
print('-' * 50)  # print 50 dashes, cosmetic
num = 2000000
primeList = primes(num)
print("List of prime numbers from 2 to < " + str(num))
#print(primeList)
print(reduce(lambda x, y: x+y, primeList))

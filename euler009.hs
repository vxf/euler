{-
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

we need just to test 'a' until conditions are met
-}

findABC = go [1..] where
  go (a : as) =
    let (b, r) = divMod (-1000^2 + 2000*a) (-2000 + 2*a) in
      if r /= 0 || b <= 0 then go as
      else a * b * (1000 - a - b)

main = do
    print(findABC)

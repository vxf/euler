
ndigits :: Integer -> Integer
ndigits n = (floor (logBase 10 (fromInteger n))) + 1

nthdigit :: Integer -> Integer -> Integer
nthdigit i n = floor(fromIntegral(n) / (10^i)) `mod` 10

digits :: Integer -> [Integer]
digits 0 = [] 
digits n = n `mod` 10 : digits (n `div` 10)

palind :: Integer -> Bool
palind n = do
   let d = digits n
   d == reverse d

mpalind :: Integer
mpalind = maximum [(a * b) | a <- [100..1000],
                             b <- [100..(a+1)],
                             palind (a * b)]

main = do
    --print (ndigits 10000000)
    --print (nthdigit 7 123456)
    --print (digits 123456)
    --print (palind 123456)
    --print (palind 1234321)
    print (mpalind)

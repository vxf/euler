import Math.NumberTheory.Primes.Factorisation

pots :: (Integer, Int) -> [Integer]
pots (x, p) = 1 : go 1 p where
    go _ 0 = []
    go a c = (x * a) : go (x * a) (c - 1)

facts :: Integer -> [Integer]
facts n = go [1] (factorise n) where
    go as [] = as
    go as (f : fs) = go [a * b | a <- as, b <- (pots f)] fs

amicable :: Integer -> Bool
amicable n =
    let s = d n in
    s /= n && d s == n where
        d 0 = 0 -- there was a 0 in there somehow to ruin it ;)
        d x = sum (facts x) - x

solve :: Integer -> Integer
solve n = sum [x | x <- [1..n], amicable x]

main = do
    -- print ([x | x <- [1..10000], amicable x])
    print (solve 10000)

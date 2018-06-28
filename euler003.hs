{-
import Math.NumberTheory.Primes.Factorisation

fact :: Integer -> Integer
fact n = maximum [f | (f, _) <- factorise n]
-}

{-
-- Primality test
prim :: Integer -> Bool
prim n = 
  go 2 (floor(sqrt(fromIntegral(n)))) where
  go f e | f > e = True
         | n `mod` f == 0 = False
         | otherwise = go (f + 1) e
-}

-- Fake prime generator
nextP :: Integer -> Integer
nextP 2 = 3
nextP p = p + 2

-- Prime generator
nextPSieve :: Integer -> [Integer] -> (Integer, [Integer])
nextPSieve 2 s = (3, s)
nextPSieve p s = go (p + 2) s where 
              go q t | any (\x -> q `mod` x == 0) t = go (q + 2) t
               | otherwise = (q, q : t)


-- Find the biggest factor
maxFactor :: Integer -> Integer
maxFactor n = go n (2, [2]) where
    go 1 (p, s) = p
    go m (p, s) | m `mod` p == 0 = go (m `div` p) (p, s)
                | otherwise = go m (nextPSieve p s)


main = do
    -- let r = nextP 3
    -- let r = nextPSieve 7 [3, 5, 7]
    let r = maxFactor 600851475143
    print r

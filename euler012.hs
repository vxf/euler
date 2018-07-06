import Math.NumberTheory.Primes.Factorisation

-- multiply the prime factor exponents plus one, to take into account all
-- prime factor combinations
ndivisors :: Integer -> Int
ndivisors n = foldl (\acc (_, x) -> acc * (x + 1)) 1 (factorise n)

triangulars :: [Integer]
triangulars = go 2 1 where
    go n m = m : go (n + 1) (n + m)
    
solve :: Int -> Integer
solve d = go triangulars where
    go (t : xs) | (ndivisors t) >= d = t
                | otherwise = go xs

main = do
    -- print(triangulars)
    -- print(ndivisors 6)
    -- print(ndivisors 4)
    -- print(ndivisors 28)
    -- print(solve 6)
    print(solve 500)

-- Prime generator
nextPSieve :: Integer -> [Integer] -> (Integer, [Integer])
nextPSieve 2 s = (3, s)
nextPSieve p s = go (p + 2) s where 
    go q t | (((2^(q-1)) `mod` q) /= 1) || any (\x -> q `mod` x == 0) t = go (q + 2) t
           | otherwise = (q, q : t)
           
solve :: Integer -> Integer
solve x = go x (2, [2]) where
    go 1 (p, _) = p
    go x (p, s) = go (x - 1) (nextPSieve p s)

main = do
    print(solve 6)
    print(solve 10001)

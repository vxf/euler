collatzn_ :: Int -> Int
collatzn_ n = go n 1 where
    go 1 c = c
    go n c | n `mod` 2 == 0 = go (n `div` 2) (c + 1)
           | otherwise = go (3 * n + 1) (c + 1)        

solve :: Int -> Int
solve n = go [1..n] where
    go l = maximum (map collatzn l)
  

main = do
    print(solve 1000000)
    -- print(solve 1000000)

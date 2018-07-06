border :: Integer -> [Integer] -> [Integer]
border a [] = 2 * a : []
border a (x : xs) = a + x : border (a + x) xs

solve :: Integer -> Integer
solve n = go n [1] where
    go 0 l = last l
    go n l = go (n - 1) (border 0 l)

main = do
    print(solve 200)

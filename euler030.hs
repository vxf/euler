digits :: Integer -> [Integer]
digits 0 = [] 
digits n = n `mod` 10 : digits (n `div` 10)

solve :: Int -> Integer
solve p = sum [x | x <- [2..(10 ^ (p + 1))],
               x == (sum . map (^p) . digits) x]

main = do
    print(solve 5)

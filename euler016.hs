digits :: Integer -> [Integer]
digits 0 = [] 
digits n = n `mod` 10 : digits (n `div` 10)

solve :: Integer -> Integer
solve n = sum (digits n)

main = do
    print (solve (2^1000))

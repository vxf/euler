digits :: Integer -> [Integer]
digits 0 = [] 
digits n = n `mod` 10 : digits (n `div` 10)

factorial :: Integer -> Integer
factorial n = product [1..n]

solve :: Integer -> Integer
solve n = sum (digits (factorial n))

main = do
    print (solve (100))

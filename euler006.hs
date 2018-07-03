solve :: Integer -> Integer
solve x = ((x * (x + 1)) `div` 2)^2 - 
          ((x*(x+1)*(2*x+1)) `div` 6)

main = do
    print(solve 100)

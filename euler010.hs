import Data.List.Ordered -- (minus, union, unionAll)

-- https://wiki.haskell.org/Prime_numbers
primesToG m = 2 : sieve [3,5..m]
    where
    sieve (p:xs)
       | p*p > m   = p : xs
       | otherwise = p : sieve (xs `minus` [p*p, p*p+2*p..])


main = do
    print(sum(primesToG 2000000))
    -- print(sumP 2000000)

{-
fib :: Integer -> Integer
fib n = go n 0 1 where
    go n a b | n > 0 = go (n - 1) b (a+b)
             | otherwise = b
-}

fibLT :: Integer -> Integer
fibLT l = go 0 0 1 where
    go n a b
    | b < l && even b = go (n+b) b (a+b)
    | b < l = go n b (a+b)
    | otherwise = n

main = do
    let r = fibLT 4000000
    print r

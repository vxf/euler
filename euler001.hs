main = do
    let r = sum [x | x <- [1..1000], x `mod` 3 == 0 || x `mod` 5 == 0 ]
    print r

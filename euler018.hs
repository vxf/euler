import Data.List.Split

addrow :: Integer -> [Integer] -> [Integer] -> [Integer]
addrow a [] (y : []) = a + y : []
addrow a (x : xs) (y : ys) = ((max a x) + y) : addrow x xs ys 

solve :: [[Integer]] -> Integer
solve (t : p) = go t p where
    go r [] = maximum r
    go r (x : xs) = go (addrow 0 r x) xs

main = do
    s <- readFile "euler018.txt"
    let p = [[read n :: Integer | n <- splitOn " " l] | l <- lines s]
    
    print(solve p)
    -- print(solve [[1], [2, 3]])
    -- print(solve [[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]])

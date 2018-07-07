import Data.List

longDiv :: Int -> Int -> [Int]
longDiv a b = go a where
    go 0 = []
    go x = let (q, r) = divMod x b in
        q : go (r * 10)

longDivCycle :: Int -> Int -> Int
longDivCycle a b = go a [] where
    go 0 _ = 0
    go x c =
        let (q, r) = divMod x b in
        case elemIndex (q, r) c of
            Nothing -> go (r * 10) ((q, r) : c)
            Just i -> i + 1

solve :: Int -> Int
solve n = go (0, 0) [1..n] where
    go (a, c) [] = a
    go (a, c) (x : xs) =
        let b = longDivCycle 1 x in
        if b > c then go (x, b) xs
        else go (a, c) xs

main = do
    print(solve 1000)
    -- print(longDiv 1 4)
    

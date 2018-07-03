import Data.List
import Data.List.Split

chnks :: Int -> [Int] -> [[Int]]
chnks _ [] = []
chnks s (x:l) = fst (splitAt s (x:l)) : chnks s l

maxLine :: [Int] -> Int
maxLine m = maximum (map (\l -> foldl (*) 1 l) (chnks 4 m))

maxH :: [[Int]] -> Int
maxH m = maximum (map maxLine m)

maxV :: [[Int]] -> Int
maxV m = maxH (transpose m)

skewR :: [[Int]] -> [[Int]]
skewR m = go m 0 ((length m) - 1) where
    go [] _ _ = []
    go (x : xs) d l = ((replicate d 1) ++ x ++ (replicate (l-d) 1)) : go xs (d+1) l

skewL :: [[Int]] -> [[Int]]
skewL m = go m 0 ((length m) - 1) where
    go [] _ _ = []
    go (x : xs) d l = ((replicate (l-d) 1) ++ x ++ (replicate d 1)) : go xs (d+1) l

maxDR :: [[Int]] -> Int
maxDR m = maxV (skewR m)

maxDL :: [[Int]] -> Int
maxDL m = maxV (skewL m)

solve p = maximum [maxH p, maxV p, maxDR p, maxDL p]

main = do
    s <- readFile "euler11.txt"
    let p = [[read n :: Int | n <- splitOn " " l] | l <- lines s]
    
    print(solve p)

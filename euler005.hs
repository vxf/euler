-- lemma: a number x is multiple of another number y if at least the factors of
-- y are also factors of x in the same amount

-- lemma 2: therefore a number x is multiple of several y' if it's composed of
-- all the factors of any of y' in the biggest amount of each factor for each y'

import Math.NumberTheory.Primes.Factorisation
import Data.List

-- quick dirty solution that multiplies the unique factors between 1 and 20
solve :: Integer -> Integer
solve y = go (nub (foldr (++) [] [(factorise x) | x <- [1..(y+1)]])) where
        go [] = 1
        go ((x,_) : xs) = x * (go xs)

main = do
    print(solve 20)

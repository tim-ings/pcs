type Coin = Int

main :: IO ()
main = interact handle

handle :: String -> String
handle = show . solve . readCoins

readCoins :: String -> [Coin]
readCoins = (map read) . words . head . tail . lines

findOptimal :: Int -> [Coin] -> Int
findOptimal i coins
    | mySum > broSum = i
    | otherwise = findOptimal (i + 1) coins
    where myCoins = take i coins
          broCoins = drop i coins
          mySum = sum myCoins
          broSum = sum broCoins

solve :: [Coin] -> Int
solve = (findOptimal 0) . quicksort

quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort (p:xs) = (quicksort greater) ++ [p] ++ (quicksort lesser)
    where
        lesser  = filter (< p) xs
        greater = filter (>= p) xs

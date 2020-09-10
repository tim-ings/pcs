main :: IO ()
main = interact handle

handle :: String -> String
handle = show . solve . readCounts

readCounts :: String -> [Int]
readCounts = (map read) . words . head . tail . lines

collapse :: [Int] -> Int -> [Int] -> Int
collapse result currentTerm remaining
    | length remaining == 0 = length result
    | newCurrent <= 4 = collapse result newCurrent (drop 1 remaining)
    | newCurrent > 4 = collapse (result ++ [currentTerm]) 0 remaining
    where newCurrent = currentTerm + head remaining

solve :: [Int] -> Int
solve counts = collapse [] countsHead sortedCounts
    where sortedCounts = quicksort counts
          countsHead = head sortedCounts

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (p:xs) = (quicksort greater) ++ [p] ++ (quicksort lesser)
    where
        lesser  = filter (< p) xs
        greater = filter (>= p) xs

type Hat = (Float, Float)
type PrioroityHat = (Float, Hat)

main :: IO ()
main = interact handle

handle :: String -> String
handle = show . solve . readHats

readHats :: String -> [Hat]
readHats = (map read) . words . head . tail . lines

calcPriority :: Hat -> PrioroityHat
calcPriority (v, d) = (p, (v, d))
    where p = v `div` d

calcPleasure :: [PrioroityHat] -> Int
calcPleasure hats = 0

solve :: [Hat] -> Int
solve hats = calcPleasure priorityHats
    where priorityHats = quicksort $ map calcPriority hats

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (p:xs) = (quicksort greater) ++ [p] ++ (quicksort lesser)
    where
        lesser  = filter (< p) xs
        greater = filter (>= p) xs

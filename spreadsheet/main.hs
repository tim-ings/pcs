import Data.Char
import Text.Regex.Posix

type Coord = (Int, Int)

-- input handling

main :: IO ()
main = interact $ show . (map convertInp) . readInp

readInp :: String -> [String]
readInp = tail . lines

convertInp :: String -> String
convertInp s = if isRC s
    then formatAZ $ parseRC s
    else formatRC $ parseAZ s

isRC :: String -> Bool
isRC s = s =~ "R([0-9]+)C([0-9]+)"

-- AZ format

parseAZ :: String -> Coord
parseAZ s = (row, col)
    where (_, colLetters, rowNum) = splitAZ s
          row = read rowNum :: Int
          col = parseAZCol colLetters

splitAZ :: String -> (String, String, String)
splitAZ s = s =~ "([A-Z]+)"

parseAZCol :: String -> Int
parseAZCol colLetters = sum 
    $ map (\(coef, num) -> if coef == 0 then num else coef * num)
    $ zip coefs nums
    where nums = map abcTo123 colLetters
          len = length nums
          coefs = [x * 26 | x <- [len - 1, len - 2 .. 0]]

abcTo123 :: Char -> Int
abcTo123 = (subtract 64) . ord

formatAZ :: Coord -> String
formatAZ (row, col) = formatAZCol col ++ show row

-- TODO: write a function that uses `mod 26` to format excel column names
formatAZCol :: Int -> String
formatAZCol col = show (map nums 1)
    where ls = [x * 26 | x <- [0 .. 10]]
          mods = map mod 
          nums = map myMod ls

myMod :: Int -> Int -> Int
myMod x y = mod y x

-- RC format

parseRC :: String -> Coord
parseRC s = (row, col)
    where row = 1
          col = 1

splitRC :: String -> (String, String, String)
splitRC s = s =~ "R([0-9]+)C([0-9]+)"

formatRC :: Coord -> String
formatRC (row, col) = "R" ++ show row ++ "C" ++ show col

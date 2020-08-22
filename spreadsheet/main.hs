import Data.Char
import Text.Regex.Posix

type Coord = (Int, Int)

main :: IO ()
main = interact $ show . (map convertAZtoRC) . readInp

readInp :: String -> [String]
readInp = tail . lines

isRC :: String -> Bool
isRC s = s =~ "R([1-9]+)C([1-9]+)"

isAZ :: String -> Bool
isAZ s = s =~ "([A-Z]+)([1-9]+)"

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

convertAZtoRC :: String -> String
convertAZtoRC = formatRC . parseAZ

formatRC :: Coord -> String
formatRC (row, col) = "R" ++ show row ++ "C" ++ show col

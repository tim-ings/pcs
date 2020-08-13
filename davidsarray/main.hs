import System.IO
import Data.Maybe
import Data.Set (Set)
import qualified Data.Set as Set

type IntSet = Set Int

getInts :: IO [Int]
getInts = do
    str <- getLine
    return $ Prelude.map (read::String->Int) $ words str

isAllZero :: IntSet -> Bool
isAllZero nums = (Set.size nums == 1) && (Set.member 0 nums)

addIfNotZero inc val =
    if val == 0 then val
    else val + inc

addToAll :: IntSet -> Int -> IntSet
addToAll nums inc = Set.fromList $ map (addIfNotZero inc) $ Set.toList nums

lookupNext :: IntSet -> Int
lookupNext s =
    case Set.lookupGT 0 s of
        Just v -> v
        Nothing -> Data.Maybe.fromMaybe 0 $ Set.lookupLT 0 s

calcExplode :: Int -> IntSet -> (Int, IntSet)
calcExplode counter nums = do
    if isAllZero nums then 
        (counter, nums)
    else
        let (c, n) = calcExplode counter $ addToAll nums $ (lookupNext nums * (-1))
        in (c + 1, n)

main :: IO ()
main = do
    count <- getLine
    nums <- getInts
    let s = Set.fromList nums
    let counter = fst $ calcExplode 0 s
    putStrLn $ show counter

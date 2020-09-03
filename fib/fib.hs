main :: IO ()
main = interact handle

handle :: String -> String
handle = show . unlines . map show . fibs . read

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fibs :: Int -> [Int]
fibs n = [fib x | x <- [1..n]]

memo_fib :: Int -> Int
memo_fib = (map fibm [0 ..] !!)
    where fibm 0 = 0
          fibm 1 = 1
          fibm n = memo_fib (n - 2) + memo_fib ( n - 1)

memo_fibs :: Int -> [Int]
memo_fibs n = [memo_fib x | x <- [1..n]]

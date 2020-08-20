main :: IO ()
main = interact $ show . coverLawn . readInp

readInp :: String -> [Float]
readInp = (map read) . words

coverLawn :: [Float] -> Int
coverLawn (x:y:a:_) = ax * ay
    where ax = ceiling $ x / a
          ay = ceiling $ y / a

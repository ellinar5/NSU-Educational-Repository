import Data.List

degree1 :: Int -> Int
degree1 10 = 100 ^ 10

degree2 :: Int -> Int
degree2 0 = 2 ^ 0

degree3 :: Float -> Float
degree3 1 = 2 ** 1

degree4 :: Int -> Int
degree4 (-1) = 5 ^ (-1)

degree5 :: Float -> Float
degree5 (-1) = 5 ** (-1)
import Data.List

comparison1 :: Int -> Int -> Bool
comparison1 x y = x == y

--В Haskell нельзя напрямую сравнивать Int и Bool, так как это разные типы данных
comparison2 :: Int -> Bool -> Bool
--comparison2 x y = x == y
comparison2 x y = (if y then 1 else 0) == x

comparison3 :: String -> String -> Bool
comparison3 x y = x /= y
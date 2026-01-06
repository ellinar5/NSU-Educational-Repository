-- №1.1 вычисление количества элементов в списке
-- import Data.List
-- length' :: [a] -> Int
-- length' [] = 0
-- length' (xs) = foldr (\x y -> y+1) 0 xs

-- №2.1 сумма квадратов элементов списка
-- import Data.List
-- sumSqures :: [Integer] -> Integer
-- sumSqures [] = 0
-- sumSqures xs = undefined
-- sumSqures (xs) = foldr (\x y -> y^2) 2 xs

-- №3.1 сумма квадратов элементов (положительные) списка

-- №4.2 возвращает произведение всех элементов списка
import Data.List
myProduct :: [Integer] -> Integer
myProduct [] = 0
myProduct (xs) = foldr (*) 1 xs

-- №5.2 возвращает максимальное  среди всех элементов в списке
import Data.List
myMaximum :: [Integer] -> Integer
myMaximum [] = 0
myMaximum (xs) = foldr max 
			

fun :: Int -> [Int]
fun n = [x | x <- [2..n], null [y | y <- [2..x-1], x `mod` y == 0]]
import Data.Char

twoDigits2int :: Char -> Char -> Integer
twoDigits2int x y  
				| isDigit x && isDigit y = digitToInt x * 10 + digitToInt y
				| otherwise = -1
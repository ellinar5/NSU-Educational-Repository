-- №1 +
sumList :: Num a => [a] -> a
sumList [] = 0
sumList (x:xs) = x + sumList xs

-- №2 +
reverse':: [a] -> [a]
reverse' [] = []
reverse' (x:xs) =  reverse' xs  ++ [x]

-- №3 +
anyList :: [a] -> a -> Bool
anyList []  = False
anyList (x:xs) y                       -- есть список в нем ищем один элемент (y)
    | x == y = True                    -- если есть похожый элемент то True
	| otherwise = anyList xs y 

-- №4 +
-- list1' :: [Int] -> Int
-- list1' [] = 0
-- list1' (x:xs) = x + list1' xs
-- list2' :: [Int] -> Int
-- list2' [] = 0
-- list2' (x:xs) = x + list2' xs
-- merger :: [Int] -> Int
-- merger xs = list1' xs + list2' xs

sort' :: [Int] -> [Int] -> [Int]
sort' xs [] = xs
sort' [] ys = ys
sort (x:xs) (y:ys) | x<=y = x : sort' xs(y:ys)
				   | otherwise = y : sort' (x:xs) ys

-- №5 +
number :: Int -> Int -> Int
result :: Int -> [Int]
number x i = x * i
result (x) = map (number x) [1..10] -- map принимается к каждому элементу списка, и создает новый список

-- number x = x*1 -- было до команды map
-- number x = x*2
-- number x = x*3
-- number x = x*4
-- number x = x*5
-- number x = x*6
-- number x = x*7
-- number x = x*8
-- number x = x*9
-- number x = x*10

--через рекурсию

table :: Int -> Int -> [Int]
table 0_ = [0]
table _ 10 = []
table x n | n<10 = (x*n)
		  | otherwise = table x(n+1)

-- №6 +
number :: Int -> Bool
number n 
	 | n<=0 = False --число меньше или равное нулю не воспринимаются (False)
	 | n==1 = True -- Для 2^0 = 1
	 | n mod 2 == 0 = number (n `div` 2)  -- веденное число делится на 2, пока по итогу n не будет равно 1
	 | otherwise = False -- нечетное число

main :: IO ()
main = do
  print (number 6)
-- №7 +
mink:: Int -> Int -> Int
mink n k = go k -- 
  where
    go k'
      | 2^k' > n = k'           -- Если 2^k больше n, функция нашла минимум k и возвращает его.
      | otherwise = go (k' + 1)

min :: Int -> Int -> Int        -- Для возвращения минимального числа
min x y
  | x < y = x                   -- Если x меньше y, то x — минимум.
  | otherwise = y               -- 	Иначе y миниум

minkandn :: Int -> Int
minkandn n = let k = mink n 0    -- вычисление минимума
                      in min (2^k) n  -- для возврата меньшего из двух чисел: 2^k и n.

-- через рекурсию

isT :: 	Int -> Int -> Int
isT x k | (2^k>x) = k
		| otherwise = isT x(k+1)





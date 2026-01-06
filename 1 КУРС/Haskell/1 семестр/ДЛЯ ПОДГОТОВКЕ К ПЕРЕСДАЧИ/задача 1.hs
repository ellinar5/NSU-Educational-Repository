import Prelude hiding ((!!),init,reverse,(++),cycle,take,elem)

--реализация (!!)
(!!) :: [a] -> Int -> a
[] !! _ = error "error: empty list" -- для пустого списка (обращение по индексу)
(x:_) !! 0 = x -- если нулевой то возравращаем первый элемент х
(_:xs) !! n
	|n<0 = error "error: limit exceeded"
	|otherwise = xs !! (n-1) -- рекурсивный вызов до конца списка

-- main :: IO()
-- main = do
	-- let list = [1,2,3,4]
	-- print (list !! 2) -- вывод 3
	
-- реализация init

init :: [a] -> [a]
init [] = error "error: empty list" -- пустой список
init [x] = [] -- для одного элемента списка
-- разбить список (x отдельно от xs)
init (x:xs) = x : init xs

-- main :: IO()
-- main = do
	-- let list = [1,2,3,4]
	-- print (init list) -- вывод [1,2,3]
	
-- реализация сложения двух списков
(++) :: [a] -> [a] -> [a]
-- первый список: (x:xs) ; второй список: (y:ys)
[] ++ ys = ys -- если первый пуст, то выводим только второй список
(x:xs) ++ ys = x : (xs ++ ys) -- если первый не пуст, то берем x и добавляем к xs со вторым списком ys

-- main :: IO()
-- main = do
	-- let list1 = [1,2,3,4]
	-- let list2 = [3,9]
	-- print (list1 ++ list2) -- вывод [1,2,3,3,9]
	
-- реализация cycle	

cycle :: [a] -> [a]
cycle [] = []
cycle xs = xs ++ cycle xs -- рекусивный вызов 

-- main :: IO()
-- main = do
	-- let list = [1,2,3]
	-- print (cycle list) -- вывод [1,2,3,1,2,3,1,2,3..]

-- реализация swp
swp :: [a] -> Int -> Int -> [a]
[] swp _ = error "error: empty list" -- для пустого списка (обращение по индексу)
swp i j xs
	| i>=0 ||  length 

main :: IO()
main = do
	let list = [1,2]
	print (swp 2 1 list) -- вывод [2,1]
	
-- реализация permutations
permutations :: [a] -> [[a]]
permutations [] = [] -- для пустого списка нет перестановок
permutations xs = xs ++ swp 

intersperse :: a -> [a] -> [a]
intersperse  = fordr (\acc x ->   
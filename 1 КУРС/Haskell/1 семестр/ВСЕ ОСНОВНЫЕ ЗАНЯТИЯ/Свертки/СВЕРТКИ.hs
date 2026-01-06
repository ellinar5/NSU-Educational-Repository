-- #1
cubSumR ::  [Int] -> Int
cubSumR = foldr (\x acc -> x^3 + acc) 0
	
-- #2
cubSumL ::  [Int] -> Int
cubSumL = foldl (\acc x  -> x^3 + acc) 0

-- #3
fact :: Int -> Int
fact n = foldl (\acc x -> x*acc) 1 [1..n]

expT :: Double -> Int -> Double
expT x n = foldl (\acc k -> acc + (x^k/fromIntegral (fact k)) ) 0 [0..n]

-- #4
howmany :: (Eq a) => a -> [a] -> Int
howmany l = foldr (\x acc -> if (l==x) then acc+1 else acc) 0

-- #5
howmanyGN :: [Char] -> (Int,Int)
howmanyGN = foldr simwol (0,0) 
	where
			simwol x (n,k) 
					   | x `elem` ['a','e','i','o','u'] = (n+1,k)
					   | x `elem` ['t','n','r','s','h'] = (n,k+1)
					   | otherwise = (n,k)
					   
-- #6
intersperse :: (Eq a) => a -> [a] -> [a]
intersperse k = foldr (\x acc ->  if (acc==[]) then x:acc else x:k:acc ) []

-- #7
cycleshift (x:xs) = xs ++ [x]

rotateR :: [a] -> [[a]] 
rotateR xs = foldr (\_ acc -> cycleshift (head acc):acc ) [xs] [1..(length xs - 1)]

rotateL :: [a] -> [[a]]
rotateL xs = foldl (\acc _ -> acc ++ [cycleshift (last acc)])  [xs] [1..(length xs - 1)]

--ТЕСТ	
main :: IO ()
main = do
	print $ cubSumR [1,2,3,4] 
	print $ cubSumR [-1,-2,-3,-4] 

	print $ cubSumL [1,2,3,4] 
	print $ cubSumL [-1,-2,-3,-4]  

	print $ expT 1 5
	print $ expT 1 10

	print $ howmany 'l' "Hello"

	print $ howmanyGN "hello"

	print $ intersperse ',' "hello"

	print $ rotateR [1..4]
	print $ rotateL [1..4]
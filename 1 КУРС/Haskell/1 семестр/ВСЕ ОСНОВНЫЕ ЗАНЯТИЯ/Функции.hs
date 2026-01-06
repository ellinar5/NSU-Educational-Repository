-- 1 +
fun1 :: [Int]
fun1 = [x^2 |x<-[1..25] ]

-- 2
fun2 :: Num a =>[a] -> [a] -> [a]
fun2 xs ys = [x+y | x <- xs,y <- ys]

-- 3
fun3 :: [a] -> [a] 
fun3 xs = [x | x <- reverse xs]

-- 4
fun4 :: a -> [a] -> Bool
fun4 x xs = any (== x) xs

-- 5
fun5 :: [a] -> [a]
fun5 [] = []
fun5 xs = [x | x <- xs, x `mod` (head xs) /= 0]
-- 6
fun6 :: [a] -> [a]
fun6 xs = [x | (i, x) <- zip [0..] xs, x `notElem` take i xs]
-- 7
fun7 :: a -> [a] -> [a]
fun7 x xs =  [y | y <- xs, y < x] ++ [x] ++ [y | y <- xs, y >= x]
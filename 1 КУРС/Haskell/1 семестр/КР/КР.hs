-- -- №1.1
-- lst :: [String]
-- lst = concat [generateWords n|n<-[1..]] -- генерация списка с буквами 
	-- where
		-- generateWords 0 = [""] -- для базавого случая (выход из рекурсии)
		-- generateWords n = [x:w|w<-generateWords (n-1), x<-"abc"] -- рекурсивная генерация списка

-- --ТЕСТ	
-- main :: IO ()
-- main = do
    -- print $ take 13 lst
	
-- -- №1.2
-- countP :: [Int] -> Int
-- countP [] = 0 -- если список пустой
-- countP [_] = 0 -- если список содержит только один элемент
-- countP [_, _] = 0 -- нехвает третьего элемента для проверки
-- countP (x:y:z:ost) --
    -- | y > x && y > z = 1 + countP (y:z:ost) -- является ли y (текущий элемент) больше обоих соседей (x и z); если да, то  y является локальным максимумом (добавляем +1)
    -- | otherwise = countP (y:z:ost) -- если нет, то просто продолжаем рекурсию с y и z, игнорируя x

-- --ТЕСТ	
-- -- main :: IO ()
-- -- main = do
    -- -- print $ countP [5,6,7,5,8,4,3,9]
	
-- -- №2 (1 вариант)
-- data ATree a = ALeaf a | ABranch a (ATree a) (ATree a) deriving (Show,Read,Eq)  

-- -- №2.1
-- tree = ABranch 35
			 -- (ABranch 40
			       -- (ALeaf 51)
				   -- (ALeaf 26))
							 
			 -- (ABranch 22 (ALeaf 80) (ABranch 63 (ALeaf 20) (ALeaf 45)))
			 
			 
-- №2 (2 вариант)
data ATree a = ALeaf a | ABranch (ATree a) a (ATree a) deriving (Show, Read, Eq)  

-- №2.1
tree :: ATree Int
tree = ABranch (ABranch (ALeaf 70) 20 (ALeaf 90)) 100 (ABranch (ABranch (ALeaf 10) 40 (ALeaf 10000)) 30 (ABranch (ALeaf 80) 50 (ALeaf 60)))
							
-- #2.2
isChild :: Eq a => ATree a -> ATree a -> Bool
isChild (ALeaf _) _ = False  -- Лист никогда не является дочерним
isChild t1 t2 
    | t1 == t2 = True  -- Если деревья идентичны, то одно является дочерним другим
    | otherwise = isDescendant t1 t2  -- Проверяем, является ли t1 потомком t2

-- Функция для проверки, является ли t1 потомком t2
isDescendant :: Eq a => ATree a -> ATree a -> Bool
isDescendant (ABranch left _ right) t2 = isChild left t2 || isChild right t2
isDescendant (ALeaf _) _ = False  -- Лист не может быть дочерним

-- Функция getValue для извлечения значения из узла дерева
getValue :: ATree a -> a
getValue (ALeaf x) = x
getValue (ABranch _ x _) = x

							

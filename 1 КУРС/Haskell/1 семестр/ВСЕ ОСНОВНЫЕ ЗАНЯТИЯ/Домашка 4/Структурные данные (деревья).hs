-- #1 задать бинарное дерево -> Определить функцию вычисляющую высоту дерева. Будем считать, что высота дерева равна максимальной длине его ветвей
-- Определение конкретного дерева
data ATree a = ALeaf a | ABranch (ATree a) a (ATree a) deriving (Show)

-- создание определенного дерева (#0)
tree1 = ABranch 1
			 (ABranch 2
			       (ABranch 21 ALeaf ALeaf)
				   (ABranch 22 
							 (ABranch 46 ALeaf ALeaf)
							 (ABranch 43
									   (ABranch 62 ALeaf ALeaf)
									   (ABranch 66 ALeaf ALeaf))))
			 (ABranch 3
					(ABranch 34 ALeaf ALeaf)
					(ABranch 35 
						    (ABranch 34 ALeaf ALeaf)
							(ABranch 35 ALeaf ALeaf )
							
		
-- функция для вычисления высоты дерева
treeHeight :: ATree a -> Int
treeHeight ALeaf  = 0
treeHeight (ABranch _ left right) = 1 + (max (treeHeight left) (treeHeight right))

-- #2 Определить функцию avgTree вычисляющую среднее значение элементов дерева

-- Функция для подсчета суммы всех значений в дереве
sumTree :: Num a => ATree a -> a
sumTree (ALeaf x) = x
sumTree (ABranch left x right) = x + sumTree left + sumTree right

-- Функция для подсчета количества элементов в дереве
countTree :: ATree a -> Int
countTree (ALeaf _) = 0
countTree (ABranch left _ right) = 1 + countTree left + countTree right

-- Функция для вычисления среднего значения
averageTree :: Fractional a => ATree Int -> a
averageTree tree = if count == 0 then 0 else fromIntegral total / fromIntegral count
  where 
    total = sumTree tree
    count = countTree tree
	
-- #3 Сравнение деревьев
-- дерево 1
tree1 :: ATree Int
tree1 = 
    ABranch 
        (ABranch (ABranch (ALeaf 22) 2 (ALeaf 21)) 1 (ABranch (ALeaf 62) 43 (ALeaf 66)))
        1
        (ABranch (ALeaf 34) 3 (ALeaf 35))
-- дерево 2
tree2 :: ATree Int
tree2 = 
    ABranch 
        (ABranch (ABranch (ALeaf 21) 2 (ALeaf 22)) 1 (ABranch (ALeaf 62) 43 (ALeaf 66)))
        1
        (ABranch (ALeaf 35) 3 (ALeaf 34))
		
-- сравнение
instance Eq a => Eq (ATree a) where
    (ALeaf x) == (ALeaf y) = x == y
    (ABranch left1 val1 right1) == (ABranch left2 val2 right2) =
        (left1 == left2 && right1 == right2) || (left1 == right2 && right1 == left2)
    _ == _ = False